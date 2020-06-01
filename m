Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E61181EA391
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jun 2020 14:11:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725935AbgFAMLm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Jun 2020 08:11:42 -0400
Received: from mail-eopbgr00073.outbound.protection.outlook.com ([40.107.0.73]:62279
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725838AbgFAMLm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 1 Jun 2020 08:11:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mMfWT81wj0ZBTpVoTdyS3xWRidG0ulwKor23gHzr8DprH24br5cv7XJctpl2Mve+niXjuR6+BAJG/hJTb/jkMPvdx1N3/J5erMSYX/OuVvgaVHku1cUZefNbkmjR2AsdMKWC3LBNAyh0EIGxp8soSF+VbkTx2FV1aZZOvPLLLx0XN31lwEuxbb5p2CsGdHsYKww0P/zztLE9SyQFmwImd5Snnco73/PHtHSe+jgKkOITFcReYe6LgSR0E2yFPb5XbFRznv1VBvvvBzImfjhzo4Mrke7jJVKd2mprVANCi0yQfckHY/Gyk9Ge+u5u6fzJcJmF57Ito8MhJArILb9Vwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Ay0nBN5BJ0Ot0GmRmGu6H4DUIowVZqQF17sL8zUXHk=;
 b=DU/sSc1IVNHP6nw9mb6jrX66M4KFxcJr8cqtgZGxjH58FTAI9hkOgZYN9yqt7LEsno3TT6LAr0ti8w/S87dmPDA19o2hgb39AFMHHldQN3dExuLXYhW+x9qerpfTNT8wweLYP1mSAWNbQTpi0h5AbEknFS5GnHtio2a4yew0HIzm0RiDnSaFy16xO4oFFvSPVGlh8yjsWcuMxbCNxtM2c1VDEIZ61rU65lkfYicLyBbxIFRAEi0nySRo9Wovpp/aWEJjx1CdH9ejq/ZaeSeP5n71A6nzkr9ZnuuBpLvEBUOLnAuYjSan66I2SC6nRW4NzFIUHNYKEL9kHHlVCjTYsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Ay0nBN5BJ0Ot0GmRmGu6H4DUIowVZqQF17sL8zUXHk=;
 b=cu7A1b+YVgAjMBeMFi5T9T3njK7EcsSWa7sJW5IfnEWmwSkJhI/NHZN35CjBrM0LIPB3XwMalkHNLeip6qLzTbC0SAgbdb+kIqWUkMUdfxqKDwXb8DOfOENOpt+QXJBsXZGUC678uG/wHtjJIKnrmy8nuUVGHRL1MDZgv0RSCwk=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB6903.eurprd04.prod.outlook.com (2603:10a6:20b:10d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19; Mon, 1 Jun
 2020 12:11:39 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3045.024; Mon, 1 Jun 2020
 12:11:39 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     "pawell@cadence.com" <pawell@cadence.com>
CC:     "rogerq@ti.com" <rogerq@ti.com>, Felipe Balbi <balbi@kernel.org>,
        USB list <linux-usb@vger.kernel.org>
Subject: about L1 and resume operations for cdns3 device mode
Thread-Topic: about L1 and resume operations for cdns3 device mode
Thread-Index: AQHWOA3NXrcpseqaX0yBsLuOgpT/QQ==
Date:   Mon, 1 Jun 2020 12:11:39 +0000
Message-ID: <20200601121203.GA31750@b29397-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: cadence.com; dkim=none (message not signed)
 header.d=none;cadence.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f89e7640-8e33-435f-0bbc-08d80624f062
x-ms-traffictypediagnostic: AM7PR04MB6903:
x-microsoft-antispam-prvs: <AM7PR04MB6903CEC9CC62BE6EBE41B5808B8A0@AM7PR04MB6903.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0421BF7135
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AywHtcJ9dBMPp8RKheizawBcN1bDIJXO2w1xl44WC04ME9PqSdl0ZS5ot6Knl5mGAZqNqMSB7bLmOjbEijSfhLF8ayy8tMIWj7xbLordaFwOrW4m3BscgiJ+OO2xFRW7AuT+XDcd9vs88XX/FDC+BcRV4QdCK8jBQMXUV7FBiaenBBLe73uO8L3YQnenK3oAbfMr17ET2rOhXugxDha5b0REwnpPgho/ZnMyj/N8WKzcuDsNTLUtlW7VCekO31CoHuMrdqyGCEH1Xw7eddx/UwhetdOp/hPVCu7x3CRlLUo6di4/aCHwdSTR4kQYy3W44B8qhum+Fd9zP6+Sl/lxSIOWzYtmuUw9GGtDic/gd5b2N+y46lb6Y9MRkauAyKq0dRS7Izr+EmUZy+If+/xk9g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(7916004)(376002)(39860400002)(346002)(366004)(396003)(136003)(2906002)(71200400001)(44832011)(6506007)(186003)(86362001)(8676002)(316002)(54906003)(26005)(966005)(478600001)(8936002)(6512007)(6486002)(9686003)(4744005)(33716001)(4326008)(66556008)(64756008)(66476007)(6916009)(66946007)(66446008)(76116006)(1076003)(91956017)(5660300002)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 9u/7MFcy8LbGDo7jXIUu/t63miz/XrbjB98LOxvJs8Jy+8rTEm5jo4Go3V3SETPT2LP8H9f7GRNiKQnZ1aXIG2VevVDCAkzUTKS7sBaS5ichpAycHcA9NB8O828agh7y5SMgt3jc96q84Tg4Of4wg2aytmM7e6hUTuLouRIbQ67n9iszMN18BFuYshsdQ49mDr34Bu9iXdD6PFlTihTVbvFPnLzGBgZ5H929lFj4sWI0Fez34D3zFJK4RclvRYGEsZaSXc5Q4TwPDniNrRDoo/5oiUibKRyyIdmgKBpprTyjupx2DQiMkejlKoTXZKF/oSC08b71zD2vgUTI2lRP9cc0rOF2KIGzKwee78ODv0f9oJDLCjv9JDTorrh8H6fFEEJlbEgNNSrOfDtMj85k4cLmqp7fH98qopuRwKHtxJKxcCh2shWL0ISASlvzOTmEet7oCoP73IZEFTwLxau8/LM/ZcJLAPfwH8GMZ2I5Ft0=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9C6307D1A301AE4E84151514EC65B030@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f89e7640-8e33-435f-0bbc-08d80624f062
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2020 12:11:39.3665
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8CWVjOT5vYQDZwWFCKRzX5w3K3TLjIBj5QLTk+Vj49J6jxLMspmFtp9UoC2EnWh5hzEtwHCi/O3y7zD7tpZICg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6903
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Pawel,

At [1], you talked there are some issues for current code,
I checked code today, but still have some puzzles about L1
operations for ep0. There are three L1 operatons at ep0.c,
I could understand the one that enable L1 after set configuration,
could you please explain the other two? And if there are
something we need to fix? Thanks.

[1] https://www.spinics.net/lists/linux-usb/msg195117.html

--=20

Thanks,
Peter Chen=
