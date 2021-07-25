Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79AD83D4C83
	for <lists+linux-usb@lfdr.de>; Sun, 25 Jul 2021 09:17:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229538AbhGYGga (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 25 Jul 2021 02:36:30 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:44914 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229519AbhGYGg3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 25 Jul 2021 02:36:29 -0400
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3BA05C0DEA;
        Sun, 25 Jul 2021 07:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1627197420; bh=RpZOM2gc+tpDlRn6a5o+bLmuUr0qjbO7mNRqyTX9BRo=;
        h=From:To:Subject:Date:References:In-Reply-To:From;
        b=SKYy403LxjhyVlxGiGvI18JTpBuz9h/eEF6TChX5nbe6LiUHJdHyke8O7UviOobw6
         xm4udkSqYzMFbLXg1bAPijGxBswQlYH3Zp/b9LIniHq94Rgk1+EqBpkdJpVU2E5FA9
         lLhEk8925Xx4ojHJDJy+xuvFgq64BnOeS2wjvyhKyYA8QMwooSXjNQxOkfxvG8VsVv
         QDl9pDgr3+KlO7sXl0wlEz2foESKyoF3jPXR+aCi/RzM/9YLy69K5i52T5Btg0r05l
         l3hz0wBzw6K00iVNWzHKzJica6QunlF7mofjvTy0vszSJ5oD7fbHXBvLnz02n3zVYq
         SLO8dTkaysqLA==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 10BE4A0080;
        Sun, 25 Jul 2021 07:16:59 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2102.outbound.protection.outlook.com [104.47.58.102])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 8C102400CC;
        Sun, 25 Jul 2021 07:16:59 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="k+t7kyyO";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RmAYlMlk804DD+EQ1DOyU9UBp6C5En1gdvodpixGmKcQeWRLheeXwKjbwbeI5iaREtLOh8GALKPDdVpthHPMHBQAda6C02heHlF/1kdKTsWSI1XblLExfs0Z8yA4vhQQFmyCVHUrp/Hi96usPOj1fcrnz6JlbHR0e7aG/HRNH8SaKkL4bZcH/bnvaOno/+muWbAxRU3Wthu1F9mfC7Mzpv3k4/MpqvXobDNw/c08A6BAADG8YKjBRk1qgQa1DePfp4DAxe5GyLstA5GLfF3eWfbXJi2jdeg19KZnkG6xlk25yU5LPF2zS2eUwXwi5by8wCqyX8qaVH5j6DQfEXd0BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RpZOM2gc+tpDlRn6a5o+bLmuUr0qjbO7mNRqyTX9BRo=;
 b=fk7i0UlY9tzpoLBX3omG73bUugsO19pNUxDFMHn7b6tFmG6A1zL7ydSRWxkjgrw7oPxecM2pZXUi5OMJ6DvyZP29BTCBOIs79T1Uc/lFY/jarw06O/iYh8Uapea336nOuf6yo3/b3aFNSWMXYJueVqG36geGV33JTxq/Osmgibj3f4nE+9oEzANpJOnCp0excMa3xPgrtVO2xT8botBsJKNdaBDv9M9KRqhI7IbBkH2wY3LVtuDoaox0U7Fnsyxoa+GJIeU0SVXRAI8eHVmpwf4U4qDv2hCOWGmGmq8YOsaTIsboWXFM/o7YuP1K7nTQOvHPsaXjNU0A8MsMLvJZmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RpZOM2gc+tpDlRn6a5o+bLmuUr0qjbO7mNRqyTX9BRo=;
 b=k+t7kyyOXvqrf3O0QcbBUFNybHXAwyILrlcaJWXl1Wp37fpd1yA9SsmnH+12PdVKd3LftrJ5N4kc0L6ogCO3kD+UoaEGC4QZsS5LOfHt4mm/4Vb/YHucnRf6vFqD3MqdoRJUcv3HZ5OF3T7M1U0sMZp2O8puzZ/f+uXksvkD2cw=
