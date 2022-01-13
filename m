Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64D3848D03A
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jan 2022 02:42:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231414AbiAMBmG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Jan 2022 20:42:06 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:38076 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231388AbiAMBmF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Jan 2022 20:42:05 -0500
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B0689401C0;
        Thu, 13 Jan 2022 01:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1642038124; bh=zQr1FtomfiR9D6xIeFRwkfO4swISUhxiSYNqvHoBbkQ=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=HFOw94P5rFEQHqnGCbm0Ggo+k7EKOhkS8lqFvmOzVtad78SWd55A3at74v5MkQFjN
         r6scR3irGMKsMOgtCzaRYCPvC1CPJ4xIDDHw3o2g5O9P85neD8SdicDrtrAKdQMUIc
         EPL1gpLOf5gURBpJ1xvRqVHe6WmS3Z8CjWVPJP7a/Yucd6Tru+7KVx0DocprH0QJRm
         zbpykKks1vw6SmD0TJw5wmRkii6IU4kQPQTevrIGa4TjDeiD5f1Q9sNMr4aXZs4+mP
         HJUJ9K4A9W0WMifwOwQyq6icIq5dUfpH6K33qVhb4V4Rp8/gLLLGbCyC5T2+v4TnPj
         LRQCjVub/HQzA==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id C31C2A005C;
        Thu, 13 Jan 2022 01:42:03 +0000 (UTC)
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam07lp2048.outbound.protection.outlook.com [104.47.51.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id A84D7400CE;
        Thu, 13 Jan 2022 01:42:02 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="jgbaVjRg";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YDCVxIyFy8WiFL/oPUwZtOITX7B5JTLxkD/u+Z/FhNWb69Pn7/6Vnd15xITnQktDcBhxsGqnLTA7VI7ys+x+rZUWl9WSvVQHMkEWek8M8GPlm2uCJrZKfD9Cr0FALwx4rzaan0fpTJyI5olFY6dvRLI7T9Q2QxCVK7KtNLLNGRNRYno7txWI4E7zNsRAMM1L+nEDV+njivk3DoAhJA7RSabsf1FclQSW4tIUP9cFx75X1SlYfyveXg6G0cgPUacUU1rVbep6TBmRAhf5ffPuJVweRLQrLd7y3QvSBeuJNCbP3DzgGCF9ctynqvnB6wcT8NG5g+sS3Saj/llbBX6aIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zQr1FtomfiR9D6xIeFRwkfO4swISUhxiSYNqvHoBbkQ=;
 b=oUMhKwbe83KoPaQmoKrLzeDtwHExFXoNQmXYmMRHJlxUOAtrPBO0IUQNedQTlsu42e8c3wwNjH0eFdjQrJfQEn1waEuLepol2bT6qJ8zNgSSeJuVA4ln9AOpmxgSGJ5xu7lAJGTdWpQG+7+HByoXC6HGWLEBc9B/T2K7ZszSxYZLVZKEDnMC/sGREA7z3B81U7E2B4ZvowuU4KS9Zoslg27jLCZ3tTFSmMzE7jfXCIKvHvuZSsoaMkfru7lrKLOo26Jfj0G77clUVwYn/f8NSRqFXnlculObRosihOokL03yyFTNbl1QfTNLq95BiSmWjJtSANLC3DC33zZgPUGVrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zQr1FtomfiR9D6xIeFRwkfO4swISUhxiSYNqvHoBbkQ=;
 b=jgbaVjRgLvCgYjyPuvf86H4wlikE9Z4jw6eEwx+1qik8G7l/Y3fHlUPwirhYFWKQz2nWvlfUOEdwga+xe6zHv4kDuoKF8D9e9wXwPbrs1M00chw8AgXZX+c7B/97KzLIgnTH5gIXa6G7fdGf1dBI/QK1ptpS3k3XvZ+RVwMn48Y=
Received: from BN8PR12MB4787.namprd12.prod.outlook.com (2603:10b6:408:a1::11)
 by BN7PR12MB2690.namprd12.prod.outlook.com (2603:10b6:408:32::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Thu, 13 Jan
 2022 01:41:55 +0000
Received: from BN8PR12MB4787.namprd12.prod.outlook.com
 ([fe80::2000:bcf0:c83:8113]) by BN8PR12MB4787.namprd12.prod.outlook.com
 ([fe80::2000:bcf0:c83:8113%4]) with mapi id 15.20.4867.012; Thu, 13 Jan 2022
 01:41:55 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     youling 257 <youling257@gmail.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Greg KH <gregkh@linuxfoundation.org>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "william.allentx@gmail.com" <william.allentx@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: USB 3.2 Gen 2x2 "Superspeed+20GBps" support for ASM3242
Thread-Topic: USB 3.2 Gen 2x2 "Superspeed+20GBps" support for ASM3242
Thread-Index: AQHXFK9aaZXyhujf3U2dpApLGjyr3Kp7QfkAgABMwgCB0UUQAIAABYYAgAAYe4CAALNAgIAAGW4AgAAKDQCAABKeAIAAJEWAgAAb+QCAE/i6AA==
Date:   Thu, 13 Jan 2022 01:41:55 +0000
Message-ID: <03f5743d-0aa5-7006-be67-0598f909eeac@synopsys.com>
References: <f5bca159-e8de-3c76-c2b4-6f4efa001fd9@linux.intel.com>
 <20211230131014.21886-1-youling257@gmail.com> <Yc20WPbIad44/3rd@kroah.com>
 <CAOzgRdbeQ69pWbagFwTvV4ZcYGBE5GkwdqcuxxGFLXBJSy-GMA@mail.gmail.com>
 <6908aa69-469b-8f92-8e19-60685f524f9c@synopsys.com>
 <CAOzgRdb+Ru8AL=wUquysbqd8uGkNSDzSNfOSW3Fs2Pd6BGxo1w@mail.gmail.com>
 <1d63d954-13fb-f9c6-b2e7-d350ace2aa5a@synopsys.com>
 <CAOzgRdbgepUHKCmg8wR0s0bvYyuWNachi_EP6c9n_mRvQkXmGw@mail.gmail.com>
 <ae6d47c7-68f2-e482-c6ef-d2c63e2a9057@synopsys.com>
 <CAOzgRdZ7ME2AY4iJq6mXb8TyBcrJLYHEKSAteTVjDPjPRcF9Hg@mail.gmail.com>
In-Reply-To: <CAOzgRdZ7ME2AY4iJq6mXb8TyBcrJLYHEKSAteTVjDPjPRcF9Hg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 15f73343-bf85-467f-28eb-08d9d635e1b8
x-ms-traffictypediagnostic: BN7PR12MB2690:EE_
x-microsoft-antispam-prvs: <BN7PR12MB26902D05A6B97A6DC6B80FFCAA539@BN7PR12MB2690.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1060;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7oOaCejKt0ze2K1MXv7h590hyK5qvvH9A6TrHG7j/awsspZKxbxy64YkFd6syVYVBhtqFiEouUloPCnKftO9EJfUQ0RiWN4v6kU1BKbVpYqAPgjWUN9yR/tvpY6tgjliAD7tyGS3j0VLDBsFnVIUIQhTvGN+03//ZwJMMe/BUtd80tOjpdlMSQ8AFrHQExbIzsisO72MiT0amfQB7x7LTQtfNiJPW0v+XiDUyZ5y1y/6TJnkQut4Gt4phos4AHd/zGYpMVcjOgY2lncrFUYgLHzMPs0HSsPCydQl53lwMtFPUJ0EcGLksejVnqA1XUEhOr2tv1dvx50XbJ/reMuyhdlq7xyx+X69lAdwGUhijAuAXPzp3MMgpIPaB3q4CxVvM4hF1QP6TyvsN9BfFFRti8kr+Pm+OaS0BwsshkuhsZYlHj590Vq2CohOTIc1iA7JXhx+aSLkHXwsO6dL0XOBFSVvlnB1aAWS2kyArvmM49fqjKlMukHglahdg0nKRZpJhcPy21h3uWPcYtibVkRJNlR6c2I0SpVGGd6BOjtIN70Ey9WyfxtgFNsLCjorUozu5Av3Dd/4VoOdMHkdNomyfBsd/4y+N4f3zLrY6nEE9mXhirZxbtDF55pBWpOddPMsBKV+0zP18Vv25XZyA8epYM6K1Mir0H94HH3O2fnPpjnJhrkXLydqMpTJzheEFD0P8Z0DXUUSdhtAMc+cp0A9Bt3d3DVZQnY++7pc3XYxg3xHmFwg6TyNnq4XbUnIK610IHHDjVdPm7CYhzdzZJxolvCfcRWOC0N8N2FrNuVPSdNFDx6JJHlQT0QW1WUTvqdLmlXijuxNmwLJlcx+32kHYhTRxuF0bOxllUApYTBwic7CWdl7GSmqCaQURQ72vy/e
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR12MB4787.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4001150100001)(122000001)(83380400001)(71200400001)(31686004)(6506007)(31696002)(966005)(6512007)(110136005)(316002)(54906003)(5660300002)(38100700002)(4326008)(91956017)(508600001)(2616005)(66556008)(66446008)(64756008)(76116006)(66476007)(66946007)(8676002)(26005)(2906002)(38070700005)(6486002)(186003)(86362001)(8936002)(36756003)(43740500002)(15519875007)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QTFCMUJZOXRIa29tZms3UGQ4NUZRSnFCZjhZT1RQK0R0YlNsQVFZTUtMSXIw?=
 =?utf-8?B?VnhnNjEzcW5WNHJRaFZnclJNZERzSVRJYk9RVU1adG9vT1VReGFlMm1zTUpK?=
 =?utf-8?B?MkhNV1Zicy9NYVcrN1piN0xqa0FkQjlEa08vM0ptLzU2YlROWW1rbVFuRGdR?=
 =?utf-8?B?L0J4KzNiSHdkOVYzK2ExajRrOS95aCthYTlFeHMrN0ZBaGQzelpZZE5rMi92?=
 =?utf-8?B?R2VBcStyMjVpaTFUVUY1b21sRjZ2RTVWdGI4OEJPZm85VGFvcTJ3cVR2V1Zs?=
 =?utf-8?B?Y1VGeWtvOG9DdWoyVVg1Qk5LUG9WYVNSMFRid01VYStwTXBwdUJzVXRSenl3?=
 =?utf-8?B?YSt4UE5mc3hLZkxwekZlTmt4ZTdoYXdPMWFFTEUwUUsvMkJ4cUZab0xEK1E0?=
 =?utf-8?B?QjdyeDg3MkYzUjVaV3JHamw5cmV5RXM5TWdOL01RQk5FazFESTRRTUFzZ05q?=
 =?utf-8?B?bWl4bHBQckRJMWYyYzBROUpWb05JbHM0ZlA5b2tOK2NYZjZpWUg0elFIMUU1?=
 =?utf-8?B?bnZoemVvVFlCMnJHYWtmM2lEN2pvbjdHdDNYUEY4U1JGTGFuRHBoUDJIa1F0?=
 =?utf-8?B?WXF2MkFtN2N1VUQ0Z1YrbWEvS3pMRHJ1a2ZPejI4RGRlM1VxdGxLTFF1WG5Y?=
 =?utf-8?B?YTEvZ2dXY1Z3VFQxYTAvNnhpbEp2bGd0TFQvVmFJNFZZL1RORmRiZjBGZ0cr?=
 =?utf-8?B?dklsNjEvS2tzbjdVcHo0WkJWT1FiUFR5c1hDeWdQRWEreU44R2ZBNCt5YnpP?=
 =?utf-8?B?alZRc29zeWh1eXlMNjJmeG5haWVtY00wTHlPcjZaQ0g5Z01tNDk2L2lNa2FH?=
 =?utf-8?B?STY4REdHRlVxemtoeVEwOHZTbXdKM3Qwd2FvbUVkR0kzQU5yc3BFVjN0cDVI?=
 =?utf-8?B?TmFZa0pVbEtSbGd4ajdpZXJDNnplRGFLbWgvQnBOa0E4SDJhVkNoOTNaNGw1?=
 =?utf-8?B?TjRDclBqWE5RRDY2UStITTB5RWFMTTlSQzZmbk1Cb2k0WU8xZjZpRXFHV2U5?=
 =?utf-8?B?aVRkTEo3TDFwalJJL3hVOGd6a3hZb0hRbCtKbTl0aEpyYUJtdmhsckV6N0hp?=
 =?utf-8?B?aUJlNm9OSWExZU1YQVdJaHVIOHZ2TEkxa2xlRjZSeklmZmVwN0dhREZnR3BK?=
 =?utf-8?B?VlJpMUFXRnE5enZFSkxWT3N4U3AxZ1o5V1R5Y0FyamN2amROV0RualV2dlVq?=
 =?utf-8?B?UUV0RUNaOHZjZzNwMm4zUUpRYUZWRHB4ZW9UT09xL3FEaVhLakNKcGRUcktT?=
 =?utf-8?B?bFJrU3NsM0RxcXJWc05xNW5uMVVraVJ1ODFLeUFNUjdwNGd4S2tGUlBPNlFF?=
 =?utf-8?B?QkVFSU1Xa3N6SWZkQkF6UzB1NTlYcXZkZzBpMEMzNjFUWllqeXpnakZ1RnZT?=
 =?utf-8?B?UEJSdzNxR29VaUVKem5xeEx3aXVsM3FuVjJBWDh3cnl1aGtRTlRFMldmSHpE?=
 =?utf-8?B?U1RXZkpxYUhKc2JnWFRkYXpzMGJOWDNIVnFtSG9pZ2FGKzcvdk1uU1dIcWoy?=
 =?utf-8?B?WWNvbmJQY0ZrUVU0cGp6a2xEanR3a0dvWTJQZjl1Um9IQWFOQzNYZGNUeGJX?=
 =?utf-8?B?cnBtaGZLZk5sRGhkNEhrNmltQktJV1cyUVlWM3NNVVRQNGhjem82ZDJheWdH?=
 =?utf-8?B?NitJUWZxbDg3YlVzZU5tQytGY3hmSW1yRnk4UXQrbE9yT3ExcEVDK2NkN3dD?=
 =?utf-8?B?UHB1THdjelpoR2NGQ3NINWhtazFyU2ZjMEYvU002UDRQcFVER0JBMXRpSHZU?=
 =?utf-8?B?NFhXazMwaXkvdy9vUTE1NUlhdDUzdkRNUVRaTVhwNzB5cVk2a2d0YzByQ09V?=
 =?utf-8?B?ZGNROUVvWUp3QlB1cjFUdnZscHEyNlE5QkQ4RlNuNmZjeGU2RGMzajEzSW53?=
 =?utf-8?B?eWlOM0JvdDUvbmRPNjQ2MXZKbHVBNUo4VVREUld4akVheVZZN2hYeHU1c1do?=
 =?utf-8?B?T3V1V3A5S0tRc0tweTFBdkx1WklNNDlJWTFTemFnZFMzUUlKUDBaRFV5UlVm?=
 =?utf-8?B?d3VBQUpMeEsvOTVsWWhDU2w5bzM1ZVhNRVFFTWxjQVJiUXpCS3FQb3U5ZWJ6?=
 =?utf-8?B?NTg3TEdlMWV1clIwVU9SQjZDZmJHZENPNVRrOUxoQnV4a0FEQUVsNjhuY1NP?=
 =?utf-8?B?bVJCbXF0SWF0UUZUN2w1K2ZheFFYRjZXZUFRdmR2SVpLTm83aHN0RGRHMWZo?=
 =?utf-8?B?WlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1DE95BDF26BD63468E5163EEEFA1EA33@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB4787.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15f73343-bf85-467f-28eb-08d9d635e1b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2022 01:41:55.7095
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +VPz0gfydR82ICG7Evq5fr/DE6jpx3QAKvTTM1HIrt/nDABX+hbjJXrSwf8alWTK6GTo/myj5oGbb3rTHoiyGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2690
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

eW91bGluZyAyNTcgd3JvdGU6DQo+IDIwMjEtMTItMzEgMTU6MDIgR01UKzA4OjAwLCBUaGluaCBO
Z3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+Og0KPj4geW91bGluZyAyNTcgd3JvdGU6
DQo+Pj4gMjAyMS0xMi0zMSAxMTo0NiBHTVQrMDg6MDAsIFRoaW5oIE5ndXllbiA8VGhpbmguTmd1
eWVuQHN5bm9wc3lzLmNvbT46DQo+Pj4+IEhpLA0KPj4+Pg0KPj4+PiB5b3VsaW5nIDI1NyB3cm90
ZToNCj4+Pj4+IHRlc3QgdGhpcyBwYXRjaCwgY2F0IC9zeXMvYnVzL3VzYi9kZXZpY2VzLzQtMS9z
cGVlZCwgMTAwMDANCj4+Pj4+IFsgICA3NC42OTQyODRdIHVzYiA0LTE6IG5ldyBTdXBlclNwZWVk
IFBsdXMgR2VuIDJ4MSBVU0IgZGV2aWNlIG51bWJlcg0KPj4+Pj4gMiB1c2luZyB4aGNpX2hjZA0K
Pj4+Pj4gWyAgIDc0Ljc1MDMyOV0gdXNiLXN0b3JhZ2UgNC0xOjEuMDogVVNCIE1hc3MgU3RvcmFn
ZSBkZXZpY2UgZGV0ZWN0ZWQNCj4+Pj4+DQo+Pj4+PiBidXQgc3BlZWQsIHBjaWUgdG8gdXNiMy4y
IGdlbjJ4MiwgV1JJVEU6IGJ3PTY0Mk1pQi9zICg2NzNNQi9zKSwNCj4+Pj4+IDY0Mk1pQi9zLTY0
Mk1pQi9zICg2NzNNQi9zLTY3M01CL3MpLCBpbz0xMDAwTWlCICgxMDQ5TUIpLA0KPj4+Pj4gcnVu
PTE1NTctMTU1N21zZWMNCj4+Pj4+IFJFQUQ6IGJ3PTQ2N01pQi9zICg0OTBNQi9zKSwgNDY3TWlC
L3MtNDY3TWlCL3MgKDQ5ME1CL3MtNDkwTUIvcyksDQo+Pj4+PiBpbz0xMDAwTWlCICgxMDQ5TUIp
LCBydW49MjE0MC0yMTQwbXNlYw0KPj4+Pj4NCj4+Pj4+IHRoZSBtYWluYm9hcmQgdXNiMy4yIGdl
bjJ4MSwgV1JJVEU6IGJ3PTgzOE1pQi9zICg4NzhNQi9zKSwNCj4+Pj4+IDgzOE1pQi9zLTgzOE1p
Qi9zICg4NzhNQi9zLTg3OE1CL3MpLCBpbz0xMDAwTWlCICgxMDQ5TUIpLA0KPj4+Pj4gcnVuPTEx
OTQtMTE5NG1zZWMNCj4+Pj4+IFJFQUQ6IGJ3PTc1M01pQi9zICg3OTBNQi9zKSwgNzUzTWlCL3Mt
NzUzTWlCL3MgKDc5ME1CL3MtNzkwTUIvcyksDQo+Pj4+PiBpbz0xMDAwTWlCICgxMDQ5TUIpLCBy
dW49MTMyOC0xMzI4bXNlYw0KPj4+Pj4NCj4+Pj4NCj4+Pj4gTGV0J3MgYXZvaWQgdG9wLXBvc3Qu
DQo+Pj4+DQo+Pj4+IFNvbWUgY29tbWVudHM6DQo+Pj4+IDEpIEp1c3QgYmVjYXVzZSB0aGUgaG9z
dCBpcyBjYXBhYmxlIG9mIGdlbjJ4MiwgaXQgZG9lc24ndCBtZWFuIGl0IHdpbGwNCj4+Pj4gcnVu
IGF0IGdlbjJ4MiBzcGVlZC4gWW91ciBkZXZpY2UgY2FuIG9ubHkgb3BlcmF0ZSB1cCB0byBnZW4y
eDEgc3BlZWQsIHNvDQo+Pj4+IHRoYXQncyB0aGUgbGltaXQuIFRoZSB0ZXN0IHNwZWVkIGZvciBn
ZW4yeDEgYWJvdmUgaXMgbm90IHVucmVhc29uYWJsZS4NCj4+DQo+Pj4gbXkgZGV2aWNlIGNhbiBv
bmx5IG9wZXJhdGUgdXAgdG8gZ2VuMngxIDEwZ2JwcyBzcGVlZCBvbiB3aW5kb3csIG9ubHkNCj4+
PiA1Z2JwcyBvbiBsaW51eCBrZXJuZWwgNS4xNnJjNy4NCj4+DQo+PiBXaXRoIHRoZSBjaGFuZ2Ug
SSBwcm92aWRlZCwgeW91IHdlcmUgYWJsZSB0byBydW4gdGVzdCBhdCBnZW4yeDEsIGFsYmVpdA0K
Pj4gc2xvd2VyIHRoYW4gZXhwZWN0LiAoaS5lLiB3cml0ZSBzcGVlZCBhdCA2NzNNQi9zIGZvciBB
U21lZGlhIGhvc3QgbXVzdA0KPj4gYmUgU1NQKS4gVGhlIGlzc3VlIHdpdGggZGV2aWNlIHVuYWJs
ZSB0byBvcGVyYXRlIGF0IFNTUCBpcyBhdCBsZWFzdA0KPj4gYW5zd2VyZWQuDQo+Pg0KPj4gSWYg
eW91J3JlIGxvb2tpbmcgdG8gZmluZCBvdXQgd2h5IHRoZSBwZXJmb3JtYW5jZSBpcyBzbG93LCBj
b25maXJtIHRoZXNlDQo+PiBpdGVtcyBmaXJzdDoNCj4+DQo+PiAxKSBBcmUgeW91IHVzaW5nIHRo
ZSBzYW1lIGFwcGxpY2F0aW9uIHRvIHRlc3Qgb24gTGludXggdG8gY29tcGFyZSB3aXRoDQo+PiBX
aW5kb3dzPyAoTG9va3MgbGlrZSB5b3UncmUgdXNpbmcgQ3J5c3RhbERpc2tNYXJrIGZvciB5b3Vy
IFdpbmRvd3MgdGVzdCkNCj4+DQo+PiAyKSBJZiB5b3UncmUgdXNpbmcgdGhlIHNhbWUgYXBwbGlj
YXRpb24sIGFyZSB5b3UgdXNpbmcgdGhlIHNhbWUgdGVzdA0KPj4gcGFyYW1ldGVycyBhbmQgdmVy
c2lvbj8NCj4+DQo+PiAzKSBJcyB5b3VyIGRldmljZSBvcGVyYXRpbmcgaW4gQk9UIG9yIFVBU1Ag
aW4gTGludXg/IFVBUyBQcm90b2NvbCBpcw0KDQo+IG15IGtlcm5lbCBjb25maWcgI0NPTkZJR19V
U0JfVUFTIGlzIG5vdCBzZXQuDQoNCk9rLg0KDQo+PiBnZW5lcmFsbHkgZmFzdGVyLiBOZXdlciBk
ZXZpY2UgZ2VuZXJhbGx5IHVzZXMgVUFTUCwgYW5kIEkgYXNzdW1lIHlvdXJzDQo+PiBpcyBhIG5l
d2VyIGRldmljZSAoY2hlY2sgeW91ciBlbmNsb3N1cmUpLiBNYWtlIHN1cmUgdGhlcmUncyBubyBx
dWlyaw0KPj4gcHJldmVudGluZyB0aGUgZGV2aWNlIG9wZXJhdGluZyBpbiBVQVNQLg0KPiBDT05G
SUdfVVNCX1VBUz15DQo+IFsgIDUyNC42MzAwODFdIHVzYiA0LTE6IG5ldyBTdXBlclNwZWVkIFBs
dXMgR2VuIDJ4MSBVU0IgZGV2aWNlIG51bWJlcg0KPiA1IHVzaW5nIHhoY2lfaGNkDQo+IFsgIDUy
NC43NDc0OTZdIHNjc2kgaG9zdDk6IHVhcw0KPiBbICA1MjQuNzU3NTgwXSBzY3NpIDk6MDowOjA6
IERpcmVjdC1BY2Nlc3MgICAgIFJlYWx0ZWsgIFVTQiAzLjIgRGV2aWNlDQo+ICAgMS4wMCBQUTog
MCBBTlNJOiA2DQo+IEJ1cyAwNC5Qb3J0IDE6IERldiAxLCBDbGFzcz1yb290X2h1YiwgRHJpdmVy
PXhoY2lfaGNkLzFwLCAyMDAwME0veDINCj4gICAgIHxfXyBQb3J0IDE6IERldiAyLCBJZiAwLCBD
bGFzcz1NYXNzIFN0b3JhZ2UsIERyaXZlcj11YXMsIDEwMDAwTQ0KPiANCj4gd2luZG93cyBmYXQz
MiBzcGVlZCwgaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vaW1ndXIuY29tL2Ev
ZXE5cWhLal9fOyEhQTRGMlI5R19wZyFPa1lsWFhmMVp3LUVNZW1wMjJOVFJncU9uT3hsUC1YcDk1
V1lCSnZndUY5YjRpeVM0U1hfeTRaNXBBZV9JYUI3Wk50YiQgDQo+IGxpbnV4IGV4dDQgc3BlZWQs
IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2ltZ3VyLmNvbS9hL3RVQXNrZ1Zf
XzshIUE0RjJSOUdfcGchT2tZbFhYZjFady1FTWVtcDIyTlRSZ3FPbk94bFAtWHA5NVdZQkp2Z3VG
OWI0aXlTNFNYX3k0WjVwQWVfSWNRVkpxTm4kIA0KPiANCg0KSSBjYW4ndCB2aWV3IHRoZSAid2lu
ZG93cyIgaW1hZ2UsIGJ1dCBpdCBzZWVtcyBsaWtlIGl0J3MgcnVubmluZyBpbiBoaWdoDQpwZXJm
b3JtYW5jZSBpbiBMaW51eCBhcyBVQVNQIGRldmljZSBub3cgcmlnaHQ/IChJIHNlZSB+MUdCL3Mp
DQoNCkJSLA0KVGhpbmgNCg==
