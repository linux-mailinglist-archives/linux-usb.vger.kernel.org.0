Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAB0546C765
	for <lists+linux-usb@lfdr.de>; Tue,  7 Dec 2021 23:24:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241931AbhLGW2U (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Dec 2021 17:28:20 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:47122 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241924AbhLGW2T (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Dec 2021 17:28:19 -0500
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A095E4751B;
        Tue,  7 Dec 2021 22:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1638915888; bh=TUCX64odovNrz1Wg6u0tbDU7TJNalcl/mKgfeh4ozjA=;
        h=From:To:CC:Subject:Date:From;
        b=Fh1gEeILUBXfuoq5uLWTN0A/0ycMuaIErHRrbmuAqG4E7/R8y7OucKgepanuzo850
         FAoWmcIIvjQjAqGPwwQFOZH7x/Owqe2TopFYokWqEQoAbXdPzPtY9iPAVp8NGapasV
         6uaYARA6X8FMgG8AYDgiV3F+wBpzfC1KTFyoqTYVIYA3MYZbuPtIkgZxz3tQ11JPn7
         Mu46DZZFo5FlM3LPSSjPc6aNTyY2ZRH1wI9jkB2crJ8b00+7lzhmeWmVdASdy6edKf
         e1b3pbUMivhD8P0D9q33g17PGyd1JDP9D6Nspk3NWVvFlxMCWMt7muqmUerLhQKqwT
         qLjeL7PeFLR0g==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 14AB1A005F;
        Tue,  7 Dec 2021 22:24:47 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 09C4E80151;
        Tue,  7 Dec 2021 22:24:46 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="wAjjHjNl";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k3R6vGfNASmH1VwITEiRwqfeVLBDxUr3nJN1uTKyyqNlikAE81ibLRQa5elNSlwCj5RSvNPrPHLUSvKeYjRyT4jzrbL0z8rmfPqSvS0miY91HMoHx5bZf1s/436wHvnZGLGO8+94yioy+hNEtyefiEzmA3BT9GGXd+gemY0KPis3tKuLfMvYSVOO7Hac1usXHI9v48fORiJ8cW4RaG+yMJ9UFVPp/fnDyqmvCfrHwz5HUH9UeZ4AnIkyD8RcXofGu8Di4T0LiDqcTFY59iEKCNobm9JCPbq+BKH35LZeg/L4xAsCe7AdEjGJJAxrV1rm5D+axSyQY2G6fGSa31jVCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TUCX64odovNrz1Wg6u0tbDU7TJNalcl/mKgfeh4ozjA=;
 b=ffkQ9BljVheap3DBv+2C9he4IZW68seseJmbSnLvzydUBRjNCGRn6CfEGfVeSyYKl9QeIQTwBCvdPpPb/ypSFvb8W/XOl+Ut6Q/boRWUDMri++AdrO0JbD7GQKRJkqdzCIJomnbODsqRhMH3oTehV4aXtuzAB4AQiTVhDMzvF0xty7MwbNaJuw0m+LanDE+WXSQq/d5E58azXwxkVF9JbJ8l7ax0rD1+faII61tN3IjgBAmuQROFM7s1snnjJE7JfSY6nd7ny5MbLjKr1plJIdcb4O1u19z96BsDw/DttXvgS9XYnz0S2EKh/sy4fKlAsyeHMAiZMHmk8xsDXsAmIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TUCX64odovNrz1Wg6u0tbDU7TJNalcl/mKgfeh4ozjA=;
 b=wAjjHjNlQosaKgZXmkihyq6dVjwc7kFhCqKT9l4bdAz7EYLF1WDgIVTm3ERElRIU8dDlX7ltfzVnSXYn7bsLk191+3mAGtX/h0qR5LHFSixSha3+2ngkdWKnOSzmY7clcRr4Wda0H/7amQLdyJzPMho+dGnrKppAfJE3+LHOGto=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BYAPR12MB3477.namprd12.prod.outlook.com (2603:10b6:a03:ac::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Tue, 7 Dec
 2021 22:24:42 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::65:9861:75c5:8e08]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::65:9861:75c5:8e08%6]) with mapi id 15.20.4778.012; Tue, 7 Dec 2021
 22:24:42 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     Hans de Goede <hdegoede@redhat.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Why no SG support for isoc
