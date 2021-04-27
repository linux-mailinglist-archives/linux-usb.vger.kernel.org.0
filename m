Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03E4F36BE85
	for <lists+linux-usb@lfdr.de>; Tue, 27 Apr 2021 06:35:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230224AbhD0EgS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Apr 2021 00:36:18 -0400
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235]:53462 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229535AbhD0EgR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Apr 2021 00:36:17 -0400
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
        by mx0a-0014ca01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 13R4WEDj008133;
        Mon, 26 Apr 2021 21:35:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint;
 bh=GNhymNWgzGGsbdy9RRwlu1MPg8D7pj37MY6U+CuHyA0=;
 b=IGTlHpsCN02IJAaD1Cbq2/qCqKq0UBMvQj1GnV8VMfIV2Q95lWoFH+zx2ZfqPw6c2E+g
 HAX/byWkNUclXMtVRBhvESArlUg1pjWKcbKiDMl9KhJScTrtkPunLFvBnlbChTfLhkI/
 RPlGeV5fxM39/dClk5J4yIOSiQNDAq49fYY1znTl7ZX95HpLu5kX2vRYjJPjms3si+Yo
 XDOkbeJu/lOMUwaEgYQRHRn3Hn185BeCcl2juzj9b+aKTXtaJOI8iMkirTeOBcJxza/M
 58AplVQQ8RiVUbme9rRz+she+6YPQpIsmgz59yY5ywAmxFpWkZMoRv/iaCVwkn7A88iW xw== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2109.outbound.protection.outlook.com [104.47.58.109])
        by mx0a-0014ca01.pphosted.com with ESMTP id 385rnp3uf0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 26 Apr 2021 21:35:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iEYsAKr+Ia7b2MvSwi81g4Ro32nlGqkdUltdji3pg+E/53h5RQzciWAI99mHyQTCGX6bVfPfeP5Dn4PQrVSRVTlvIPDK8MpqqupPsaY6A8LfJgJwUF8FNIX5j5CBHEL40a8fJJDPZOnSA+Kw/PjNM1AfcA8xp8FlEvR6ZcnIcbrYTlePGP5ZQx/miqrmmXPwjBfzTHttjMbfvbO7o02Ew/V/6hf7lRImyzc1xq4iVGBRe8TcXFyZ6mMzlxe+U00Bc4UcJSvaXSHMt1G0evpSDHQYFqZJEK1nj21CFhenG+M7B/lzhcvQu+CPwZw2M21GDUey7Pk3Shlj1rTBMlD0NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GNhymNWgzGGsbdy9RRwlu1MPg8D7pj37MY6U+CuHyA0=;
 b=nErzpJUjlWSAgrARvx2P4VcH323LHYpXajhJu2n031guJn0eZq95q95ol6SPqflRULobHqcEA1wZncV7oYDqJ53ePd/pteS7Xbc7J4O9gTrth4u6QC0YjGkqstLJVSzh93qgvQbGIPt/a8HDeqPXL8RIZArN9WP3qIoZuqq6vFcoDtqJTSAX+irf28lWShdinrVzUmPQzKzxODNrd+WaXbq8CSwyp8lTTCvTSSGEVhpbTTGXgNys/3ILasgcwcATBak6+yQspZOipRgCQtlDoZ2dNPU1FLiLF4ceKlBGFLfIacVEHFRXab5KasNVC6UU+RiCSQQMbwleyJ6ncFlEeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GNhymNWgzGGsbdy9RRwlu1MPg8D7pj37MY6U+CuHyA0=;
 b=hIYFb1w1rxzC9gulaSl+efIVbtOy9AvNiGCEFI7YXjx/E9YbslYhhspU7Wf1alilAbhuzifJA+taycCUcnBkBjvEvgY/JkkKQLd5KeGx3eX4+i9B+k1IKVojuS4ZhDdf3jwQOFKZ/P2orUMxE/A8wSyDQ3rkd71oxKuKFxjPNjs=
