Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BFE62AEDC7
	for <lists+linux-usb@lfdr.de>; Wed, 11 Nov 2020 10:30:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726861AbgKKJaO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Nov 2020 04:30:14 -0500
Received: from mail-eopbgr50062.outbound.protection.outlook.com ([40.107.5.62]:43843
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725986AbgKKJaN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 11 Nov 2020 04:30:13 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U+jwyfPjr01wbB8quwRczQbyXnL7bIu6cXqni5TPtwjcd6rOHKcjgUzMXlmSqIjzKaN7UUmJtqvD2GniOXuFvNntHQSYCAoiPf6fx/cEXqP+pE6ETrxqxvpG3KMKFQw6G6gtQmo4504dhzBtIMUbrKP8IYKb7KyfLErnSH+NSIj26SSPUXcV70CGXVNBywDgvbwvs1oZIWZdj5OJHkMrY22DCyCvL47n7uB4I6shF43nj1g3WeZ6krtEZqMM7/N3GkTadbDUEWo084/W6zVy+V5Le3mPYWftefgkRDbrfHSZWmxtsS3p4BhnbrOUvb9JAShB9Oa1yRqBo0q+WJN4AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T46p5MHfC2NApbfbnSVyPb59F/BnLGGjf9KMSh1e4T4=;
 b=H8+Jdy2nzgO7LSAyD7kLigXQ3JUYDk8/lklX/qKa2hPWGm3My/2GmH9OlZeHfT+dV199GsVkr9PJTPznD8y8ph5u2i4Z5vfNuImswUt7WkcPbpFZYs4eFDBGswsDPaI9cCOkfLy0lPaE9WhzyB2a3I52APh792QngyiXqNGDtFXYjUWaF7VGH+IbeWYq34NTWfMIEYwE+yAN817uTROvn/dJud6Yme5qfwRv3aZJWUbJ3wZZ5TupWUkX9pKOxP2fcZI5IjjuYZCcLrGG4VA/DDX2p7YT7OBMSLENVnPh4Ir8N9iAN/tibBPtB9/dSihHXqG2TFLPh9ICNAjAiSLcgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T46p5MHfC2NApbfbnSVyPb59F/BnLGGjf9KMSh1e4T4=;
 b=nwtyeHMaDR9l5GOWr1NvWsOUvWcVyd5SBBqUcJ0vFwTj5lnOAe7eCQu5eb8AuHnySEeNYCzgB6W5iEH1u42M3wwbuxj2cVEzxBCP0QuPOonaJ6/mNrvAERJc/kh7HQMa1cSoFch6P3kAGsffmQcLv80uoG8pUVQUiW8Mm8Lt3MQ=
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com (2603:10a6:10:1ec::9)
 by DBAPR04MB7285.eurprd04.prod.outlook.com (2603:10a6:10:1ac::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Wed, 11 Nov
 2020 09:30:10 +0000
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c]) by DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c%5]) with mapi id 15.20.3541.025; Wed, 11 Nov 2020
 09:30:10 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Ruslan Bilovol <ruslan.bilovol@gmail.com>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "gschmottlach@gmail.com" <gschmottlach@gmail.com>
