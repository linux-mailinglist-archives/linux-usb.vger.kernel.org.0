Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A708279DCD
	for <lists+linux-usb@lfdr.de>; Sun, 27 Sep 2020 05:38:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730096AbgI0Dib (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 26 Sep 2020 23:38:31 -0400
Received: from mail-eopbgr50053.outbound.protection.outlook.com ([40.107.5.53]:26437
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729125AbgI0Dib (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 26 Sep 2020 23:38:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cRnxS2j+6xKQSFBZBMC/TW0A7iEtiWM3xdsuLf5toN8Fa1sy05liWBsbF8FNuuHQ7NfdfZ2VC+v7VBPK9y3jQWn9YUrEZO9GOgQPCJJWNMV564ldPfQJztzafhnkMkXE8pVDDYU996I7tmqelUdLP3f0vP3lSXS5GdqW1XmpLuFWYHt/a/0DYi1oIwWhM6YALrc4Rb++vvzzbyludtgm0OrWse8LwPKh/zt6mF/ruesr8xT9rj1udmQY3VtWo2S8ICa3DV+Pm021DMuekQ3L15+G7KBDVltmn7ngWn1fXjU9csk0/P+aCWN9It4XItNeCBvv0TIy49ugNY5diOVdUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P+LVAnP+TIoCIAFx661we/MFbV0ukQfofj9L5tWBKJQ=;
 b=cML/eRaeSLzAHlNWzW5bsHF2aHwCVLm/Rg0MXDgbppLfp+8/bdTzKc6dwmP7XasQiI8uO9LQ76t4SMCMMOIsc8zRvoh/ywzSI1WAZt3A/l6YGoM4QE1wPRBAy5gZ+iMsTdyeD6I+4CdvHmSlIRkMAOmespyj9alYLfsgxmZjgcMQcxoU7Qo0pZnb9UroAYLv0GxDu8CZzi+9cA0QqSO4XTPd2JQ33ROk9q3pNADSYRnq0xzLElXR2a+oOGTfARG28XS6VTwD8iPgTywcmAco/p3NMFtDo57RquCwwfWvai16trbXrCrNXfMF60rELs1lH651Lp/GJyE8pOLH2LWXUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P+LVAnP+TIoCIAFx661we/MFbV0ukQfofj9L5tWBKJQ=;
 b=HGHFm9KcFWwQqIj4JGpkhgTprOyJd0Wb+T75sCb+Sw5G0cN35yGX6irG3k2f/sVNe/YFRfxznYr8nVQmU9YMI5qHmkWKxusoOvr99zndKZQl94hcFj0vnugDkPNvSHfP3lltuRzCJnR0veMuf8rOiBbcBVE/nPmMekHlM1iA12A=
Received: from AM6PR04MB5413.eurprd04.prod.outlook.com (2603:10a6:20b:96::28)
 by AM6PR04MB4039.eurprd04.prod.outlook.com (2603:10a6:209:4d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.25; Sun, 27 Sep
 2020 03:38:27 +0000
Received: from AM6PR04MB5413.eurprd04.prod.outlook.com
 ([fe80::1953:c81a:cca2:60ec]) by AM6PR04MB5413.eurprd04.prod.outlook.com
 ([fe80::1953:c81a:cca2:60ec%7]) with mapi id 15.20.3412.028; Sun, 27 Sep 2020
 03:38:27 +0000
From:   Ran Wang <ran.wang_1@nxp.com>
To:     Sid Spry <sid@aeam.us>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: Enabling Device DWC3 Device Mode
Thread-Topic: Enabling Device DWC3 Device Mode
Thread-Index: AQHWjU7JiBHQvCKfrkqZwjWYHFt6aqltlBoQgAAjIQCAAAMm8IABvwsAgALPUbCACZeugIAAAnFg
Date:   Sun, 27 Sep 2020 03:38:27 +0000
Message-ID: <AM6PR04MB54137833CDD01B7EF537B131F1340@AM6PR04MB5413.eurprd04.prod.outlook.com>
References: <8d9ea8e7-ef9f-4d00-8ca0-b624dcd91de1@www.fastmail.com>
 <AM6PR04MB541315E1AF4DB7DEF9F3D2BBF13F0@AM6PR04MB5413.eurprd04.prod.outlook.com>
 <63692cc0-4df0-41d7-8889-a83eca7fd806@www.fastmail.com>
 <AM6PR04MB5413A79BF32C07041B1B7B70F13F0@AM6PR04MB5413.eurprd04.prod.outlook.com>
 <0aa35d4b-50f0-41e3-b12d-c59b1263a5cf@www.fastmail.com>
 <AM6PR04MB5413410663D6DA1551718833F13A0@AM6PR04MB5413.eurprd04.prod.outlook.com>
 <37409492-9881-4cd2-a4d3-a0e3bea91c36@www.fastmail.com>
In-Reply-To: <37409492-9881-4cd2-a4d3-a0e3bea91c36@www.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: aeam.us; dkim=none (message not signed)
 header.d=none;aeam.us; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d85318d0-24a2-48d4-7c35-08d86296cbdf
x-ms-traffictypediagnostic: AM6PR04MB4039:
x-microsoft-antispam-prvs: <AM6PR04MB403976708EBE434E9BCA903CF1340@AM6PR04MB4039.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YJ15ykRDz6wAkhqsmdlx8NiNAnr5//Z23N5CkOqbDQGeKsp+1PbejvNoPoUEiD7umRlvKPoAc4zTt8bk0CR4DjHVZXUDsRn/js8PQyiSXVz8fCmbrxCm4+0zusLTUK3Ba6MioX0atAh9jy+uSQ6IM2u5DGsD2jRkte3gxaBymdJSl7tgm3IrsG1cEsyQKE7hIYkGp+nJ+ki4oo9kUR5ZxyHCxo67c+FnWcg08SDz6HLRIrKvndaeXQhjyIeumTwjh01MS7MgmanhIj+1rs4KjNgZ1LuzrBjmgK8G6w9vpTHs2qtZWN8qJuifvydzOxnPzzfuarJFj4M7622bog5qLKLOvJo5hTBRVCL1/NmulBzuACp83oin8z9gnj45Dbg6
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5413.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(136003)(39850400004)(396003)(8936002)(478600001)(66446008)(64756008)(76116006)(66946007)(6916009)(33656002)(52536014)(86362001)(66476007)(71200400001)(316002)(83380400001)(66556008)(9686003)(55016002)(186003)(2906002)(7696005)(4326008)(53546011)(6506007)(26005)(8676002)(4744005)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 3tCDMgG8k9yZ4ND53sLH/9Cs634D+qo9EcQ7cbWiNWUgMZ28VscPMGQxSr3hfCUWzlMjQf73GufRDYqs5m6ATeb5HnwYxd2RX2uWZLbzZHHStW9JCwx8EXchMik729DeOoNK7/PpebwW9XYLFQTk/FGCn8MgxUn6864Ts+AIaoq580EriXKylot9ivlDwbZA5Q5qPwua3yhwOAgbDwEUjnbgPILUbG/X5L9ASTu9/KyHk5WMRGSInpup3J3i4/R84vnkzf5WuUs18hgB90QRnlRpOQ2Ydka8qAMlVtDYJzLcmHoa8MHqCL9HK8Vz/ek9f1sq3OM5d84ofLt15htaVyBU7sRrwxps76mjhhe0aV5ugJT57Xe/hLGaQbh64C9SG7Ucs+FUboojb4rHuutcdbXHqUZexvIiTK9aSZB0seS3XD+9uO7G8SHtVlumlDM82mBX/6P/IPnO6hDugxpdjZT/6cuyh3HjyRvYOyNHWJucY4ODG50dTokFzan939af/0+57cbILilN14wLfUOngCMdt4XWCtQiePQJlH73d7q/uUn/2gZO/1EnZPX3TNyazYerRcrXewUyadey+NPxOPzS3Uw3xD5fRkUFq0bLbVFQrtaDBDfFr71AJbwdPOGP8vyCN4Roxc+I315eOknzpA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5413.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d85318d0-24a2-48d4-7c35-08d86296cbdf
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2020 03:38:27.7453
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PsCLBjBccbMkhNE5MtbOrJ5Co5GOhaiEShxE8YN43zSR62VsVmc16X3FnD3lQ03NqgnGZb/IFocnUwoHuxA6FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4039
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Sid,

> -----Original Message-----
> From: Sid Spry <sid@aeam.us>
> Sent: Sunday, September 27, 2020 11:23 AM
> To: Ran Wang <ran.wang_1@nxp.com>
> Cc: linux-usb@vger.kernel.org
> Subject: Re: Enabling Device DWC3 Device Mode
>=20
> Hello list and Ran,
>=20
> Well, the error I saw in dmesg about an unassignable address is something=
 I
> had only seen one other time when a device was miswired. I flipped the US=
B-C
> connector over and it started working in USB3 ports, but at USB2 speeds. =
I
> thought of this days ago but figured the port should be handling it...

Speed issue might be HW related I guess. My understanding is that speed
handshaking is handled by HW automatically, does host have this issue?

Rgards,
Ran

