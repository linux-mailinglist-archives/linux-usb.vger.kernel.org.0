Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F8B2318942
	for <lists+linux-usb@lfdr.de>; Thu, 11 Feb 2021 12:19:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230228AbhBKLTA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 Feb 2021 06:19:00 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:38036 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229979AbhBKLQn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 11 Feb 2021 06:16:43 -0500
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 90A4B4009D;
        Thu, 11 Feb 2021 11:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1613042127; bh=V1L6ErJwm7Xy+LL7tvileaxQ5oj8nP5BTT0gZRwo1WQ=;
        h=From:To:Subject:Date:References:In-Reply-To:From;
        b=GJ6g6QDWqXOFOjonR3/oX6VvLDnr6spohB/A5Fw4Y7PMcRSkZ5Mj3x5oSpAjo/YoZ
         zBwpWyqpITKj+JujJ7QSOMlvhXQG8jW4710zAmGCf1FR8TmqI7RSvmee6fScoNJqVS
         CBfcdZJwWTUP21/zolpUuAe174/pi/VemfajgcCWfhEoqveUFWoMO2249ShfrNOkJW
         XF8WCj9kHUUQXAyrvTIBagy65BrMUwIlLIlG9K7LYI+yHZVIGEmL7pV0JRilqLAK6B
         BUPaBaV0CC8u+t1awB8Vg9Bqu1yWNev6gIA72D2PJzHRVrwaFiEIHiRrVu/QCqQ+yR
         GcgwcnGPstSaw==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 7A12AA0063;
        Thu, 11 Feb 2021 11:15:27 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 1CD1A8021C;
        Thu, 11 Feb 2021 11:15:27 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="KEmUcP7l";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LimLL7udIp3ODUG+BAKaGWpY1rkgs187jTdeTQlv5v5ePP+mDqK7fTe8glFnmnAPMd/MMauTxfumWAj5dljBzvfCyX0A7SZnvpC4T1LOQXQg/TCXwNS4Fme8aWkdhLXQsdwrQ42c29+ff7iLN2o8DSvofgLvdyNnbiPCC48WebPChWu4JW0aeexx/it3knBT/9+z3sjAUDgcQs8VneXeAn3ji+u04evJ5gN2SghgJ6nJNQOkDPU2Ddl0xYJBFlTl2yCtd4sAISUN6D0ewK2k//CCrKzsp8Qw1sbekX2ubQccemU5wwFWkwhUujs9FtYa8+CMVjPSJKrgKwJSE2VvAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PhYfXhw4nBLfQ3k6J8pfygDoSwTao/E1wDxWd157R8E=;
 b=MXMaHLCmv7u5UL0MKIkfnL5CuTgLpKWRJfF/jIn+j6NitBd13Ghj4cMF4gaMsPcF6P1ygelF/+MQFZP6gNSh6Iu/Zy5YHXoE3wOuW/CMG8Q1ollt8TXP30Df/c3yHGVC2CNTy1yzZ1zUioIu8OaOmhsRQWLwE2grjLLyDhr1n7AoHoXRwJ08tIhoiLA5puInIJi16oTZ+M8vrk4ZdYuGU/tbyKZRpTpXQAzim3Gsi8JqLtV7BsJuawNF9f+uuhYwwZ8U5a/cHhA+GundLCHAIM26er7wVMr7uMPjC5y6YmNnv/lCHcMcvrM8j2vWj2RToMnoIF7ufFYFkCPlXRxAhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PhYfXhw4nBLfQ3k6J8pfygDoSwTao/E1wDxWd157R8E=;
 b=KEmUcP7l+S+AZBpmGVAlMQZaLZUNFNrJFZJK886Ce3uqSBJESkOU9j6bf2XA6IFl/EqKgggPKbMdF2zyiVMXF4p13KRYOYasv7yyw0jZmobhU5XAU+XhhbcTfHkwjJPxhV92sowx/wLj/XnsGBXN+hNHalcs8G7u5Q5isgQ6UaM=