Received: from BYAPR07MB5381.namprd07.prod.outlook.com (2603:10b6:a03:6d::24)
 by BY5PR07MB6738.namprd07.prod.outlook.com (2603:10b6:a03:1ac::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.25; Tue, 27 Apr
 2021 04:35:19 +0000
Received: from BYAPR07MB5381.namprd07.prod.outlook.com
 ([fe80::5a:c16d:31b1:bcd0]) by BYAPR07MB5381.namprd07.prod.outlook.com
 ([fe80::5a:c16d:31b1:bcd0%7]) with mapi id 15.20.4065.027; Tue, 27 Apr 2021
 04:35:19 +0000
From:   Pawel Laszczak <pawell@cadence.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "ruslan.bilovol@gmail.com" <ruslan.bilovol@gmail.com>,
        "jbrunet@baylibre.com" <jbrunet@baylibre.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Rahul Kumar <kurahul@cadence.com>,
        "peter.chen@kernel.org" <peter.chen@kernel.org>
Subject: RE: [PATCH v2 1/2] usb: gadget: f_uac2: Stop endpoint before enabling
 it.
Thread-Topic: [PATCH v2 1/2] usb: gadget: f_uac2: Stop endpoint before
 enabling it.
Thread-Index: AQHXOldvFRRdtAIyyk+IaQjTTQ1Uk6rGl1kAgAABrkCAAChmAIAAIPmAgAABEoCAAN5xsA==
Date:   Tue, 27 Apr 2021 04:35:19 +0000
Message-ID: <BYAPR07MB53818C8D0BF96BAD15ED3918DD419@BYAPR07MB5381.namprd07.prod.outlook.com>
References: <20210426044815.5393-1-pawell@gli-login.cadence.com>
 <878s55l50t.fsf@kernel.org>
 <BYAPR07MB53814E672CF41548418248C1DD429@BYAPR07MB5381.namprd07.prod.outlook.com>
 <8735vdky1t.fsf@kernel.org> <20210426145047.GB365717@rowland.harvard.edu>
 <87zgxljdua.fsf@kernel.org>
In-Reply-To: <87zgxljdua.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNccGF3ZWxsXGFwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEyOWUzNWJcbXNnc1xtc2ctZjVkYmIxYjItYTcxMS0xMWViLTg3OGItMWM0ZDcwMWRmYmE0XGFtZS10ZXN0XGY1ZGJiMWIzLWE3MTEtMTFlYi04NzhiLTFjNGQ3MDFkZmJhNGJvZHkudHh0IiBzej0iMjQxNCIgdD0iMTMyNjM5NzE3MTU2OTk3MTgwIiBoPSJNWE95WEErTEhUODJZQTB1VE5Pd0pFTFhZMTQ9IiBpZD0iIiBibD0iMCIgYm89IjEiLz48L21ldGE+
x-dg-rorf: true
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=cadence.com;
x-originating-ip: [185.217.253.59]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7c3e7475-16db-49c6-af6f-08d90935dcd8
x-ms-traffictypediagnostic: BY5PR07MB6738:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR07MB6738BDF604B5B43815597927DD419@BY5PR07MB6738.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8Npry61qdYwYCm/9pVc3atibSK0dIk+5FikOew/kil767JqIFfwE7V+IBxs8DWj8yUOD7LHJdhUq3twEd9NrpPgwKyF06v5lV96Uo0apUiyqcqTHJLZ+UjUfT26duVI/K+RZOy2jdrDT44i1vV/0cqIm4r/HvlHI1d4e7x03VVftU7ebcSq9krt2CKs1Rdg9LfzROUT+U0LfyQ6Fii4epL/2pLy4N7USKtjGvkcmlVUF/nMCU9rOMxKgyYJhlrFaD5lcDS05wJyJsxyx33WU+DALVUgerZTLFXIF00f1bP/W/eBamJTTzqmfC1+RtGpbEDwrAdCOg7pNX1GHHw31LXwrDj6E2oZVatZPmAnDb114u6mn2LrdyjcpAXiRY/+PmAIPcl9vYECHyLzLgW7c5jupxDSVPYsbPioHwDaloZ2nyz8SIh6g+VBwpkxybI3yawKyYSntw4DKzDvUgyUabErKmmZh3oBKWaSSc/aHvnJJOOo5rFPaK1vuoj57YnT4oHA5QEuqkA62NEw+22/2Lo4yvJ2QOcKsi0HvmwwCdg1kHdcZ9OF64yu3AyewhIz6cGLciILs94pha935Il5cAt6w1BeFyrvnOPf84xTk9pIXDPvXxYreNBhGGBs+3H0CB42JhSJMH6LpLXYdy82EbsQ+QocILtQYEvEGy602aG8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR07MB5381.namprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(366004)(376002)(136003)(39860400002)(36092001)(66946007)(66556008)(66476007)(64756008)(66446008)(71200400001)(52536014)(86362001)(38100700002)(6506007)(122000001)(54906003)(55016002)(9686003)(76116006)(8936002)(478600001)(110136005)(7696005)(8676002)(5660300002)(316002)(26005)(83380400001)(33656002)(186003)(4326008)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?2ZoHSJxVrVRoNEi37lVkUp5ZkEnzMmo5NuvSbKWqS6vKkACwrKFynPdsIx3u?=
 =?us-ascii?Q?nguV3Zbl60kovemBcC3Sfge5abvnII/ok+J1oQK93Zlkpw8DlZP5Wmg+/Bh2?=
 =?us-ascii?Q?e5u670lquUQhNzgEEF8z8r9hu14utoEgx6HTORaWTRz52/scE8Rfmup/LK6T?=
 =?us-ascii?Q?3EfUWZWrYwW/wYxlEF8EkRYj2xNj91LRPgkQmry/Y9COcc0SGMwxtjGrFKmG?=
 =?us-ascii?Q?Ua6sYdnxlR8PEhzvpxr3toSPhJRNWfAPM0Fh0+W3Gp8rljHlgZpM/Ox7sdAL?=
 =?us-ascii?Q?YiA/9lZhHv2W0tQ3ii0WGQkG4PQo5EBFK2E8aYA2sUEPGHe5CqDUCGL0aYe1?=
 =?us-ascii?Q?C8QvG6eURkuOtgzCFgIJ6+iAwvM2TTaQCKduoT2bn0kminGklkfuFRa1eJZ2?=
 =?us-ascii?Q?YrggEuxy2nmnLoCwhh3VV5iTqTdG0RNHk6XvFoeNEudB9GoQKN5UpxUcf6OR?=
 =?us-ascii?Q?oXaljoYOKCUyuzHJRknbyznGanFvRM46677JOfh7fDbB/Cb0qoCQQJ+7WAsQ?=
 =?us-ascii?Q?89/WzzbaeZj8I49GcfqLTNGTLMqP7IG1dN4yn4Sji2dR23+bvgXy0N6GEmx6?=
 =?us-ascii?Q?yolM3zvFBWcu3sAAlCquQlhw0QMwV/FQK94L36T4w/BQViQpZ6C2hDnU4Fuu?=
 =?us-ascii?Q?PoZW1cwHIwUFCLZ/RDqtZJQXLyx9rrnh8jdQZFrvHYV02Iw9oWzSUPg/8DeO?=
 =?us-ascii?Q?sxkNJ2/kujOukb36e4+lRFrJabKIYthz8urqsrGzqUIfXcqT3YQxhsDzsrDP?=
 =?us-ascii?Q?HaG8Zf+/+dfXTxT0FkAQWMO/xAK3qTcOC29wW9U//dDE/2HeUJ6k9BkX9J0P?=
 =?us-ascii?Q?1BO4yuikG9lOIMmqMpFbmy/6yDKwgVeiXXEybtYxJHfkqx9OpBDHBNAF45wD?=
 =?us-ascii?Q?qR3pu5BeYePIpWg73ojDkFmm+bAuuIsJWOEpJ+ojMSYsrhfdb3yPujDSjkf9?=
 =?us-ascii?Q?abvYBZpGZzWdztsHixDHS3EBAilSuog7IWpWxhwSSegrG0PV8D7Mie96YI+t?=
 =?us-ascii?Q?v9tto6GG9eeEynAzFkGhqBtmPnZOYiC4bPyTOXPiGDQ7Pf8jeE4HDz5dwn4y?=
 =?us-ascii?Q?ko5MaWGot/OsLFqe+hVqza6m3qe//NoLUYoZUEv2Jsa/kkKTvWnh7kt1i42f?=
 =?us-ascii?Q?wf8lyuUIK6uv2fU6QvSbFoVk8Yk7LMCqiTOjwKTHRgZj8kVPsKp1TGX29cUr?=
 =?us-ascii?Q?zXsoKwQhUg45TDsN+ImWXgDpBK2rJ30NLayR7HFpNOO2VEHgTDxgzy/rYyYJ?=
 =?us-ascii?Q?sg4T4N/jghF68pckX6lkHUWMLksiWBxeS/mxtC/axJvz4Vu13G+dZ0CTmMf9?=
 =?us-ascii?Q?r00HLBLw9bz7cqXoVsglGNWc?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR07MB5381.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c3e7475-16db-49c6-af6f-08d90935dcd8
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2021 04:35:19.1301
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GBpEqsRP0k9PJ8LcgLO8k+QeDJVYRd14X29GHqzh1ivX+mAs7xclKJQviHFDxUtncYZAotPYmtJgRD2M+Cs/9X3tWWl/GrPGMmiHkewQCVg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR07MB6738
X-Proofpoint-GUID: WI6W_yXKSa67hxhW-Idmh9ZVCro9FCip
X-Proofpoint-ORIG-GUID: WI6W_yXKSa67hxhW-Idmh9ZVCro9FCip
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-04-27_01:2021-04-26,2021-04-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check score=0 phishscore=0
 malwarescore=0 spamscore=0 mlxlogscore=948 clxscore=1011
 lowpriorityscore=0 suspectscore=0 mlxscore=0 bulkscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104060000 definitions=main-2104270030
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

>
>Alan Stern <stern@rowland.harvard.edu> writes:
>> On Mon, Apr 26, 2021 at 03:52:46PM +0300, Felipe Balbi wrote:
>>> yeah, this is a requirement by the spec, IIRC. A SetAlt to the same
>>> interface/altSetting means the host wants to reset that altSetting. Fro=
m
>>> the peripheral point of view that means disabling the endpoints and
>>> reenabling them.
>>>
>>> I'm just not entirely sure if we should do this in u_audio or
>>> f_uac[12].c. Arguably, composite.c could detect this and disable the
>>> altSetting, but that would require a huge refactor on the framework.
>>>
>>> My gut feeling is that for the minimal bug fix, we should patch
>>> f_uac[12].c, but all audio function drivers have the same exact bug, so
>>> I don't know.
>>>
>>> If we follow the "standard" of patching the relevant set_alt functions
>>> in the function drivers, the moment we decide to go for a refactoring,
>>> it'll be easier to see common constructs.
>>
>> FWIW, f_mass_storage.c handles this in its do_set_interface() routine.
>> That routine first deallocates any related request buffers and disables
>> any enabled endpoints in the interface.  It then goes on to enable
>> endpoints for the new alternate setting and allocate request buffers.
>>
>> The audio function drivers could follow this approach.
>
>right, that's what all other drivers do, in fact. Only audio seems to be
>different. The question here is whether to patch every f_uac*.c (there
>are three of them) or patch it in the generic u_audio.c
>

I agree that the best solution is to create common implementation in
composite.c. Maybe usb_function->get_alt and usb-function->set_alt will
be enougt to detect such case from composite.c. The problem can be
with testing such change with all functions.

For fast fix bug I don't have opinion which place is better u_audio.c or
f_uac*.c.=20

First version of this patch makes change only in f_uac2.c and the second
Version moved fix to u_audio.c (as suggested Peter).

Change in u_audio is simpler, and as wrote Felipe is common for all
UAC drivers. Maybe for fast fix it's better. =20

If you want, you can feel free to change and modify this patch.=20
It is important for me to fix this issue because it was hard to debug.
=20
--

Regards,
Pawel Laszczak
