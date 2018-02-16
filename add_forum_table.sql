--
-- Structure de la table `fiche`
--

CREATE TABLE IF NOT EXISTS `forum` (
`id` smallint(6) NOT NULL,
  `fiche` smallint(6) NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `timereponse` datetime DEFAULT NULL,
  `reponse` varchar(1000) DEFAULT ''
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=192 ;

-- --------------------------------------------------------

--
-- Index pour la table `forum`
--
ALTER TABLE `forum`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour la table `forum`
--
ALTER TABLE `forum`
MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=192;