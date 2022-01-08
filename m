Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 671E8487FE0
	for <lists+linux-usb@lfdr.de>; Sat,  8 Jan 2022 01:17:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231738AbiAHARf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Jan 2022 19:17:35 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:53448 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229633AbiAHARe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 7 Jan 2022 19:17:34 -0500
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C021BC2549;
        Sat,  8 Jan 2022 00:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1641601054; bh=KrwIEmI7VojiTH17JNv16tW88jAYRGPkGOpBPgupfck=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=jHeipC9lQ8j4HXFWvUZuQ8g86qEoqcYhOUlhJqYDd3J352NqiDNSMXmUr9uk2B5mq
         QqMqcHGrXRT2Lql4iV1DmJt6qNP15qOunjSUB777UDA6q/9Q7YHEJinawSR7Y0mYQM
         OV1mfhGfuuYYOfmPN/wHsOfZIXbagp41VntbZmCejXoS1YDwrT/556wxrzny0T92JX
         k29vn18hjmEBX/UQ6v6hq26fbZ1h8Wxc46/Bj5wdjqiPdfTYUD8z1tO7FZG7x/Y4ni
         4Yv3p3jxFi05fPzNx/zsxHNtyNi7pnpmclOtdCMurtUr5ao5W4iCgZRig5plBLSzYp
         FLDhvJo2rLZHg==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 71588A009C;
        Sat,  8 Jan 2022 00:17:32 +0000 (UTC)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam08lp2044.outbound.protection.outlook.com [104.47.73.44])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 6762140069;
        Sat,  8 Jan 2022 00:17:31 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="tJP3m8o0";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NIw6KOoqJoPqR5vC7jgmOfeNPutfzu+6ICVEWsgip2jtw9vQZIlC9LWKrg8bOnAspEAsuz8a4b0aSkm6MnNTu1p5DJtAz/GthlYrj9OBjF+XOFTl2yIP0BuKH1plQaksnAz+0W6dIANFyUuDBNT18OuwrM2ywKaCFqFmeR+SksvMVHNTpEQYloLttVawOchB6W7/6z7fLYoBoQFk48kqw2gpGCwdzAIY1jX609gETTDwcgmcis644+9WRUpEbVWgKO3jtlrcJyYZrOn93qR8TzUtcyQS4aHAqKNFbg771dxbuK8+yGRkcZMQpp/5Nh0a4iDaqyewz1WLZmATNiWvvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KrwIEmI7VojiTH17JNv16tW88jAYRGPkGOpBPgupfck=;
 b=RQXErVPDPWwBtESk3z1V4rlh2+FLFHJVACZ8hlfoYzVOENXGOdxnCSZ0CurjU/mFFTCzsYVCFE1XXY/NXgX+wQ8Y2qfzEGR+rRIrrgseaszPcqBzMsa+oSOmLZds0OQpNIPv/qjSdvmjvBLYy5or9nTUz8gorxzYCQOjXAFyVdnQZW2cvTlRafSpEOBdSyzKrlhppWXRdTegPr+c/KheA9aFJSlyu2QUbHt48C4cbUMzJ3QdtlNPfiOwmaJAIMSeGB42TjKx4OtjQMObrj/TDkJaPfecIOXwSkYCljFCtDhsK+Wal7UBBRBib4bBp9c3de7Wu9gnG7xDsgT//0XS4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KrwIEmI7VojiTH17JNv16tW88jAYRGPkGOpBPgupfck=;
 b=tJP3m8o0Wk84N6Lr88lVD91V5A7lTY6yv+9QPE85dfk5dPwNVkF9yMM7VgvfbPv/DgUrsBh0veJF3PM+UJgDG4iI7Z6v7Z5SCVDjclv9+Ht+SoAElQhh9vnaaKy+lHKWl8x2FWQ4nRWL4tlyL7kXRHlIcwDJH1ykx1lsTmykBEQ=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BY5PR12MB5015.namprd12.prod.outlook.com (2603:10b6:a03:1db::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Sat, 8 Jan
 2022 00:17:29 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::cba:198c:5d48:b0a1]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::cba:198c:5d48:b0a1%3]) with mapi id 15.20.4867.011; Sat, 8 Jan 2022
 00:17:28 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Robert Hancock <robert.hancock@calian.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "mounika.grace.akula@xilinx.com" <mounika.grace.akula@xilinx.com>,
        "manish.narani@xilinx.com" <manish.narani@xilinx.com>
