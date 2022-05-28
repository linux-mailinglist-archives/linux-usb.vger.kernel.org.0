Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BE755369E5
	for <lists+linux-usb@lfdr.de>; Sat, 28 May 2022 03:46:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346510AbiE1BqD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 May 2022 21:46:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231386AbiE1BqB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 27 May 2022 21:46:01 -0400
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5E7813C1F2
        for <linux-usb@vger.kernel.org>; Fri, 27 May 2022 18:46:00 -0700 (PDT)
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6F825C0512;
        Sat, 28 May 2022 01:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1653702360; bh=2XOK6ZYoo8pcYbl3EL6swxHXpiKP0NwL/zYRNZ/NCIc=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=J6oDfm0++UEybVpQeHgAGlxlaEHRdhC8qq8tjuk4eGc9+tAk9u19I9OekkxPfQwXN
         mAC1HS+DfahOTWnmdG2FgBC+mJQUfgyUdy4Nt7A/CAr/iypC487D2Izpvq7sAxxgTK
         ZB9RbtjQXqJKwYM5WhU+Eh63nIyK0iRKs4WQijxFgLK1PldPtBH3BLSyn5j0IFSDr0
         Shi7kxXPdF6b1Sfhs12GenUdvktX+FKzCX2+ZsZQA7DXyoBM357qnFHh2wmLX/8ycR
         C/j+fSmp6sCOOYyTepkzf5rVrtMs2cinB9kxFYoZ0Tq0RttACdqBjobXAWqGDvyhmo
         ipcnKfDR+HWlQ==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id C92C0A028B;
        Sat, 28 May 2022 01:45:59 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 1B2E880286;
        Sat, 28 May 2022 01:45:58 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="KmtBqL/P";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lCIsgcNJXyRBokgmF3fcsYbjjErgjWh0mKg5IIh55dkYOl0Xc00ybyrwCsdLMsIEIVJ8AhIDiXOCVuQk9hFxkN2qE+M40GUqbzm6+KhAfFXjlcwDsHdsE4plxLegiMy8ShvvPLOucXto38YNjBa2rQPB61Am7jelc8qGDb/Mb7NMHAcyx3+EKZTRNg5Gy1bjYVkW/olMUYF4RywJEwNyzJQM08A53WQUza3+KHxI9sRwlWODNpB150Qtgkaz1o5kRku3yOLmY9euaSpvIOZ6g0Crjzl2Xyti6vQU0EgKa5qIC5n8SB7luv0vJHp6wbjzKYY6tof6WDB5s55xWPUaSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2XOK6ZYoo8pcYbl3EL6swxHXpiKP0NwL/zYRNZ/NCIc=;
 b=d2Yg2Ah2XmrmlAHZ153SEoea36NgvCJ2mRTfKi2viKy+CupelmVR1xWRByXybZ+NySbYgVpNuEllbZ6uAaHKX+KoSgNhuB1HE50c5cWzygb9R6xP0s7o9Lxvy3r2cUx2pVBKCGVowEKMzRLe6biay1+LK1++WbMWKLiz/5Pj47FS0JnJ7xbGHg8OaDnspWLVzSzMwhLnPv8O+DMFfs+Cr5eD6Pj72HDE06IJoxtjWvflrHUFhYtwStTol8a0yA7Qbt0kmx+DeRQvM/GZK5ELmz0bauAiY15Fl1kxXYN5R7GzaS17cMvYX9Vqtt8yYdgfUxZ4VWL+CxsAPFCAkhopjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2XOK6ZYoo8pcYbl3EL6swxHXpiKP0NwL/zYRNZ/NCIc=;
 b=KmtBqL/PGC0VxX7QCuUK+AGhRmEu98EeuEOnkIvZs5atHMVYieb5F9Wp7gTv5ysWuyZhXs86ahpxqy/VzVxyx8bUWDARWdAtR5mXxlCGfItZqGxvW2NuQD6sWsKsd+JqcRhM1Z8e8/7X4866khqn2LgmJp42/7elAVaYp6mt5ic=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BL0PR12MB4739.namprd12.prod.outlook.com (2603:10b6:208:81::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Sat, 28 May
 2022 01:45:56 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::91c7:7e6b:d663:a349]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::91c7:7e6b:d663:a349%7]) with mapi id 15.20.5293.013; Sat, 28 May 2022
 01:45:55 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Li Jun <jun.li@nxp.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "balbi@kernel.org" <balbi@kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "jindong.yue@nxp.com" <jindong.yue@nxp.com>