Received: from BY5PR12MB3777.namprd12.prod.outlook.com (2603:10b6:a03:1a9::14)
 by BYAPR12MB3510.namprd12.prod.outlook.com (2603:10b6:a03:13a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.24; Thu, 11 Feb
 2021 11:15:23 +0000
Received: from BY5PR12MB3777.namprd12.prod.outlook.com
 ([fe80::e9e5:66f2:5a15:8c1c]) by BY5PR12MB3777.namprd12.prod.outlook.com
 ([fe80::e9e5:66f2:5a15:8c1c%7]) with mapi id 15.20.3846.027; Thu, 11 Feb 2021
 11:15:23 +0000
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Christopher Morgan <macromorgan@hotmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: dwc2 Resume From Suspend Devices Not Working
Thread-Topic: dwc2 Resume From Suspend Devices Not Working
Thread-Index: AQHW/8G5S/5Vy/RWk0CnibCOl0UnxapSztwA
Date:   Thu, 11 Feb 2021 11:15:23 +0000
Message-ID: <5b0b7237-1bd3-d712-5e76-c877b2a2a91c@synopsys.com>
References: <SN6PR06MB53423E9042B01FFF2531D47FA58D9@SN6PR06MB5342.namprd06.prod.outlook.com>
In-Reply-To: <SN6PR06MB53423E9042B01FFF2531D47FA58D9@SN6PR06MB5342.namprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
authentication-results: hotmail.com; dkim=none (message not signed)
 header.d=none;hotmail.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [37.252.95.223]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 37389801-14a3-4e8c-1a18-08d8ce7e5399
x-ms-traffictypediagnostic: BYAPR12MB3510:
x-microsoft-antispam-prvs: <BYAPR12MB351046113CE5D7FBA95B7787A78C9@BYAPR12MB3510.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YkdIn3qjV1nG1XFGvOy676MbEpN8E6oqPrO5fGyL4PPhcZt9zIeAIzVGYbS9Vk0+gtabmbwBaBNI5dXMmgfeiYA6GzN/4lz9/PNXHxyrxDgBKWuNLtyr2chz4ui519QDR4dnRjk5SdZPWt7cg1Cx+VSyRv4qhIQeCOP0skI6DujFIqim9y5uwQx7w/KjU/OY8lF7TGwBck6SArKKNEkwbH3Q8JcvkQAcaqDCAr1t2dIyo6+npOwEKvTOXqCeI3C3rCrPgSPhUVZhkSrFOYVenZ28WlaKNo0aZO8KiM3aobvx9F4mwYaETXGCCA04mPWeq3e6r0ux2v/4P51Ikxd+fn5CIOEfAaipiiCUIEYHFxvc88Spf7zvgpGf3QQBmo1Z4IQcDmASLS8if/+GZjmHbtHhAWXby6PS6sGzm4CpXYfNupFsWn8nqF2702iD4k3wwNZv6Fp7QUrcS1dTcbNE+YxpXD5uuaCImrsRPqnX2aaekOqrFa5L3s5KYb1USmmqprUtA52GLgHmCuB4LxfIYhW49WwU5e70+aVG6JDvqTCTBW9DvZJYOe5VDYTWO6VYY/RW3SloeaOz1Pd6dfBULxtEYJWM9aT7gA27uSP7DPo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB3777.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(136003)(346002)(396003)(366004)(376002)(26005)(6506007)(83380400001)(4744005)(6486002)(91956017)(5660300002)(53546011)(316002)(66476007)(31696002)(36756003)(186003)(66556008)(66946007)(64756008)(66446008)(8936002)(15650500001)(478600001)(8676002)(110136005)(86362001)(2906002)(6512007)(31686004)(71200400001)(76116006)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?Windows-1252?Q?f/bf/RG4gMc/WeSbTsFX+zumzMAVCurVAcSi8nTTYnrTgsza36rOxJsr?=
 =?Windows-1252?Q?rx7yaDEgePvEydtzBJgFJb67kTeI4ePmlmAOha1nNILohp677i+GOLWV?=
 =?Windows-1252?Q?oFwI34UvZDjDuH2S3eQqqLq7EVM5JBQyRws6vyQ1wDTQCD9UGhGPDTOl?=
 =?Windows-1252?Q?da7+CFKk6XZyT8FtLS3V063tVulp1GjDmrj1qAcjHnasVDiKSEve2Jaa?=
 =?Windows-1252?Q?mhHlB9Vh4ufD7Hn6iIFMhvYgX4MCEXfrPPYd7iQpWT5jjee5vD7WN+fb?=
 =?Windows-1252?Q?7OM7I5TUtNeXWdDvBACkJTyLwzLWvEY3PXprAXEL2VOBL9rMOfyoZXYy?=
 =?Windows-1252?Q?drcLbWlKhIW20fWW6oiGOYz4kfwyKyCMVFe5knVt2kXU7gib84LVXStg?=
 =?Windows-1252?Q?H9w8HIw+gaHf9SNbvmcqkQtMyLvP30XbdB95sjIMyOB4kWUYlfm1+F+u?=
 =?Windows-1252?Q?efViIu2ssfe8Ng+G7zIHSyn94W5wuzm42H15iq6R9ivxSdzMFEJTGAAQ?=
 =?Windows-1252?Q?2gSK+KMWoqnh3CrxLXxF5hAM/0WICC5pptPGedYLX43P/QmvTNTjjr5E?=
 =?Windows-1252?Q?Vk3WW+r0ebN1GACEO8t2vvEY46ET2cPTgbM1WPfTXnSw0olTCdNBnC7w?=
 =?Windows-1252?Q?6Hif/ukRGg2NBQb0HhJlAfWPfUSf3GrR+62px3V4CiiFeKKuyW0NF166?=
 =?Windows-1252?Q?gKnx2/DBBMyB9WE6S8k3WTOiWURpGolLjrVYX6MVFPu6ACgK9PiNWz+Y?=
 =?Windows-1252?Q?WyK+1Uj6zIJUWWD8GZwEy8n5g9PyaHj/cYEjA0P8eG7t1iETNpBExb2C?=
 =?Windows-1252?Q?zv320yPdgH3gvgYftAUm1kjdkH6fLy8LEFCpI8k2MUfwLPGF/KMmAesF?=
 =?Windows-1252?Q?3f61t8dZPYVU6+1vgyjlEB2JlAP+cwrpnhMIRllg0tXWId6PpRKioWsL?=
 =?Windows-1252?Q?L37dSbiMHkaKCMP6H/S/SwDjADQrDekAJzFu31b6TungPnK3RFfzjcmB?=
 =?Windows-1252?Q?jTlUC2hK9bfjr7zujm5gTE/L7fs+IGiEdoEdm0zx/+TrjiO4ku5x9x1E?=
 =?Windows-1252?Q?020sliCUmu9UMD4g1xpvgGNB5dVKrKbBML53m9ymRafu5Ts+HUbuVg6F?=
 =?Windows-1252?Q?GHbu+flmV18slqrYjfSv8GutRgjeRRZ+sc2wwOvhxxOrnY51cboO3LiN?=
 =?Windows-1252?Q?XR3lkJoGhE9BkmR9GkafYiCI49cvP4bQB5JSOlejn52R13QK6uhiCIxZ?=
 =?Windows-1252?Q?q9Vsbd6epWoW0fWpBFx7LNKQp3taMjk5WJTfbD2gsRk68vPZPW/sGuZG?=
 =?Windows-1252?Q?kyl0NyUxDKrhGd0+Cr7VrVP0MlA53Hu/Ldb7yQ+J2nAGeCIurNANWlhS?=
 =?Windows-1252?Q?qDzOnnSqrSXXQH+F8myU5MNnehsWATTNUBw=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <9F7D925CC4CEE7498DA36672EABB51A4@namprd12.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3777.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37389801-14a3-4e8c-1a18-08d8ce7e5399
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2021 11:15:23.5009
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B9nxW+cBwHsD8eQZ4nDZCe5fHcdbgFmnSajJIrVpZoJjIXHbDVnQvgKl36WTPRBzmlHGBiCFBaGHjGJoo1pT1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3510
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Christopher,

On 2/10/2021 7:55 PM, Christopher Morgan wrote:
> I was hoping to see if I could get some input on a potential bug.=A0 When=
=20
> I resume from suspend devices attached to USB no longer function.=A0 The=
=20
> machine I am testing in question is an Odroid Go Advance running on the=20
> Rockchip RK3326 (essentially a Rockchip PX30).
>=20

Could you please force setting 'power_down' variable to 0 and test again.
In function dwc2_set_param_power_down() (file: params.c), replace
	hsotg->params.power_down =3D val;
to
	hsotg->params.power_down =3D 0;


Thanks,
Minas


