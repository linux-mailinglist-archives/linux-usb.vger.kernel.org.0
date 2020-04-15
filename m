Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E0491A9AB6
	for <lists+linux-usb@lfdr.de>; Wed, 15 Apr 2020 12:36:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408733AbgDOKfI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Apr 2020 06:35:08 -0400
Received: from mail-eopbgr30044.outbound.protection.outlook.com ([40.107.3.44]:14978
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2408666AbgDOKcL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 15 Apr 2020 06:32:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mcpqH9eK5BB4nYmSnwn60F0jlEE8TbY87TnGN87AkNAy0/w576vj5e+Id4qqbrZnld75G6AOsqLwN/n1nxQnO77YFOIcbmWjkQq1d2gC95EF6khy2KKQp4g0jtEXsJvFOZA6YSnnnOjTJXRuZHqsJFsG0QqDvYZ/5tYQUp3dMiSz9f30okrA9w30YjnYRqTmd62I2S/+0fERMLjiyizIHjJyqQGMacxMJR40A+zye4dWpWx84ke8VRUAOJo9ReeiJ4JKHn2AFbIKeGIltmMhwywXRQ8OBeopQIA90kdq2m/8KGnY12eNVT9YpCrZBEOsm1RG6yXMxD9UY7PUJd95Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Og3ATewj6kWJeIeN8l+7Yi5f5lCmPJXlCR0Oa5GkLAY=;
 b=fz+pD7dlciQXKeKHrFjdvokEp7auQwnrS9lh4qu9ROkONF+NeskbgGmgxJGzO+nkaMCWoWVsyVOb2YNG+kOK9padFf1Keg2qXzTdFLX34TJwYlAk4TbvN1fsLq+xTbGbpRwV4/EYL0rCGkjqSAsV60qsKpnJdFlccZTiIZPEi7yHipX1b6LskHtpVEqySaqsAHsmaz/3WmVltzJZNX5ueVpLsf8UxqjyO0v9vW4ZcdH/yxXo73VBTdfCmUDPiHCJGh/5sJokoWQkBesfjBB37BThIPteonuiqXjG9cF2FtIZJJoVqbgVmojHASk/2ve1pixaNQzaRb2NZ1EQKUH2dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Og3ATewj6kWJeIeN8l+7Yi5f5lCmPJXlCR0Oa5GkLAY=;
 b=K5nAgsd92zm7u8Gf9hP/yx1n2taSFiaqGlf+h0NwIKMwww+v0zG1r6fc69Rq4bqNtUkgvp4JWoLNWfxR4RLrkLQMHcPvtEq+iCskq0iGvXgjvhgDCrmwo9DC60H55f8jTAh/TtVUdQ7uPZ777bDtBO3eO04VDTUbGM+F9/ZbGpU=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB6839.eurprd04.prod.outlook.com (2603:10a6:20b:103::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.17; Wed, 15 Apr
 2020 10:32:08 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::7c34:7ade:17d0:b792]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::7c34:7ade:17d0:b792%9]) with mapi id 15.20.2900.028; Wed, 15 Apr 2020
 10:32:08 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: No disconnection event for suspended device at v5.6
Thread-Topic: No disconnection event for suspended device at v5.6
Thread-Index: AQHWExEdF/RbB1xlJUuHFbQ82dXD2w==
Date:   Wed, 15 Apr 2020 10:32:08 +0000
Message-ID: <20200415103232.GA5609@b29397-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a9a36551-7506-41c6-e92a-08d7e1283ff2
x-ms-traffictypediagnostic: AM7PR04MB6839:
x-microsoft-antispam-prvs: <AM7PR04MB6839A6347D903906D7E2F4F28BDB0@AM7PR04MB6839.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:541;
x-forefront-prvs: 0374433C81
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(7916004)(4636009)(396003)(366004)(39860400002)(136003)(376002)(346002)(5660300002)(8936002)(66556008)(6486002)(8676002)(81156014)(66946007)(2906002)(71200400001)(4744005)(6916009)(66446008)(64756008)(478600001)(6512007)(4326008)(1076003)(6506007)(76116006)(86362001)(9686003)(91956017)(44832011)(26005)(15650500001)(316002)(33656002)(186003)(33716001)(66476007);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CuBnedmViGvIFo/CTi7fL8PQh0dvxa8pwSMnXVE8wkYJxqxMK2iDF9WIntDRsdWgNLpe+x9CvebMrFAKGd+vcb1tGZ0TFoZodIggBGMOxTuyHpu12S/kqy251onbbgetE39EXNoE7na4ox4ZYZ8JuRQdlMWWVgO57zifMIV+odPIYGHFjQycs4a1Tb7mMB76b3YZZsTtgzghGhiJ56K0j8ZtOBZ6+1qI396wZsoqlv6TYIDhlcee4xp2rBUPNUsIEWcNzqzmYSuHz9SjF+jzZceN9J4oVTS6o0Eex6B6hOQnFJN2H0RNaNpw6/SGpdHl+wra/os2cw/I4sMdn4h+oPOfsqtGx5HAxRs1CkU6HOQye0NTqrG0p8WtfxeWfEME5vgWOj7hwy9UDo+w2G11C9sfJ31J0ldIwzqXLOfbdtR08cSSqG2TSSwN65d9E5fN
x-ms-exchange-antispam-messagedata: DM9uwNP5AQT8TQ0H7XNn1WUAOrtagNtgrEPE2bDkKk7egjZSSZmIsTEBpoF19qvg4rMtjVjUXI1GTy/3gbJVVSvd4eMMkRHa5NHDz9ZuluE6FQASoKX2o0NaJ1ErVWDePt04lhSaWxnxjDNreUrF3g==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F8818EADE99A114EB68A3904C1D0F690@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9a36551-7506-41c6-e92a-08d7e1283ff2
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2020 10:32:08.2556
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vYmzvjn+556VC1SOFoSHptscJA4LzFrTFFL7enr9J3h+DtYOrXofG2+Ir+1dIhscTqy5QQm0cC4W8Y12Op7MPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6839
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Alan,

With commit e5d078af8e5f ("USB: hub: Don't record a connect-change event
during reset-resume"), the disconnection event for the suspended device
(eg, removable hub with no device connected, auto-suspended mouse) at
roothub can't occur due to no hub->change_bits is set. Below is the
debug message:

	imx_usb 30b20000.usb: at imx_controller_resume
	usbmisc_imx 30b20200.usbmisc: wakeup int
	ci_hdrc ci_hdrc.1: at ci_controller_resume
	usb usb1: usb wakeup-resume
	usb usb1: usb auto-resume
	ci_hdrc ci_hdrc.1: resume root hub
	hub 1-0:1.0: hub_resume
	ci_hdrc ci_hdrc.1: GetStatus port:1 status 1c00100a 14
	e0 PEC CSC
	usb usb1-port1: status 0100 change 0003
	hub 1-0:1.0: state 7 ports 1 chg 0000 evt 0000
	hub 1-0:1.0: hub_suspend
	usb usb1: bus auto-suspend, wakeup 1
	ci_hdrc ci_hdrc.1: suspend root hub
	ci_hdrc ci_hdrc.1: at ci_runtime_suspend
	imx_usb 30b20000.usb: at imx_controller_suspend

--=20

Thanks,
Peter Chen=