Subject: Re: [PATCH] usb: dwc3: add power down scale setting
Thread-Topic: [PATCH] usb: dwc3: add power down scale setting
Thread-Index: AQHYcapxfZzJHZZbuU6v/rtjLbC2Sq0zetYAgAALLIA=
Date:   Sat, 28 May 2022 01:45:55 +0000
Message-ID: <a0573de8-fb99-797d-bd49-e1aab7223c12@synopsys.com>
References: <1653642195-23889-1-git-send-email-jun.li@nxp.com>
 <7d4ad852-3781-2fde-1496-b80813fe505f@synopsys.com>
In-Reply-To: <7d4ad852-3781-2fde-1496-b80813fe505f@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 166d5721-e84c-46b3-00ff-08da404bce6f
x-ms-traffictypediagnostic: BL0PR12MB4739:EE_
x-microsoft-antispam-prvs: <BL0PR12MB4739C9C287A39FDE897C9B0FAADB9@BL0PR12MB4739.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: w3mtBTmHKqu9n537icqepS5vY7SIfQZDBLyrqnlXOFrKCRg+NWpC/Zt1aGkMy+3LmjVldiICzNdMrAOrLLf/EP72tv16Zb7aTD4lplNxgeZyesDHsPj7zC8B2mSHzQBGh1fcsC3pbGJXfj52thgBxBgXe2jxM3oH6aqywYFPJraSYrRuLN6nLKmEp1EcyFIkGfnSeIDAn/O97H2ZoG7DrLyf4ApR8ihxmrKN0DRmxzfxpXhuDpbPUV8w6DsiO6BDOygUdc7PefGegsbb6SOX0KiKkLh4uyIVknA60OfqSlo4ncqvu4rr+ylX8W489K+qWXQJfm4jcpey480j/WcUVjZH+5MaWUa9Xcp1sNpJieZkedIZYFem1rWQmqJLU8xSuIx0iTXumjOd8G/4NTAfjzcV8ND15wEw/ZeK6P3gf7DypO8i3EFAcdzuUtQGb0mhzJPZBNgwuTKWQcxRn8s2LEOVjprra9toIsnAiYeBDFwIBYGNojPIJLshb5+fLFJi+rsWspJluGestH9sZvI3zKXzQrKnb8RbYWuFzooL/7Im+/8V8/h0MWrkpW1CvXhD2xxryMcLUGuVFTuNUwKEq1yYfe2fKiLO/sNMixcCWo6Zn551eix42Nv9Vxl4UtK97Ms5P+t8oa9GkICowgjxu6dI6WLtU+whxQlXP0XT2RaWRRt3EzZ+IGYyFUPM+QKXcyln5b7DbbX8TX52X063sxU9nMiUX0CXjhqbwh8DirdPEUV+UepTbpM7h0m66lBfeol6dSgs1W9T7bGfco5Ybg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(54906003)(2906002)(31696002)(86362001)(186003)(36756003)(110136005)(2616005)(38070700005)(26005)(31686004)(66446008)(38100700002)(8936002)(83380400001)(5660300002)(66556008)(6512007)(76116006)(66946007)(64756008)(66476007)(4326008)(8676002)(71200400001)(6506007)(316002)(122000001)(6486002)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Nm13aEJDYTZyUHB3RFdHQ0R3VGVjUXh0RDdETTJpVW12S0d0S0tXUU5UQnFj?=
 =?utf-8?B?My9HRWJmM1RpYm9uZUlpZzdUbXZySEhpNGJiWVBKZmVlQ1RmT0JkaWxrMUJs?=
 =?utf-8?B?VlhTOW9lbDN4aVk3Z0ZwQ2VISTM0VnFkOXVzKzIwUHpVRmxmc0NJT2hEaVQw?=
 =?utf-8?B?OXZVeW5pR3p3cXpld0NabUsvRUNzWFNYR1cxcTJRY2JJSHlkeDFuSHRrMXFX?=
 =?utf-8?B?QWZMZ3hhYlVmc3BRa2YvblNJYlhheUFpQml0V01iTmNxR3FDMG1sT1daMkJB?=
 =?utf-8?B?K0FBcHIzdXVDZTJ2aDlheGlJcG5KMXcxVmYwbCtsd3pjR3FJU0xNakRiUWh2?=
 =?utf-8?B?bzhTNmd4eGE2MDhnZ05LK2c2bzdLL2dnTDlydzVDSWhOc1VtOWc3RjZ0VzBP?=
 =?utf-8?B?MXovamdiMVNRVGlUbFVKQzE4RllRemRpYlJPYXpwVGRLdTNWK1dpK3RBbm5P?=
 =?utf-8?B?K1JkbzAvTjJZa1lVR0lja3REZzNLSmsyT2REVlBUY0pUOWJpa3BPNkNyOU9W?=
 =?utf-8?B?eHQwL0Qwd1VlcWh3aUw3UTYxb29mRVZvZWlaNFcwWjZ3U25PTkVMTU5JVGFP?=
 =?utf-8?B?eWxOWFNUcHdXY2NLcnFjY2MvWkY5d3EyVUFZOTRPbU9vekptWjRaUkVJU3J0?=
 =?utf-8?B?Q3NOenR4VnZuRUw1TUEvTU81RTd1UFY1dVBYd21Ja2psK09QM0dPSGxWWkxn?=
 =?utf-8?B?OXJoM0hMNzgvcWEzUnZpY2ZRMkQ2WVNpR3UwdGZoNzNsdkUxMDlZL2IrRVdF?=
 =?utf-8?B?L3IybFpQdHhucEdTbThYZW1FVm1FSjY3VFl2ZDVreEtVNVBZNU9kU3FVTFQ3?=
 =?utf-8?B?UFVUVmRoM1VjWGlOZXBKTWtIbCtqKzNmeHJ2akVGeWtrZDZnQ1d0MlFyZklW?=
 =?utf-8?B?NkdMK0xYOUNVaTJkSmkzd3ErY3l4TWpRZTd4Wkk4YVJRQStsZUxOcW5NdTNN?=
 =?utf-8?B?OU1lWnFPK1hPT3YvTFFsVy9zcEdVaVNJZEoveVh4a1U4ZGFNU05zQUF6Qzls?=
 =?utf-8?B?RG5OZzlUL0ZIWGZOZTFlQnRVQnpEQ2xuNXg0dFlTYU5KZ2w1WmdoQkx2S2w3?=
 =?utf-8?B?TmpEMzdhRTFMalJTM0RNZzJrUGV2citSMVBTemZhandXQi9rMU5hOGxoQUhn?=
 =?utf-8?B?bXVuNjhwTDN6YlEwckhpSFBPcTJLczRFdFJMTnBLNGt5dFNvKzVFMkEyYXhm?=
 =?utf-8?B?S2NiaDlwci90d2V0NTZaRW5JOS9sOUdvV2Z5STNPY1plUXF6VXFRRGh0bUtS?=
 =?utf-8?B?Y0JkVkNMTzNJcnJjMFp6S0xhYnBVRkFnV1pzTW9Cd2NBcG5JbXpPVTFEZ0tS?=
 =?utf-8?B?VHpkeFZGcGk2VHhQcGpCSmxkdHYzN2E4Tk1pVUk1a1hrdlJwczJWTU0zNXd1?=
 =?utf-8?B?aWFsUU0xekJDRHh2emhDWnZmNDVzekcyT3hqeXhSa3hHV1ArOXpyWmhVUW9o?=
 =?utf-8?B?am1KYjJIWGZvQ0U0bUNmSFJxdUc2VldjOG5tK0NiZEJKZGxzV1JRTDJza2RS?=
 =?utf-8?B?WlBxTFZoNEF5QWYvQjFqcjY2YzdCL1IxbGkvUnVDQXlMTnBEQ0hHazREdmRa?=
 =?utf-8?B?aEZGa2FlSllaa1VTSlN1MGRMTGp6RjU3QVVNTXJvWmJIZHlXS1VjLzBVNUEw?=
 =?utf-8?B?UkkwaXVzUE1NdGp0N2VUejNNVmF2MVBZMmt2OEZiQ3lDQ3hKVlBzS0doaUpj?=
 =?utf-8?B?WVJ3ekpVUEw5N21EeXpvK0k4SDFKeW8vWlVQS1ZlSW1UUWpFdGRSL05UTHRI?=
 =?utf-8?B?NytzeWNCd0ljckkxZzVmMVlOaHVOb3dycTJMVW5rRHYzTWtUNXEyYlV2Njgv?=
 =?utf-8?B?MVBEYkp5c3FpMGpRUCtaQ3NtYWswNU1JNUJaVzdueEVEbWNlRS9tKzN1dXYv?=
 =?utf-8?B?M0QxL3J6VUd1Z2hXb2NTaUxudjZZalh5RGZpZDZIZUZNeHRQWjVhcFNZdDNN?=
 =?utf-8?B?ZU9USytuOTY5cjZXL3ArYzZPQW00czZxeWZJTmc1YVBDbG05Y3B1a3F1ZTZ3?=
 =?utf-8?B?ZTlTOWdkWTlHZTlLdmFlc0NTdmQrdThOYzE0cmpBMmQ3VUFGSENST21ia2JX?=
 =?utf-8?B?NUY5OU5QRDNGbGdQV1pUR0VOYmxpUnJMdmxLWGFTSkRWRUFYanQxMlBlQVEr?=
 =?utf-8?B?MUZZWDkyQWUybldrb0NpTjk3QXE4ZDVHL1BsaXpnNzdRL2JlWDYyZ0tNam01?=
 =?utf-8?B?L0ZQTlMxdE53N3oxQ1ZhSGFEa1RwLzJBa0lmNzd3S2pVVHppVzZxeWFoSExL?=
 =?utf-8?B?K01mMEIrOUhWdlNHMFZmcHUxTk1VOHc3bGFJcUQ5RUdsek0vQ0pYdFZNcGww?=
 =?utf-8?B?d2VIUnd3M2hqN21vaWRIY3lTNWFCZERVZ0dnbTB5a2dXZ0ZlQ0hCZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <400709912E27C548AFB169FB9CD89594@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 166d5721-e84c-46b3-00ff-08da404bce6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2022 01:45:55.5827
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hG9kN7SojFNTYNSl9HiVQr09neXdmX6Rn8lqSlY7S1AkjLEA0tO6LdGwnjoE39f9WwbUotpjXlvZrYvPNZMIiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4739
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