Subject: Re: [PATCH 3/4] usb: dwc3: add reference clock FLADJ configuration
Thread-Topic: [PATCH 3/4] usb: dwc3: add reference clock FLADJ configuration
Thread-Index: AQHYA14fQrb6DoLETkyqfWTfAuPxbqxYQ4AA
Date:   Sat, 8 Jan 2022 00:17:28 +0000
Message-ID: <2a420d1e-12c9-64c3-2b67-6b08014e4b56@synopsys.com>
References: <20220107001334.991614-1-robert.hancock@calian.com>
 <20220107001334.991614-4-robert.hancock@calian.com>
In-Reply-To: <20220107001334.991614-4-robert.hancock@calian.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 530d0b62-2253-465d-f74e-08d9d23c4194
x-ms-traffictypediagnostic: BY5PR12MB5015:EE_
x-microsoft-antispam-prvs: <BY5PR12MB5015905EC212CF1B99E2BCEBAA4E9@BY5PR12MB5015.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ig8cJ6ZvMNYtiSC+977Lf2uZwt7dqo3WT5daBK+bgDPHHgtObp8lNTwU43Gb8Arx5SQC+B9K/9oVIOCnfxOKn57UFaZR3R46eGooWnAz14pJz/O2XXntQ/UpTcVmjUI8aQTnFt7l43CMxM/PVeu77B5WtQ4xmSma8Ejs9WMRozBOLG3/Q/mr7qzXmqglIZUqj3R1MA+nkJCPTiESDB9fQ6Dgc5LqelIAgn8UzHBmoDK17w15sXo6QimIikr/sD81ga8tclv3o6Fzjp6DQc8Wp93icFkI0RWDdPHgiakovPxjhFo2LglTJhaRV02Cl54nlQdxrM/bLOWkSz4bgBK9Is1frGQl7QjwWRA5G9+ew5ACDi7bjN7ubAOjVC6raPeoX7I6phq9hTQGhLbEFph6SldKL97x+FOtXiUqCmGpLkdNktQNRwkSptFvqIXx0nqzWoMy3fEm5saIgn7WPyzdqMPXlpEI8cZCsux5ud05pvGDIJYE/rCVDgiWikBvh4tlylNl1005yvDfcqpZtC0W+A21Nw8yU1VXOxVWJoErW18BiiF4/o64vkNExbEppGPgdRKithwxJko20sDlh5r+Uhi+Jb6v8gZDIJNRu+C1KaVD5dpMuXisTOWNtyXg683UwulNMkWVZtVOdKlV/VqBAhz/1Zr28/t/NnlTMesyTIWr5oRMofv301sd7OVkkzKCyYjcwrNR0m8+pWYkeUyydF5dsndt7O/CXWH7pMfDqw/1+3VVpt3HmVFh7F33SFe6xvYkrXj2xOAPjPWv5BPrQQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(5660300002)(186003)(38100700002)(6512007)(316002)(66446008)(36756003)(6506007)(66476007)(6486002)(4326008)(66946007)(66556008)(2616005)(31696002)(8676002)(76116006)(508600001)(8936002)(2906002)(86362001)(64756008)(31686004)(122000001)(83380400001)(38070700005)(54906003)(110136005)(71200400001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YjZWbStKTnZlMXdBL0xqWlg2anpqQ20zZFhoNlJrQ3hjalhFcXVnTGpjQUEy?=
 =?utf-8?B?ZDZHSmRFU0VKdTVERTJxLzB5aGhKUnVrWE1FZ1A2clVCbVBVS21GbTFCMHNk?=
 =?utf-8?B?THpQOHJCeU5ieWxJYVF2TmhSVkxudzJ6SVhJSFg4K2xuSDR1N3VGS2RHMW01?=
 =?utf-8?B?Tk9lOFR1Z24wM1NnNEFNZU1CdEUzVkNOUVV2MndaYkNOYUR4K1g3Q2Vta1Vo?=
 =?utf-8?B?elF6UUEySTV1eUQ4Z0x0cFJoV3JLUHQzSFRMVDljMmswaVFTREhpY3UxT0py?=
 =?utf-8?B?RkF3MUxBZ2E3L1d0WEozY2hCQ0ZGSnZDWHZtS09UWmd2elJja2ZVQUQ5bGVo?=
 =?utf-8?B?bTZRSDFSUmdPWjV6NmVFSFdaQytCelNReWxDZjRYelRRVFcvQklGVmpLcjR4?=
 =?utf-8?B?RkVxcUJFWWphZjF6Z0dXc2Q2bUFnNVJPQi9kMDNsRjlSR3JLUDZ3T0pzWWNp?=
 =?utf-8?B?ZnRpTkFhT2szZC9HTzdRQ2pWejZYcmxOZTA5bGFFUEJvZzE3dEU4NHAzSFlw?=
 =?utf-8?B?RkRXMnZNRG9iaVptYndoZTlwSkpFakwvR1NpMjNxdlJsbUp5U2ZuV2lBOHZD?=
 =?utf-8?B?U0RGb3NZY01JaGtvQzRpY0dyenlqQnNCYWR4aWl1QmtZaUc0K0d6R3M2UFIy?=
 =?utf-8?B?dXl1U2FTa0FTczVlZ2RmRDByL1VOUEVzWnFoTVdML3RUQThBemc5TndwZ0dp?=
 =?utf-8?B?VVpFbmt6UHVscXE5WS9QdlJXR0M3YVRUamtkdmhJbHpIaURQeW9UeW56UmhS?=
 =?utf-8?B?S1dscUNlUCtmd2QvMElrYW43V3grK1RlcnAwc051aWk1K0NEc1oxSzlYMXZY?=
 =?utf-8?B?L1NDNkVNVjVaT0F4c3l0eWtSSU45b2ozRlNlajk1YlVtU0dMcUMvK1JEbTZv?=
 =?utf-8?B?Rm5Tdm9NZ0RBYTNsbzVWWk1wbjI1UnBrcnU5bUl3U0h3NStJUzJHamV2SU14?=
 =?utf-8?B?WTZhZEFzU3ExSWdObkVocmxsVjdxRXEyd0lLeUI5ZkNiZytEZmRka2ZqWFlC?=
 =?utf-8?B?RHpKbUlUN2dFVVgwYndleDI0RkRCNmZIS2dmcGtzSnhSdThtNDBnbVZKZkRL?=
 =?utf-8?B?UGZsTVFwU1NGNWYvdFNlM0xBT29kRllzRGMxcmVHVmVsNzRYa0U0UFRJNzdi?=
 =?utf-8?B?YUJoWmcvMURXMlpmRUFkRVNxK3hLME9TU01iS21sa1dBb09RMHczZlBWZktB?=
 =?utf-8?B?cTNKTm5Xa1ZEVy9ENlh3RzV0R3lWdklxYnJEUnh5QUJjMkUyTWpJWGJsR0xa?=
 =?utf-8?B?dHV0dWhPQjhvNm9rc0FKWFJFL3BNRHZidVplc0l0RHZLaGt0em5VTE00YjBn?=
 =?utf-8?B?L3Erem10emtpcUo3WjJCUTB2b1FmaWQ0Rk9hRTkxYlE1ZTllRkY1REFtT1Va?=
 =?utf-8?B?U28zVFBGOEU2RVVhNVhFRnRRZUpHcHdrS1NTZGM3cFVLcnRFQjV4aE52Z2lM?=
 =?utf-8?B?ME9vYjVsWUYrN1BNOUdiUmJ1REovZWxZWjREMGQySHVFbG41Nm91bVBuTE9i?=
 =?utf-8?B?MWlLRDZFL3J6Q1I0cEdTdUwzZ1N3UVF2ZG1jMXp4a3RpRlYzVHNSS1dpa29S?=
 =?utf-8?B?d1JHQ1JXZDhDNWVaZS9ZUmZxdzZUVUNkQ1FuMUpHWFg1V3htSFhNcVpwRXp3?=
 =?utf-8?B?VHpITDFFUU9DZnFGZ3lQY1VkZ0xoWmpSM1dBbEdwQjJNRnJuM3RnbUxmSVds?=
 =?utf-8?B?UTF0cDU2dXMwdmFubFNPUXZ3cGtySk1xWXNabnk4RVpTdTIwbFZTSk5zVCtY?=
 =?utf-8?B?QmlKaWxvL3NkWFhKMDVWZm9RUzJiQk12M1VROUp4Z2IreVBLMGJ0RzJ2VTZx?=
 =?utf-8?B?cjNCV1VYeFBUSEJ5bzlLZVFzYnZZYUxSWXZWNFF5NkJEb29idkRpWEN2dEhj?=
 =?utf-8?B?Qy85SE8yczFVQXJ5WVJINmpTcmRNVkZ2bUJ1bnVRZXNyalJaWmhBKzdXbHhY?=
 =?utf-8?B?ak9TTGQxVTRaVTA4ZnZyM3dDbGd5QS9aOGV4dkRzZHNRTEZNb2l6RWl3dmJQ?=
 =?utf-8?B?VVJ4cXdBSVErQ2REcWFBNDFiOEYvVFNWN29mMDAyZVdkSTYzN1NPeGJocCtu?=
 =?utf-8?B?bE56U3p2RldYWE12NjlTNTFId2U3dUN5SWlaM1BlK09STjRpaENxUENxNG10?=
 =?utf-8?B?T2E2Sm9NSjlqalhaY1VKbHBnWVpXT0FONjhTMDlsa2JqNnBjOGJiZVR4Nzcx?=
 =?utf-8?B?Rnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FEB580B8662593499FC9E99620B569B2@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 530d0b62-2253-465d-f74e-08d9d23c4194
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2022 00:17:28.8382
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mR3Mk1ptgncZyw28Muw7BAWcHO89H3ZCktqMpRCQWcnw766p/Kp6b0JGkR1Fyh8E72xmqBh9c9nNU31YbghFBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB5015
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Um9iZXJ0IEhhbmNvY2sgd3JvdGU6DQo+IFByZXZpb3VzbHkgYSBkZXZpY2UgdHJlZSBwcm9wZXJ0
eSB3YXMgYWRkZWQgdG8gYWxsb3cgb3ZlcnJpZGluZyB0aGUNCj4gcmVmZXJlbmNlIGNsb2NrIHBl
cmlvZCBwYXJhbWV0ZXIgaWYgdGhlIGRlZmF1bHQgdmFsdWUgdXNlZCB3YXMgaW5jb3JyZWN0Lg0K
PiBIb3dldmVyLCB0aGVyZSBpcyBhbm90aGVyIHJlZ2lzdGVyIGZpZWxkLCBHRkxBREpfUkVGQ0xL
X0ZMQURKLCB3aGljaA0KPiByZWZsZWN0cyB0aGUgZnJhY3Rpb25hbCBuYW5vc2Vjb25kIHBvcnRp
b24gb2YgdGhlIHJlZmVyZW5jZSBjbG9jaw0KPiBwZXJpb2QuIEFkZCBhIHNucHMscmVmLWNsb2Nr
LWZsYWRqIHByb3BlcnR5IHRvIGFsbG93IGNvbmZpZ3VyaW5nIHRoaXMNCj4gYXMgd2VsbC4NCj4g
DQo+IE9uIHRoZSBYaWxpbnggWnlucU1QIHBsYXRmb3JtLCB0aGUgcmVmZXJlbmNlIGNsb2NrIGFw
cGVhcnMgdG8gYWx3YXlzDQo+IGJlIDIwIE1IeiwgZ2l2aW5nIGEgY2xvY2sgcGVyaW9kIG9mIDUw
IG5zLiBIb3dldmVyLCB0aGUgZGVmYXVsdCB2YWx1ZQ0KPiBvZiBHRkxBREpfUkVGQ0xLX0ZMQURK
IHdhcyAxMDA4IHJhdGhlciB0aGFuIDAgYXMgaXQgc2hvdWxkIGhhdmUgYmVlbiwNCj4gd2hpY2gg
cHJldmVudGVkIG1hbnkgVVNCIGRldmljZXMgZnJvbSBmdW5jdGlvbmluZyBwcm9wZXJseS4gVGhl
DQo+IHBzdV9pbml0IGNvZGUgcnVuIGJ5IHRoZSBYaWxpbnggZmlyc3Qtc3RhZ2UgYm9vdCBsb2Fk
ZXIgc2V0cyB0aGlzDQo+IHZhbHVlIHRvIDAsIGhvd2V2ZXIgd2hlbiB0aGUgY29udHJvbGxlciBp
cyByZXNldCBieSB0aGUgZHdjMy14aWxpbngNCj4gbGF5ZXIsIHRoZSBpbmNvcnJlY3QgZGVmYXVs
dCB2YWx1ZSBpcyByZXN0b3JlZC4gVGhpcyBjb25maWd1cmF0aW9uDQo+IHByb3BlcnR5IGFsbG93
cyBlbnN1cmluZyB0aGF0IHRoZSBjb3JyZWN0IHZhbHVlIGlzIGFsd2F5cyB1c2VkLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogUm9iZXJ0IEhhbmNvY2sgPHJvYmVydC5oYW5jb2NrQGNhbGlhbi5jb20+
DQo+IC0tLQ0KPiAgZHJpdmVycy91c2IvZHdjMy9jb3JlLmMgfCAzMiArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKw0KPiAgZHJpdmVycy91c2IvZHdjMy9jb3JlLmggfCAgMyArKysNCj4g
IDIgZmlsZXMgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvdXNiL2R3YzMvY29yZS5jIGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4gaW5kZXgg
ZjRjMDk5NTFiNTE3Li42Mjg5ZmJjYmFkNDUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3
YzMvY29yZS5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jDQo+IEBAIC0zNTksNiAr
MzU5LDM0IEBAIHN0YXRpYyB2b2lkIGR3YzNfcmVmX2Nsa19wZXJpb2Qoc3RydWN0IGR3YzMgKmR3
YykNCj4gIH0NCj4gIA0KPiAgDQo+ICsvKg0KDQpVc2Uga2VybmVsIGRvYyBzdHlsZSAiLyoqIg0K
DQo+ICsgKiBkd2MzX3JlZl9jbGtfZmxhZGogLSBSZWZlcmVuY2UgY2xvY2sgcGVyaW9kIChmcmFj
dGlvbmFsIHBvcnRpb24pIGNvbmZpZ3VyYXRpb24NCj4gKyAqIEdGTEFESl9SRUZDTEtfRkxBREog
Y29udGFpbnMgdGhlIGZyYWN0aW9uYWwgcG9ydGlvbiBvZiB0aGUgcmVmZXJlbmNlIGNsb2NrDQo+
ICsgKiBwZXJpb2Qgc2V0IGluIEdVQ1RMX1JFRkNMS1BFUi4NCg0KSXQncyBub3QgYSBkaXJlY3Qg
ImZyYWN0aW9uYWwgcG9ydGlvbiIgdGhlIHdheSBpdCdzIGRlc2NyaWJlZCBoZXJlLiBJdA0KbWF5
IGNhdXNlIHNvbWUgY29uZnVzaW9uLiBMZXQncyB1c2UgdGhlIHdvcmQgYWRqdXN0bWVudCB0byBh
Y2NvdW50IGZvcg0KdGhlIGZyYWN0aW9uYWwgcG9ydGlvbiB0aGF0J3MgY2FsY3VsYXRlZCBhcyBi
ZWxvdy4NCg0KPiArICogQ2FsY3VsYXRlZCBhczogKCgxMjUwMDAvcmVmX2Nsa19wZXJpb2RfaW50
ZWdlciktKDEyNTAwMC9yZWZfY2xrX3BlcmlvZCkpICogcmVmX2Nsa19wZXJpb2QNCg0KTm90ZSB0
aGF0IHJlZl9jbGtfcGVyaW9kX2ludGVnZXIgaXMgdGhlIHZhbHVlIGluIEdVQ1RMLlJFRkNMS1BF
UiwgYW5kDQp0aGUgInJlZl9jbGtfcGVyaW9kIiBpcyB0aGUgcGVyaW9kIHdpdGggZnJhY3Rpb25h
bCB2YWx1ZS4NCg0KPiArICogVGhpcyB2YWx1ZSBjYW4gYmUgc3BlY2lmaWVkIGluIHRoZSBkZXZp
Y2UgdHJlZSBpZiB0aGUgZGVmYXVsdCB2YWx1ZSBpcyBpbmNvcnJlY3QuDQo+ICsgKiBOb3RlIHRo
YXQgMCBpcyBhIHZhbGlkIHZhbHVlLg0KPiArICoNCj4gKyAqIEBkd2MzOiBQb2ludGVyIHRvIG91
ciBjb250cm9sbGVyIGNvbnRleHQgc3RydWN0dXJlDQo+ICsgKi8NCj4gK3N0YXRpYyB2b2lkIGR3
YzNfcmVmX2Nsa19mbGFkaihzdHJ1Y3QgZHdjMyAqZHdjKQ0KPiArew0KPiArCXUzMiByZWcsIHJl
Z19uZXc7DQoNCkkgYmVsaWV2ZSBGZWxpcGUgcHJlZmVycyB0byBkZWNsYXJlIHRoZW0gaW4gc2Vw
YXJhdGUgbGluZXMuIExldCdzIGtlZXANCml0IGNvbnNpc3RlbnQgYXMgaG93IHdlIGRvIGl0IGlu
IGZvciB0aGlzIGRyaXZlci4NCg0KPiArDQo+ICsJaWYgKERXQzNfVkVSX0lTX1BSSU9SKERXQzMs
IDI1MEEpKQ0KPiArCQlyZXR1cm47DQo+ICsNCj4gKwlpZiAoIWR3Yy0+cmVmX2Nsa19mbGFkal9z
ZXQpDQo+ICsJCXJldHVybjsNCj4gKw0KPiArCXJlZyA9IGR3YzNfcmVhZGwoZHdjLT5yZWdzLCBE
V0MzX0dGTEFESik7DQo+ICsJcmVnX25ldyA9IHJlZyAmIH5EV0MzX0dGTEFESl9SRUZDTEtfRkxB
REpfTUFTSzsNCj4gKwlyZWdfbmV3IHw9IEZJRUxEX1BSRVAoRFdDM19HRkxBREpfUkVGQ0xLX0ZM
QURKX01BU0ssIGR3Yy0+cmVmX2Nsa19mbGFkaik7DQo+ICsJaWYgKHJlZ19uZXcgIT0gcmVnKQ0K
PiArCQlkd2MzX3dyaXRlbChkd2MtPnJlZ3MsIERXQzNfR0ZMQURKLCByZWdfbmV3KTsNCj4gK30N
Cj4gKw0KPiArDQo+ICAvKioNCj4gICAqIGR3YzNfZnJlZV9vbmVfZXZlbnRfYnVmZmVyIC0gRnJl
ZXMgb25lIGV2ZW50IGJ1ZmZlcg0KPiAgICogQGR3YzogUG9pbnRlciB0byBvdXIgY29udHJvbGxl
ciBjb250ZXh0IHN0cnVjdHVyZQ0KPiBAQCAtMTAzMyw2ICsxMDYxLDcgQEAgc3RhdGljIGludCBk
d2MzX2NvcmVfaW5pdChzdHJ1Y3QgZHdjMyAqZHdjKQ0KPiAgDQo+ICAJLyogQWRqdXN0IFJlZmVy
ZW5jZSBDbG9jayBQZXJpb2QgKi8NCj4gIAlkd2MzX3JlZl9jbGtfcGVyaW9kKGR3Yyk7DQo+ICsJ
ZHdjM19yZWZfY2xrX2ZsYWRqKGR3Yyk7DQo+ICANCj4gIAlkd2MzX3NldF9pbmNyX2J1cnN0X3R5
cGUoZHdjKTsNCj4gIA0KPiBAQCAtMTQxOCw2ICsxNDQ3LDkgQEAgc3RhdGljIHZvaWQgZHdjM19n
ZXRfcHJvcGVydGllcyhzdHJ1Y3QgZHdjMyAqZHdjKQ0KPiAgCQkJCSAmZHdjLT5mbGFkaik7DQo+
ICAJZGV2aWNlX3Byb3BlcnR5X3JlYWRfdTMyKGRldiwgInNucHMscmVmLWNsb2NrLXBlcmlvZC1u
cyIsDQo+ICAJCQkJICZkd2MtPnJlZl9jbGtfcGVyKTsNCj4gKwlpZiAoIWRldmljZV9wcm9wZXJ0
eV9yZWFkX3UzMihkZXYsICJzbnBzLHJlZi1jbG9jay1mbGFkaiIsDQo+ICsJCQkJICAgICAgJmR3
Yy0+cmVmX2Nsa19mbGFkaikpDQo+ICsJCWR3Yy0+cmVmX2Nsa19mbGFkal9zZXQgPSB0cnVlOw0K
DQpQbGVhc2UgZG9jdW1lbnQgaXQgaW4gdGhlIGR3YzMgRFQgZmlsZSB3aGVuZXZlciB3ZSBpbnRy
b2R1Y2UgYSBuZXcgcHJvcGVydHkuDQoNCkFsc28sIGRvIHdlIG5lZWQgdG8gYWRkIGEgbmV3IGR3
Yy0+cmVmX2Nsa19mbGFkal9zZXQ/IENhbiB3ZSBqdXN0IGRlZmluZQ0Kc29tZSBkZWZhdWx0IHZh
bHVlIGZvciBkd2MtPnJlZl9jbGtfZmxhZGogYXMgdW5zcGVjaWZpZWQgYW5kIGhhdmUgdGhlDQpk
cml2ZXIgY2hlY2sgYWdhaW5zdCB0aGF0IChlLmcuICNkZWZpbmUgRFdDM19SRUZDTEtfRkxBREpf
VU5TUEVDSUZJRUQNCjB4ZmZmZmZmZmYpLg0KDQpUaGFua3MsDQpUaGluaA0KDQo+ICANCj4gIAlk
d2MtPmRpc19tZXRhc3RhYmlsaXR5X3F1aXJrID0gZGV2aWNlX3Byb3BlcnR5X3JlYWRfYm9vbChk
ZXYsDQo+ICAJCQkJInNucHMsZGlzX21ldGFzdGFiaWxpdHlfcXVpcmsiKTsNCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5oIGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmgNCj4g
aW5kZXggZTFjYzNmNzM5OGZiLi42NTBkNGMyZTdhNjcgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
dXNiL2R3YzMvY29yZS5oDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5oDQo+IEBAIC0z
ODgsNiArMzg4LDcgQEANCj4gIC8qIEdsb2JhbCBGcmFtZSBMZW5ndGggQWRqdXN0bWVudCBSZWdp
c3RlciAqLw0KPiAgI2RlZmluZSBEV0MzX0dGTEFESl8zME1IWl9TREJORF9TRUwJCUJJVCg3KQ0K
PiAgI2RlZmluZSBEV0MzX0dGTEFESl8zME1IWl9NQVNLCQkJMHgzZg0KPiArI2RlZmluZSBEV0Mz
X0dGTEFESl9SRUZDTEtfRkxBREpfTUFTSwkJMHgzZmZmMDANCj4gIA0KPiAgLyogR2xvYmFsIFVz
ZXIgQ29udHJvbCBSZWdpc3RlciovDQo+ICAjZGVmaW5lIERXQzNfR1VDVExfUkVGQ0xLUEVSX01B
U0sJCTB4ZmZjMDAwMDANCj4gQEAgLTExNjYsNiArMTE2Nyw4IEBAIHN0cnVjdCBkd2MzIHsNCj4g
IA0KPiAgCXUzMgkJCWZsYWRqOw0KPiAgCXUzMgkJCXJlZl9jbGtfcGVyOw0KPiArCWJvb2wJCQly
ZWZfY2xrX2ZsYWRqX3NldDsNCj4gKwl1MzIJCQlyZWZfY2xrX2ZsYWRqOw0KPiAgCXUzMgkJCWly
cV9nYWRnZXQ7DQo+ICAJdTMyCQkJb3RnX2lycTsNCj4gIAl1MzIJCQljdXJyZW50X290Z19yb2xl
Ow0KDQo=