Subject: Re: [PATCH 0/3] UAC2 Gadget: feedback endpoint support
Thread-Topic: [PATCH 0/3] UAC2 Gadget: feedback endpoint support
Thread-Index: AQHWtWS1eBj0g+rqvUaS5l3jJzoDC6nCr5OA
Date:   Wed, 11 Nov 2020 09:30:09 +0000
Message-ID: <20201111092941.GJ14896@b29397-desktop>
References: <1604794711-8661-1-git-send-email-ruslan.bilovol@gmail.com>
In-Reply-To: <1604794711-8661-1-git-send-email-ruslan.bilovol@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 35780912-9bd8-4b20-abc0-08d886246268
x-ms-traffictypediagnostic: DBAPR04MB7285:
x-microsoft-antispam-prvs: <DBAPR04MB72854072A22CA4A4F4013B298BE80@DBAPR04MB7285.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EJlF0740/N8e8hY71yp7pgO+xADf5BnTLsV3+h1CzOI1G+6BJz5nfjXik3TjG09xobnW6L5XFdKvUKyotxG5dIJmqNBw20DlRrRzsTas9LbU578GaAAaf16xReD4RSVAnIPj266iFlLPLfErWGN7rwR3UIZcPSAp5pTt8jeqA9oo/1Hnj5uNHivEXizRwVcXRjhOd+6Q4hMPynKWUTNeJIzjMQpDery5J05s3ES1+qDPAhJCaA+02AbE3OKIaCDzK2ne9djt0RBip8ugRvcmQ6U50n7u7QNPOd52vTj3XV8EN196DryeLfaytR91wzxp
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7979.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(136003)(39860400002)(346002)(396003)(376002)(8936002)(53546011)(6916009)(316002)(6512007)(6506007)(76116006)(9686003)(91956017)(54906003)(33656002)(8676002)(186003)(83380400001)(6486002)(66446008)(71200400001)(64756008)(26005)(1076003)(66946007)(5660300002)(66476007)(33716001)(2906002)(66556008)(478600001)(44832011)(4326008)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: uLE/FRkVpzZuQy+Wd+WZRd0beuC2W3dl4cUi9rTFzHGECQs0dfa5snQ1ImWe5UnT/8IPa79s5fpwMoGBvlPFA3v78KEVdunv74mi0Ee1OAD7C2R+gZ8E3ikd/cYLlzzDb11Efm0Rwv8twzdMxHZoRhL+TTtxR3nl1w9ab61r6MTc4I4JGXZmqizMsSotz+shIrcIOlt/8kTtgr4AFoDHXf1fWIk421uwDA+g/UzUIgMT4YqA+Auhp+5n87iI1Ie8X8xkazS3w7bn27j7VqvvAN5rbca16SneKMRMs6cKGeK2aFaWUqYKu2ilQeluOTgJFvCk7/3uBmgz1asR4J0ue9Jd9UR17H9NdXxpAeIbsYcFwNyaiBDCfie8PNTAZEmzFcOBr1lopxwClrBzU8Rn8H/GffOHRX7buLYcct2y8HPKdS/yfrPKRfEcKAvmtsc52bcU+7UVyjMJABqe9Fg4/TELg/7ThOrrAUdk29TyHmQoBNywJfqfFrxxK6JCBaCWyVbq1GTQ1nD2UhDiKDXTNQlJn04UgDn0YTC3kB8ri5RFPTPw8wBneTZKMumQnceDwlX3m4yT4VfHG87ypzYgTrM/3YqvXvQWhdGK+Tzd37Fsuu+8HcoIxsMi+lsG66JPoo+YAvGWljAh1q3BgSgX5A==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5962BDB37C80364BB349B5D5BD029E95@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7979.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35780912-9bd8-4b20-abc0-08d886246268
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2020 09:30:09.9672
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FX/D+ADZprKm2UPtCy5pFcpPoNzQ33rm+BkMHxY9CbSsa86nt4mn9wVJNKGjvDQx9QLkI1/+eOlqgy2h+P5BkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7285
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-11-08 02:18:28, Ruslan Bilovol wrote:
> Current UAC2 gadget implements capture/sync paths
> as two USB ISO ASYNC endpoints (IN and OUT).
>=20
> This violates USB spec which says that ISO ASYNC OUT endpoint
> should have feedback companion endpoint.
> See USB2.0 spec  "5.12.4.1 Synchronization Type": asynchronous
> sink provides explicit feedback (isochronous pipe).
> Interesting that for ISO ASYNC *IN* endpoint respective
> feedback isn't required since source provides implicit
> feedforward (data stream).
>=20
> While it's not an issue if UAC2 Gadget is connected to
> Linux host (Linux ignores missing feedback endpoint),
> with other hosts like Windows or MacOS the UAC2 Gadget
> isn't enumerated due to missing feedback endpoint.
>=20
> This patch series adds feedback endpoint support to
> UAC2 function, new control to UAC2 mixer which can
> be used by userspace tools (like alsaloop from alsa-utils)
> for updating feedback frequency reported to the host.
> This is useful for usecases when UAC2 Gadget's audio
> samples are played to another codec or audio card
> with its own internal freerunning clock so host can
> be notified that more/less samples are required.
>=20
> The alsaloop tool requires some (relatively small)
> modifications in order to start support driving
> feedback frequency through UAC2 mixer control.
> That change will be sent as a separate patch
> to ALSA community.
>=20
> Also added ability to switch ISO ASYNC OUT endpoint into
> adaptive endpoint which doesn't require feedback endpoint
> (as per USB spec).
>=20
> Ruslan Bilovol (3):
>   usb: gadget: f_uac2/u_audio: add feedback endpoint support
>   usb: gadget: f_uac2: add adaptive sync support for capture
>   usb: gadget: u_audio: add real feedback implementation

Hi Ruslan,

I applied your patches, but WIN10 still can't recognize it well.
The UAC1 is OK for WIN10 with the below same configuration.
Any debug information you would like to know to check it?


if [ "$FUNC" =3D=3D "uac2" ]; then
mkdir functions/$FUNC".0"
echo 2 > functions/$FUNC".0"/p_ssize
echo 48000 > functions/$FUNC".0"/p_srate
echo 3 > functions/$FUNC".0"/p_chmask

echo 2 > functions/$FUNC".0"/c_ssize
echo 48000 > functions/$FUNC".0"/c_srate
echo 3 > functions/$FUNC".0"/c_chmask
#echo 4 > functions/$FUNC".0"/req_number
ln -s functions/$FUNC".0" configs/c.1
echo high-speed > /sys/kernel/config/usb_gadget/g1/max_speed
fi

--=20

Thanks,
Peter Chen=
