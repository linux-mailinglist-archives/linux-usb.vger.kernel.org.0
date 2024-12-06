Return-Path: <linux-usb+bounces-18193-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A769E6C92
	for <lists+linux-usb@lfdr.de>; Fri,  6 Dec 2024 11:52:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4AF31884038
	for <lists+linux-usb@lfdr.de>; Fri,  6 Dec 2024 10:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 935061FCF4B;
	Fri,  6 Dec 2024 10:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="HFBUGwNy";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="LO/xgI7D"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691A01FC7E7;
	Fri,  6 Dec 2024 10:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733482303; cv=none; b=jam5T8xkUm6jLVQqybVYCJg0Albg4Z+MK6mfg9XUZjEMnpHqB1dSlf5LegeiXY+ZHCijtAXi38rSV0SIqcKCcURXaPncf7ZkLEY4mI463rKZlNKtKKlAKdCopgxCFjcwwFUuFFWRjmhlSWEZ9BcpGEiRu4wxJ+h1qldeVKEn2rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733482303; c=relaxed/simple;
	bh=t52h31sl/lbZN/+m/UKayQavdZKo5RQQdgsiOgkKpWI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ArUwCLskWPW4LnOajk0P5Qka3aEJ1dudV0eJrxElu7LwvnxK9HCnQb6VyRuKGr2kPtyK5TItgwSXE3b9X+L0yN15nzcLlBg7ywIIEGhZGqVR9IX9QTYPPDGLPbWFlP+/o48A8Hi+vM+MvK/6uAnysqsFnPNKDlzMjdXfdG4pzRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=HFBUGwNy; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=LO/xgI7D reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1733482299; x=1765018299;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=F1K6BotclyzmRObSFZIO2A0hKib3MOWsiz+TlXGAmxc=;
  b=HFBUGwNy0VxacCvAJViRLdfvV6vRGWgauK41uSzab5leji2bsdxBOk5J
   qKK2vn3V73yyouhNa3t6ZPb9NsiUr4QOqyYZZ4GU8SAxNkEuRme4Cbbhn
   tF96PZ+su/MbauICHzTeEG50unC/n2a9XMD/fXmaQixEA4292yV35/Woj
   1hIhXtanpE4gVJjph9H3eN5N3zZHzsWmHam6zdjn0wbJO/gj2VORCUjFr
   h3+n+MMx7i8aKsCLsKqf83jutDi4vSpVaFSP0mGhBmsCfu5G0okC+qCtm
   nPqpKOS3JNFv3N2xDt27u17XZBjd5tXlQeLURUURjbzzcHApAKOMHg4R6
   g==;
X-CSE-ConnectionGUID: Nr4ED2PbSn2oGJ8BLG7i9A==
X-CSE-MsgGUID: tUYxYd5BQ4WlWKKikxkI2w==
X-IronPort-AV: E=Sophos;i="6.12,213,1728943200"; 
   d="scan'208";a="40452975"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 06 Dec 2024 11:51:37 +0100
X-CheckPoint: {6752D739-7-90CD5875-E0265C0B}
X-MAIL-CPID: 972FC9E7E870117C395C4F65784787D5_3
X-Control-Analysis: str=0001.0A682F1F.6752D739.005D,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 71066164926;
	Fri,  6 Dec 2024 11:51:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1733482292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F1K6BotclyzmRObSFZIO2A0hKib3MOWsiz+TlXGAmxc=;
	b=LO/xgI7DGn6iDyh5XslOY4AvGoNhHbAMnoOaa7knn6D4ugQoHDBwQHgT/9qPt9r4BEzYV9
	uYM63IazZYWFilFq7/prjw0AXnf7nuWWjdC14Dua5oGfHE2WNB9UC7GcnhqgSf9XXVkj6u
	6bleNTrQ7erBJ6ntD7wvBvse7c4TMqflMhqNfr1MbQRHPnek7p9MQ3XJaSJzD6sY1/fpMW
	r3UinKv+dMXCbpIhSO2s78edpRf+eWPWK0Q6sEuoSdEX2zu0eBcoL7U1tM28FE7FZdHAVO
	zRA+oty+H76aFZTULGw1xRziNCkFWpJd+7E21LaLRSQTDQQqhsxkV1utLdUNUw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, gregkh@linuxfoundation.org, jun.li@nxp.com, Xu Yang <xu.yang_2@nxp.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: phy: imx8mq-usb: correct reference to usb-switch.yaml
Date: Fri, 06 Dec 2024 11:51:31 +0100
Message-ID: <3326164.aeNJFYEL58@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20241119105017.917833-1-xu.yang_2@nxp.com>
References: <20241119105017.917833-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Am Dienstag, 19. November 2024, 11:50:17 CET schrieb Xu Yang:
> The i.MX95 usb-phy can work with or without orientation-switch. With
> current setting, if usb-phy works without orientation-switch, the
> dt-schema check will show below error:
>=20
> phy@4c1f0040: 'oneOf' conditional failed, one must be fixed:
>         'port' is a required property
>         'ports' is a required property
>         from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb=
=2Dphy.yaml#
>=20
> This will correct the behavior of referring to usb-switch.yaml.
>=20
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>

=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