VGhpbmggTmd1eWVuIHdyb3RlOg0KPiBMaSBKdW4gd3JvdGU6DQo+PiBTb21lIFNvQyhlLmcgTlhQ
IGlteDhNUSkgbWF5IGhhdmUgYSB3cm9uZyBkZWZhdWx0IHBvd2VyIGRvd24gc2NhbGUNCj4+IHNl
dHRpbmcgc28gbmVlZCBpbml0IGl0IHRvIGJlIHRoZSBjb3JyZWN0IHZhbHVlLCB0aGUgcG93ZXIg
ZG93bg0KPj4gc2NhbGUgc2V0dGluZyBkZXNjcmlwdGlvbiBpbiBEV0MzIGRhdGFib29rOg0KPj4N
Cj4+IFBvd2VyIERvd24gU2NhbGUgKFB3ckRuU2NhbGUpDQo+PiBUaGUgVVNCMyBzdXNwZW5kX2Ns
ayBpbnB1dCByZXBsYWNlcyBwaXBlM19yeF9wY2xrIGFzIGEgY2xvY2sgc291cmNlIHRvDQo+PiBh
IHNtYWxsIHBhcnQgb2YgdGhlIFVTQjMgY29yZSB0aGF0IG9wZXJhdGVzIHdoZW4gdGhlIFNTIFBI
WSBpcyBpbiBpdHMNCj4+IGxvd2VzdCBwb3dlciAoUDMpIHN0YXRlLCBhbmQgdGhlcmVmb3JlIGRv
ZXMgbm90IHByb3ZpZGUgYSBjbG9jay4NCj4+IFRoZSBQb3dlciBEb3duIFNjYWxlIGZpZWxkIHNw
ZWNpZmllcyBob3cgbWFueSBzdXNwZW5kX2NsayBwZXJpb2RzIGZpdA0KPj4gaW50byBhIDE2IGtI
eiBjbG9jayBwZXJpb2QuIFdoZW4gcGVyZm9ybWluZyB0aGUgZGl2aXNpb24sIHJvdW5kIHVwIHRo
ZQ0KPj4gcmVtYWluZGVyLg0KPj4gRm9yIGV4YW1wbGUsIHdoZW4gdXNpbmcgYW4gOC1iaXQvMTYt
Yml0LzMyLWJpdCBQSFkgYW5kIDI1LU1IeiBTdXNwZW5kDQo+PiBjbG9jaywNCj4+IFBvd2VyIERv
d24gU2NhbGUgPSAyNTAwMCBrSHovMTYga0h6ID0gMTMnZDE1NjMgKHJvdW5kZXIgdXApDQo+Pg0K
Pj4gU28gdXNlIHRoZSBzdXNwZW5kIGNsb2NrIHJhdGUgdG8gY2FsY3VsYXRlIGl0Lg0KDQpBbHNv
LCBzaG91bGRuJ3QgdGhlIHZhbHVlIHNlbGVjdGVkIGJlIHRoZSBtYXhfcmF0ZSBvZiB0aGUgc3Vz
cGVuZCBjbG9jaw0KYW5kIG5vdCBqdXN0IHRoZSB2YWx1ZSBmcm9tIGNsa19nZXRfcmF0ZSgpPw0K
DQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogTGkgSnVuIDxqdW4ubGlAbnhwLmNvbT4NCj4+IC0tLQ0K
Pj4gIGRyaXZlcnMvdXNiL2R3YzMvY29yZS5jIHwgMjIgKysrKysrKysrKysrKysrKysrKysrKw0K
Pj4gIGRyaXZlcnMvdXNiL2R3YzMvY29yZS5oIHwgIDEgKw0KPj4gIDIgZmlsZXMgY2hhbmdlZCwg
MjMgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2Nv
cmUuYyBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jDQo+PiBpbmRleCBlMDI3YzA0MjBkYzMuLjE2
ZDQ0MWRiYzI4YiAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jDQo+PiAr
KysgYi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYw0KPj4gQEAgLTEwMjksNiArMTAyOSwyNSBAQCBz
dGF0aWMgdm9pZCBkd2MzX3NldF9pbmNyX2J1cnN0X3R5cGUoc3RydWN0IGR3YzMgKmR3YykNCj4+
ICAJZHdjM193cml0ZWwoZHdjLT5yZWdzLCBEV0MzX0dTQlVTQ0ZHMCwgY2ZnKTsNCj4+ICB9DQo+
PiAgDQo+PiArc3RhdGljIHZvaWQgZHdjM19zZXRfcG93ZXJfZG93bl9jbGtfc2NhbGUoc3RydWN0
IGR3YzMgKmR3YykNCj4+ICt7DQo+PiArCXUzMiByZWcsIHNjYWxlOw0KPiANCj4gQ2FuIHdlIGRl
Y2xhcmUgdGhlc2UgdmFyaWFibGVzIGluIHNlcGFyYXRlIGxpbmVzPyBQcmVmZXJhYmx5IHJldmVy
c2UNCj4gQ2hyaXN0bWFzIHRyZWUgc3R5bGUuDQo+IA0KPj4gKw0KPj4gKwlpZiAoIWR3Yy0+c3Vz
cF9jbGspDQo+PiArCQlyZXR1cm47DQo+PiArDQo+PiArCS8qDQo+PiArCSAqIFRoZSBwb3dlciBk
b3duIHNjYWxlIGZpZWxkIHNwZWNpZmllcyBob3cgbWFueSBzdXNwZW5kX2Nsaw0KPj4gKwkgKiBw
ZXJpb2RzIGZpdCBpbnRvIGEgMTZLSHogY2xvY2sgcGVyaW9kLiBXaGVuIHBlcmZvcm1pbmcNCj4+
ICsJICogdGhlIGRpdmlzaW9uLCByb3VuZCB1cCB0aGUgcmVtYWluZGVyLg0KPj4gKwkgKi8NCj4+
ICsJc2NhbGUgPSBESVZfUk9VTkRfVVAoY2xrX2dldF9yYXRlKGR3Yy0+c3VzcF9jbGspLCAxNjM4
NCk7DQo+IA0KPiAxNmtIeiA9PSAxNjAwMEh6IHJpZ2h0Pw0KPiANCj4+ICsJcmVnID0gZHdjM19y
ZWFkbChkd2MtPnJlZ3MsIERXQzNfR0NUTCk7DQo+PiArCXJlZyAmPSB+KERXQzNfR0NUTF9QV1JE
TlNDQUxFX01BU0spOw0KPj4gKwlyZWcgfD0gRFdDM19HQ1RMX1BXUkROU0NBTEUoc2NhbGUpOw0K
Pj4gKwlkd2MzX3dyaXRlbChkd2MtPnJlZ3MsIERXQzNfR0NUTCwgcmVnKTsNCj4+ICt9DQo+PiAr
DQo+PiAgLyoqDQo+PiAgICogZHdjM19jb3JlX2luaXQgLSBMb3ctbGV2ZWwgaW5pdGlhbGl6YXRp
b24gb2YgRFdDMyBDb3JlDQo+PiAgICogQGR3YzogUG9pbnRlciB0byBvdXIgY29udHJvbGxlciBj
b250ZXh0IHN0cnVjdHVyZQ0KPj4gQEAgLTExMDUsNiArMTEyNCw5IEBAIHN0YXRpYyBpbnQgZHdj
M19jb3JlX2luaXQoc3RydWN0IGR3YzMgKmR3YykNCj4+ICAJaWYgKHJldCkNCj4+ICAJCWdvdG8g
ZXJyMTsNCj4+ICANCj4+ICsJLyogU2V0IHBvd2VyIGRvd24gc2NhbGUgb2Ygc3VzcGVuZF9jbGsg
Ki8NCj4+ICsJZHdjM19zZXRfcG93ZXJfZG93bl9jbGtfc2NhbGUoZHdjKTsNCj4+ICsNCj4+ICAJ
LyogQWRqdXN0IEZyYW1lIExlbmd0aCAqLw0KPj4gIAlkd2MzX2ZyYW1lX2xlbmd0aF9hZGp1c3Rt
ZW50KGR3Yyk7DQo+PiAgDQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmgg
Yi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuaA0KPj4gaW5kZXggODFjNDg2YjM5NDFjLi43MjI4MDhk
OGMwYWYgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuaA0KPj4gKysrIGIv
ZHJpdmVycy91c2IvZHdjMy9jb3JlLmgNCj4+IEBAIC0yMzEsNiArMjMxLDcgQEANCj4+ICANCj4+
ICAvKiBHbG9iYWwgQ29uZmlndXJhdGlvbiBSZWdpc3RlciAqLw0KPj4gICNkZWZpbmUgRFdDM19H
Q1RMX1BXUkROU0NBTEUobikJKChuKSA8PCAxOSkNCj4+ICsjZGVmaW5lIERXQzNfR0NUTF9QV1JE
TlNDQUxFX01BU0sJR0VOTUFTSygzMSwgMTkpDQo+PiAgI2RlZmluZSBEV0MzX0dDVExfVTJSU1RF
Q04JQklUKDE2KQ0KPj4gICNkZWZpbmUgRFdDM19HQ1RMX1JBTUNMS1NFTCh4KQkoKCh4KSAmIERX
QzNfR0NUTF9DTEtfTUFTSykgPDwgNikNCj4+ICAjZGVmaW5lIERXQzNfR0NUTF9DTEtfQlVTCSgw
KQ0KPiANCg0KQlIsDQpUaGluaA0KDQo=