Thread-Topic: Why no SG support for isoc
Thread-Index: AQHX67k6aI6sKxdPp02VSs26kURSFQ==
Date:   Tue, 7 Dec 2021 22:24:41 +0000
Message-ID: <e58d3323-eb21-5c59-daa8-230b91082748@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 21181ff9-cf26-448a-22e1-08d9b9d05d63
x-ms-traffictypediagnostic: BYAPR12MB3477:EE_
x-microsoft-antispam-prvs: <BYAPR12MB34775A1291C857A4158CCF72AA6E9@BYAPR12MB3477.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mYyrk5ujuLO2c6KnEi4czsRH9IBv4DVCU0w9+7qHraq/Aa3qu6uy2n0Ugqyk9IuH0GSFnX1/l2CWHYs7E/f86D2mp8J3W067BU6pUDxXHrPNd9TfiMNW/a3T7OnMi69fN0IX4Ra4TMF2fXDDsV+WtN4b64rrSLGSq3u52Uzk2cmIkBR3TJ9DyMQemfkjQ5u2+TeiDskbTIr0MARO3z7wzlHzqwjgu7t+EnJc8UIfgeq0/vKvvIlmYTIK99tMAoKHjzhiG5h719xZ2oOnJOZKgQ4p1Jeu6PB9T/8wjdaORKtc/hDSx3qMSeXp9KnhEQ4QMbrvtE0KMSOPVXnVVnTQKnf6nBXNa3NlXFGhPkVQs7biGsVkcXpfz3h5dLCOr9MZoF0EwKrAyUM8PATMSutOLBBa1D2mdCPAtpeQdxEU6AyGzSWesypTU9nLLJ8eK8M2if2e5AQWP7brjMDRIvDTKih46zKV/oaSDwJ7MaGla7sgIYz1Vw6qQoj04fcgwf5I4TBt0096Md2LR3haJvkUdeAw2n/wvvmzKLvTaZFK0gHE14bmBJY9PTitmmf/Qat8Lki6JlcbLOEJ06G4zijDTCaPbY76Wk/c94JE4SFFUd1alJV4nrtegsYe6GpphR9UAN9rRhLzfqtJXtJAYgIOP5aB+GwfPll/X2TNXqhdTPmjbcJMIwapTFYcYcgwzMLMq9Xbj2x8yrOan1uDCKxEBgKYWZhiMH3DQ5DQpzUGGi0IHlgjpWrQK4IfUP0k8hX9sjWOP0T51buFnJnr2fy+bg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6506007)(86362001)(8936002)(71200400001)(6916009)(186003)(6512007)(6486002)(38100700002)(66446008)(316002)(26005)(8676002)(54906003)(64756008)(31686004)(5660300002)(66476007)(122000001)(66556008)(76116006)(36756003)(508600001)(2906002)(66946007)(4326008)(2616005)(38070700005)(4744005)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?czFYR1JLRTNTdGdka2piY0tmWTc0d3prVGxJVEVPYU9tTkVoR04xbmFrWXRH?=
 =?utf-8?B?VVV0WXJSWjE1WTNpYno1SVZiZVVROTkrVWZwa20zeG02eVR0Rlphb294RCt5?=
 =?utf-8?B?Y1dWZTQ1eHFPOG83cWY0ZnFwbDJLYmJ5RGRrTTE2TG9xWHFaS0RNb2lIVzJP?=
 =?utf-8?B?eG10VVg1UGprdjl3alN4c3F6TUJwWXJpWE9wSnVLNThncW1Kampmak5FVTVa?=
 =?utf-8?B?OWpqU2RQTVlJM1ZML0xtUEFMMXI0WFVKa3N0Ym1EL3djcnplRng4TEpHSkt2?=
 =?utf-8?B?OTJGUjIzdExCR3QyN0pRTDAyZkRLR1R4clEyTkxyazBGRVBpWXg3MmhReFJy?=
 =?utf-8?B?Z2pRY3I4d0NFSGUxcG5jSVA4SjNnU0JXVUN2NHJRVzdYMGpISE1GSHQ2YjRD?=
 =?utf-8?B?dkN5dFZvTGhERGVnQzZ6dG1DcVJxWGRjdjRxdmxmRmpHZHZTbmY3NEs1UGZz?=
 =?utf-8?B?Y0xOd0dtYTlKMml6eEw2L1FjQnFSTWxQQmtldHNqTEtmSEhja081Mlo3eVVh?=
 =?utf-8?B?OC9VczJlM2xWekRyWFpPY3daak84aXFITWV3NDBwWktmV0luVWhCRU1oRkRD?=
 =?utf-8?B?SGJpYnFTd0UzV1VlRzhjNGwxNS9RNmtDZVVPT0pXMUxaQUI5aVJGNmg4RUVG?=
 =?utf-8?B?dUJoQVZmZm1hY0dZb21sNlFyZ2NLeVNLcGs4cDNCRC83Y09JNTVLM1FKNHla?=
 =?utf-8?B?L0RVc3NFTWVPWlNJVUNYSUVPSFRQa2VZMWkvdmlvcGNkY2FRMDNNSC91Tk5G?=
 =?utf-8?B?dzZTTDR5NS8zTXh4eThRMlNQMEp3WU5CSGxSTjJ2OXNNUURTOXNob1cxU2lr?=
 =?utf-8?B?US9PNFNNdkJBYWRraEZXcUdQaW93K2VDdFdjRUQwV3puazloR0s3WDJjNUht?=
 =?utf-8?B?cnFodHJMN3FIKzNIOVpXdWhMNkxvdzcvYU5iNzkzVkp6d0lRUjQrYTR1YWJQ?=
 =?utf-8?B?OXRTVTFCd2ZqaVlVblhwVUVjYmVRY2xCcTd5OVlYQzAvK2tkRGM4SGI2MDZa?=
 =?utf-8?B?OEg4VFErNWZ0bitBaGN4QU1IbVZuU2VSb1dmcGsranhINXFhTnN0VHM0UmYr?=
 =?utf-8?B?UVQyOUFCSzlDYWtVWUtXa3NsVVZ0a1ZIK2dCZWM3bk5Bdm95c0pBdXRyY1FT?=
 =?utf-8?B?UXRGNUsyb3FnSXlTQzk0UlRtWmVDbEFlY2ZsdFd1RVROL0krbU5TOExSWEsw?=
 =?utf-8?B?eUxZNmZ0UjZyUDdzZ1h0VDg5S1M5VmZtN0dTNUtsaGpIbFp3Q0g4VURkOEJ3?=
 =?utf-8?B?bFlpakhzNlhtYjQwY25LTllOUHoxVENNbnhXeWVBeUJqUjhUeWVRSkxwZmFu?=
 =?utf-8?B?ZTQ2RG5NQkgzK0JaNVYvdHJzek5xUitkVzFFbDZJZWdIUGpEWXluTVJzTlcy?=
 =?utf-8?B?U0xHQ00xODlZZUZvTWVKRnhtbU5JSG13MGVHRm54SGlYcjh2cDBiSEN0SEcv?=
 =?utf-8?B?VWNUemRJVkRpSkNqazFSdHFtUXJnYmtpRGFiRXYvVThuM3pwc3czZzlxWXE1?=
 =?utf-8?B?dUFPR0phS0FsczFEWlloWlQ2OUdxQzVJSWhqWVZ1eDZHaUhXR2NrbThwcjlV?=
 =?utf-8?B?UzRBb21sMFZyRUpFRWd4YVQrMmhzTFl4cllCNHB3Tzc1WmV2aGJrQmFZVG1r?=
 =?utf-8?B?bm1SQU9Lem5IbjRFNjZJdjllV1J2ZnV4dG1zN2RPRXBrZ2xHa3NWMTBrRStF?=
 =?utf-8?B?MjI1MTJkVUhHSzVwRWFORzI3UXliUS9udm12UEVjK2ZQcm1BOThpRDNXdmJO?=
 =?utf-8?B?ako1NnNyMVJCako5NFBNU3NaRENUeEtVSDVxbktEK3BxdVdFZjhYYU9Nc2Q2?=
 =?utf-8?B?cFhGMzU5Q0hQQjhOQzBmd3hiSkhqbTl5cU95Qm9YbUM3Zk9yRC9QZnNzb2xn?=
 =?utf-8?B?RmZ3cEtaYUNSRVM1aHYrZkFXQml3R1ZjQ0lhVzgrSUUxUTkvV2M5UXovUXB1?=
 =?utf-8?B?MlVxNytQN1pHR21BZXlZSHJsZnNPYWZCaDZod1FMMjJQdWVDOERCK21qRFBG?=
 =?utf-8?B?ZitnUFpVRThtZ0VHM2ZDSldrSGg1U1lQOEJDQUNRTHBJb0JjM01zd010a3pp?=
 =?utf-8?B?QW5uNWtHSVN0ZzdabjRxVThiODlZUWM2Z0NrMlJoamIrQ0wxaktnenZRVEdo?=
 =?utf-8?B?RkxwQVlZcGhMcHZGbEZxZWN6SHlwZldtY295SUNiY3J4ZC8zMHJ5cm50S3Fn?=
 =?utf-8?B?TUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <36F8E800CF805A41A8131271D69C2871@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21181ff9-cf26-448a-22e1-08d9b9d05d63
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2021 22:24:41.9656
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CE0ITaYrv6l9lIkxmrEgbvHyKd4foyhtdXTrXGSgCWc9dcVOQHdJ7UHQFfz3OHMMjIC+iLMSGKwwzNqu6ngd/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3477
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNCkkgY2FtZSBhY3Jvc3MgdGhpcyBjaGFuZ2UgZmUyMDcyY2MxNzY4ICgidXNiL2hjZDog
RW5zdXJlIHNjYXR0ZXItZ2F0aGVyDQppcyBub3QgdXNlZCBmb3IgaXNvYyB0cmFuc2ZlcnMiKSBh
bmQgd29uZGVyIHdoeSBpdCB3YXMgbWFkZS4gVGhlDQpkZXNjcmlwdGlvbiBkb2Vzbid0IGV4cGxh
aW4gbXVjaC4gSSB3YXMgdHJ5aW5nIHRvIGxvb2sgZm9yIHRoZSBhcmNoaXZlZA0KY29udmVyc2F0
aW9uIGFib3V0IHRoaXMgYnV0IGNvdWxkbid0IGZpbmQgaXQuDQoNCkNhbiBzb21lb25lIGhlbHAg
ZXhwbGFpbiB3aHkgd2UgZW5mb3JjZSB0aGlzIHRvIGFsbCBob3N0cz8gT3IgaGVscCBwb2ludA0K
dG8gdGhlIGFyY2hpdmVkIGNvbnZlcnNhdGlvbiB3aXRoIHRoZSBmdWxsIGV4cGxhbmF0aW9uPw0K
DQpUaGFua3MsDQpUaGluaA0K