Received: from DM4PR12MB5390.namprd12.prod.outlook.com (2603:10b6:5:39a::12)
 by DM8PR12MB5479.namprd12.prod.outlook.com (2603:10b6:8:38::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26; Sun, 25 Jul
 2021 07:16:57 +0000
Received: from DM4PR12MB5390.namprd12.prod.outlook.com
 ([fe80::d97c:7079:8a93:cd4]) by DM4PR12MB5390.namprd12.prod.outlook.com
 ([fe80::d97c:7079:8a93:cd4%3]) with mapi id 15.20.4331.034; Sun, 25 Jul 2021
 07:16:57 +0000
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     "bugzilla-daemon@bugzilla.kernel.org" 
        <bugzilla-daemon@bugzilla.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [Bug 209555] dwc2 driver stops working after sudden disconnect
Thread-Topic: [Bug 209555] dwc2 driver stops working after sudden disconnect
Thread-Index: AQHXgSIsBUGvpr7+tUCBLjob+sgcOatTR9UA
Date:   Sun, 25 Jul 2021 07:16:56 +0000
Message-ID: <dbe446ed-c4aa-4297-7735-45d2d634a4d8@synopsys.com>
References: <bug-209555-208809@https.bugzilla.kernel.org/>
 <bug-209555-208809-J4J377hoS5@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209555-208809-J4J377hoS5@https.bugzilla.kernel.org/>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
authentication-results: bugzilla.kernel.org; dkim=none (message not signed)
 header.d=none;bugzilla.kernel.org; dmarc=none action=none
 header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: de6be7a5-5609-4380-fb75-08d94f3c2fec
x-ms-traffictypediagnostic: DM8PR12MB5479:
x-microsoft-antispam-prvs: <DM8PR12MB5479FD0A62130A4764A4FE70A7E79@DM8PR12MB5479.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5evVcpzSC2cY6y2ZIl7d4t7xHyFYrHQEGOmQ2+xImXyHmIDRkUX4b2VXY7MDiDS3AZ4C1ehWtzY58bgeEPAFB90bxyb4AR7p5mHi5LrHwpi9O2fJQi+irxIrMQLYVsR+2Kcbqk+38tMqV2IG9yxNcrIvBQL6LJHP5646kjOnsmrf3yqDC7L5F5URoxs4D0i6Vy9cqWICLwVA1Q6Mxq0z7RXNv0em1hXDMwm8Jbq/g46Ul2tPa1Ehx46pHJoWSI9Y52oGjrFAYdDPt1Ei+UislCRLhpFKVntlWSocf0zIvSdMEtj9MaY62z9QbXp46b0uoI8IY29mcU1bmV8fZ4Qcz845llG739pvQ//VzDVqtbegaLNOSoRQx1b6ZrHj3IawhwgnwWOKOg6fWpVCpRvVNBHAE8ixH7+3z883TtbiI5CqW6eOb/OixxvcCRAK6c2KszqSq3blryUlKZD69NLyXIcVGKP+dIV6FZEIvM1cNio37NoRyxFvwldurVGkng4ulUED4xK8muFXTqg4nkqSJVmNHRlQA5PL2NMbH6sLp7I/r1vLu8h5yUUOfS1fyGOMn1hhCweMDYweC7NAIt4n4XW7aGEwZUyZWyYDIxUbusPcw0xFsEL+2HvDjn/qhi0Tm+YlA24tqeBujJpPD8ck8Xwrqsua8ww6YQDFV5Nt6K+XOZyse3kPxvALkDAQgTzThbGE+uuePOIEwJQK7wrxIn4LsgxbqdSTZKw0a3ljsNZJhbgw3piH0xRMHeaTlf/xZ1FC7l0Zqyx0XoB63EooC5/8rFd0nWhnZ6/sDBkfQ6nydVTdmr/W657M6om1a+l4Zk1ht7Uyyl2AzCfLHZvYqcBkMs1NNVF+ht7S7QvFCTA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5390.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(376002)(396003)(136003)(346002)(366004)(122000001)(31686004)(31696002)(86362001)(83380400001)(38100700002)(71200400001)(26005)(6506007)(53546011)(2906002)(186003)(8676002)(966005)(36756003)(5660300002)(66476007)(66556008)(478600001)(76116006)(64756008)(6486002)(66446008)(66946007)(110136005)(8936002)(6512007)(2616005)(91956017)(45080400002)(316002)(45980500001)(38070700004)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OWVCQmJYWnB2UW1yUkxuV2VBTnJ6ZEpHYTBmYVdnYytoa2p5R1F5VVlDQ2dF?=
 =?utf-8?B?QVZYczFldWsvcURwWVU3YXc1cVhEeUxiUHNqekREbDFhSnpENjNLTkp4RlRH?=
 =?utf-8?B?bjdNYm1zTUd5bkJWVFRzN0JzMEJRNHVhQVUrbmsrdnZRSXJjSWZkUmtpemli?=
 =?utf-8?B?L05rQXg1YXRhcDZ4VGJqREtkZXR6ak9kRXNvM2tUZnFxb1M0UzdNOEVQdW13?=
 =?utf-8?B?bWk1UkVzaU9sc2Q4VGNDRDlYblRIc2R1dUFwYkpxTDhLM1JTU1lZTzNkM3Yx?=
 =?utf-8?B?YklxNzVsamJ1V2NDOWxwSlhyUFBCbzJHeWxyWVZZNlNOZ2NQa2NGbkJxV2M2?=
 =?utf-8?B?Z2RyaWdxQTFHL0t2ZUJnbCtINURMWnBvWjh4My84d1ZqdWFoMGplRFRsL0ND?=
 =?utf-8?B?T3pLWXN6RnBER0VHV3pUeDRSOHgvOXA3Vk1wU2tWd2R6MXdGTU9xVzdpZzJ1?=
 =?utf-8?B?Tm5IdVJmN0F6dzBzY1BRRkNxVnhaZlBlS3BnMEF6R2ZMamZaVTdhNTZxNVlD?=
 =?utf-8?B?SUhwcFlKSVJqS3YzbXlsVzBINHdaNTlVODlQK2hhZ25uWkpydzh5RitoMVZI?=
 =?utf-8?B?bzMyaTg1cUtlYXJ5NldQNzJCcTJSNk00WDh1NFU5NHJIMVh3S3drZFpiK09i?=
 =?utf-8?B?R2U0NFNnYW80VDRKLzZLWS83U1lnVno0akdBTHVjcVB3OEdnbllHM0pUV0lZ?=
 =?utf-8?B?WUhBaXl3YVI0a01Ud3NyaDVIWHV4YWlJK3hqT0cxdGpKYUNaZXFmRzVYcElp?=
 =?utf-8?B?dERvL3FQTGNPWHdiRWtDcGh6QjZTOTlRNUtXemhYQlhIUm95cWltdFAyNWFL?=
 =?utf-8?B?MFF1V01PQ2FxNHZFK1UyZUgwck96VnA0KzQ2MHRMS3doa01VNjdUM0UwR3NP?=
 =?utf-8?B?ckdkMkE2dTJaL0hzWUFiY0hwTExOU1dyVStNVUZObzZ2ME1ua054cWVCa3A0?=
 =?utf-8?B?eFh0RmFiRGxQYURFU1Z6bkRmSzhhYktMcGpwOWZxK2VKMi9yN0lVUzduUDRC?=
 =?utf-8?B?MFdNYUlZellRV3g5amNtT0MxNjloT3QzMnVaQTkxRG0zWlNMUXBhejR2SWky?=
 =?utf-8?B?YzYyZTZaK1VCaWY4Zyt3bjJ6ckpmdU5HeUVQMVBiZGR2VGVnd290S01OOUU2?=
 =?utf-8?B?L0MrdG5mZUFMcUY4c0c2bkdsRnJPZzAzNXRDZE1wQkFERnFOVzZJVFBiMTBn?=
 =?utf-8?B?VmcrUjR1b0N3K3gyK2NUTHBSNC9JYkoxQWRqK3dtb05BQXUwSUw5bGlTOC9h?=
 =?utf-8?B?WlcvT0FHT1pFVGh1cFY5RGovenc0TWUra1RHaFZ2eWM5WmZPd2FvRjBjMVdy?=
 =?utf-8?B?MTJhYVBncHliM21pS3FNWVF4WjJpaGRNV1ZuVlVFcld5M1Jtc0hrZnJ6blJl?=
 =?utf-8?B?VndVYkFTVkFZcjdPUTZOUnl0TFpieGFiVk4xbXp1b1BZbjhWOE9GUWFIa2lG?=
 =?utf-8?B?eEJnOTJGeUJMQS9LS241L2Erb2duVFpZbTVoWVVQMTljYUpWT3dlVGhRVkhN?=
 =?utf-8?B?YUhaQURGeVhQRkRseCtod1dvRERWejZVWDV6NmgzZTB5NHAxWnhnQWU1TEVX?=
 =?utf-8?B?VmtEeWdqZkVHRFRhMzdmUWNZSnp2cjcwY01xTTk2aElUQXg4Q3VPUVdXenVk?=
 =?utf-8?B?dUh5WUlMZTI2SG1mbFRqODdmN3pDY1VCNDkxNCtQVG1zaktmV3A3NSsrazVV?=
 =?utf-8?B?TTE0ZWcxMldvKy82ZFUvTkU0clpMSTliODBqYlpLck15WlZsUmlVMFR4ZDIy?=
 =?utf-8?Q?6qfH/kvodsfC/s80DY=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <2E1F0980BD3ACB4A94B935013BD76BFB@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5390.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de6be7a5-5609-4380-fb75-08d94f3c2fec
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2021 07:16:56.9949
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mMD1KGG1gzj7HFYYBlUMphofYrHySKOJdD9i3Vfl1NiDN3mu0IS9sBexIZs5QLmAJ4BOXTDxYzGCvVC42LvbQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5479
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgWXVuaGFvLA0KDQpPbiA3LzI1LzIwMjEgMTA6NTUgQU0sIGJ1Z3ppbGxhLWRhZW1vbkBidWd6
aWxsYS5rZXJuZWwub3JnIHdyb3RlOg0KPiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0
cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDk1NTVfXzshIUE0RjJS
OUdfcGchTDZkbHBoZzAzNzVieDFGRjdJRUNOUm5TaUl2NmVfc0NRNWUxb29ZdmNDa3lUdGUtZEVR
cDJyeThSeW9wUlpOVWRuTGFRcFNoJA0KPiANCj4gLS0tIENvbW1lbnQgIzggZnJvbSBZdW5oYW8g
VGlhbiAodDEyM3loQG91dGxvb2suY29tKSAtLS0NCj4gKEluIHJlcGx5IHRvIE1pbmFzIEhhcnV0
eXVueWFuIGZyb20gY29tbWVudCAjNykNCj4gDQo+PiBDb3VsZCB5b3UgcGxlYXNlIGFwcGx5IHBh
dGNoICJbUEFUQ0ggdjJdIHVzYjogcGh5OiBGaXggcGFnZSBmYXVsdCBmcm9tDQo+PiB1c2JfcGh5
X3VldmVudCIgZnJvbSBBcnR1ciBQZXRyb3N5YW4gYW5kIHRlc3QgYWdhaW4uDQo+Pg0KPiANCj4g
SGkgTWluYXMsIFRoYW5rcyBmb3IgeW91ciByZXBseSENCj4gDQo+IEl0IGRvZXNuJ3Qgc2VlbSB0
byBtYWtlIGEgZGlmZmVyZW5jZSB3aXRoIHRoZSBwYXRjaCBhcHBsaWVkLg0KPiANCj4gSSBlbmFi
bGVkIHRoZSBkd2MyIGRlYnVnIGxvZ2dpbmcgb3B0aW9uIGluIG1lbnVjb25maWcsDQo+IGFuZCBj
YXB0dXJlZCB0aGUgbG9ncyB3aGVuIEkgcGx1ZyBpbiwgZGlzY29ubmVjdCBhbmQgcmUtcGx1ZyBp
bi4NCj4gDQo+IFRoZSBsaW5rIHRvIGxvZyBmaWxlIGlzDQo+IGh0dHBzOi8vdXJsZGVmZW5zZS5j
b20vdjMvX19odHRwczovL2RyaXZlLmdvb2dsZS5jb20vZmlsZS9kLzFJRDNiRHA0TkE2dlNYZjRB
cU44dzJXaURoYUZibmI1OS92aWV3P3VzcD1zaGFyaW5nX187ISFBNEYyUjlHX3BnIUw2ZGxwaGcw
Mzc1YngxRkY3SUVDTlJuU2lJdjZlX3NDUTVlMW9vWXZjQ2t5VHRlLWRFUXAycnk4UnlvcFJaTlVk
cDA0RzltWCQNCj4gDQoNCmRyaXZlLmdvb2dsZS5jb20gbm90IGFjY2Vzc2libGUgZnJvbSBteSBj
b3Jwb3JhdGUgbGFwdG9wLiBDb3VsZCB5b3UgDQpwbGVhc2UgcHV0IGRlYnVnIGxvZyBvbiBidWd6
aWxsYS5rZXJuZWwub3JnPw0KDQpUaGFua3MsDQpNaW5hcw0KDQo+IEF0IFsgICAzMi45NjQ0Njld
IHRoZSBnYWRnZXQgY29uZmlnIHdhcyBib3VuZCB0byB0aGUgZGV2aWNlOw0KPiBBdCBbICAgMzgu
MDAyNzkyXSB0aGUgZGV2aWNlIHdhcyBwbHVnZ2VkIHRvIGEgUEM7DQo+IEF0IHJvdWdobHkgWyAg
IDQzLjA2Mzc2Ml0gdGhlIGRldmljZSB3YXMgZGlzY29ubmVjdGVkOyBhdCBbICAgNDUuNjQwMzc4
XSB0aGUNCj4gZGV2aWNlIHdhcyByZS1wbHVnZ2VkLg0KPiANCj4gQWZ0ZXIgYSBzaG9ydCBwZXJp
b2Qgb2YgdGltZSB0aGUga2VybmVsIGZyZWV6ZXMsIG5vIG1vcmUgbG9ncyBjYW4gYmUgb3V0cHV0
Lg0KPiANCg0K
