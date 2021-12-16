Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 820C7476E92
	for <lists+linux-usb@lfdr.de>; Thu, 16 Dec 2021 11:12:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235717AbhLPKMb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Dec 2021 05:12:31 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:38562 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230158AbhLPKMa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Dec 2021 05:12:30 -0500
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id EE923C51AA;
        Thu, 16 Dec 2021 10:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1639649550; bh=oSdPHGx3YAUW4V74+mcV4XaESBVwS969X5t4nFK1Gwg=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=h4E8Pn8zpO3LB8Zry7NQmIKuKSagI78xQlD+lq3eSPluRzTURpYLixMq+F/dq7MNB
         GFcrBYTodz+YUy2uIUvB906Y/n8meuZInpy1qQ82bJxtOtNk/OkXNxikCgXwK87MYj
         DcQEPVgkn2rfANePGcPSXnoXqNsT7AJLi70OpY0hwI04m1vL1EIwDB11UfUaX7LxAE
         3d7GQtL3nF+Xp15ptps6h5W/n7LF+xoTEFmO/BlYVtxKDzBj2Zz5VjZuqoqHRCapBr
         04sdXgEDMHJBL+2WOtnNmwDH8clr6prk7y9zZCoZgwGFFoSNNa0Q3L5Mqz2TzKviNR
         vqkMHKEvXxXLg==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 40F90A0072;
        Thu, 16 Dec 2021 10:12:29 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 7036D801D6;
        Thu, 16 Dec 2021 10:12:28 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="wjscMZ9G";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IeYeLACHFEeA91K7R4Utjp5WJlQOnUtau4IlQ65nUHc80lfqcmrmrsVtT5N8G9Tc4HrQRDzT5DDJ1ghS96ac7VyXuNwQGFWag5xaI66hvjke97uyOE8u9YFNMbK2OqY3p3ZHZmqGGyTTDUNk9tZ4uay9rq/zmDUPakZJV/6n9OS1Q1CtObpXmrhMvh/0K3HisaGNmPD1QmjzxBfnInfakrv4TWDxovGgMMfazI96I93H6ZJSJ5hXx5Weh03606N+I9uTwv31MerRwKELjIb59ArVXZzctAavFkkORyDbBhX1n2iZiRpe2PgZOv3Ub41lsuG/qzX2p1CoXWB15bwT+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oSdPHGx3YAUW4V74+mcV4XaESBVwS969X5t4nFK1Gwg=;
 b=SBxGBVbqS/VRqKfuVy5/1rGg4dMKdo9z3COyA9UKUdIxz02+UggoYVNeH8uXF8s2P6YeWhrkzqphePy9JbvDsk5ViXZPxOh8zEb1aRHCHMY+blTtBbCWepDzNlgV5YdIeulZ3XkXDc3zOeS72FiizvPmhE/7hi/5q2+E5bxAOBdPLM3ToeDYpm/hSDsE2rG0VS7q9R+CIpS1sBtp3f5cJROoSIAkrecWYq1BotJdVNqk/i227q4IkR7zdZDP0zi/0z4ByhONj1pg8tR2EK3SZhU4yDv9CtPZVT0LZ/dB3sIOel2dmMT2M1ZQ+0N4OwmFKF3FHrVMfm07M82Ve1tPFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSdPHGx3YAUW4V74+mcV4XaESBVwS969X5t4nFK1Gwg=;
 b=wjscMZ9GmKJkc4xayobtzEJtqBEgsQYx93aAk1ZtVN+99SnTgjQxvoaylh1463eq4fto/vi2W/4GE6wQjjtaD/PoF+rfpAMSBUwP8TpA4Au3N6vvcI/MPTo/KWDOBHgJIdQAYGxVJ/ZchHojxNFUqK8rEfC5rf/74i/yZY/Smic=
Received: from BYAPR12MB3413.namprd12.prod.outlook.com (2603:10b6:a03:ab::15)
 by BYAPR12MB3127.namprd12.prod.outlook.com (2603:10b6:a03:d8::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Thu, 16 Dec
 2021 10:12:25 +0000
Received: from BYAPR12MB3413.namprd12.prod.outlook.com
 ([fe80::51c0:c3a7:fb8a:11e1]) by BYAPR12MB3413.namprd12.prod.outlook.com
 ([fe80::51c0:c3a7:fb8a:11e1%6]) with mapi id 15.20.4801.014; Thu, 16 Dec 2021
 10:12:25 +0000
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Dinh Nguyen <dinh.linux@gmail.com>,
        Dinh Nguyen <dinguyen@kernel.org>
CC:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: usb: dwc2: USB on Agilex platform broken after commit
 50fb0c128b6e
Thread-Topic: usb: dwc2: USB on Agilex platform broken after commit
 50fb0c128b6e
Thread-Index: AQHX7HzbUwJuJBhmmke0DEbt7fTUCKwwM9QAgABrygCAAErJAIAAoCqAgACg+ACAABDXgIAAC20AgAKqDQA=
Date:   Thu, 16 Dec 2021 10:12:24 +0000
Message-ID: <36414d2e-68de-b782-2544-cd598435b057@synopsys.com>
References: <81f48bdb-c97b-2f7c-293e-941ec44ee941@kernel.org>
 <5e8cbce0-3260-2971-484f-fc73a3b2bd28@synopsys.com>
 <0fe0ad93-1f17-5e88-e381-94544ac75185@kernel.org>
 <7ffb5888-2001-8de9-7104-db66797b2112@kernel.org>
 <6551e530-90a4-7c68-d097-7ffbeafbb400@synopsys.com>
 <f73dc0d1-45ef-985a-a3d1-bfe740a734e0@kernel.org>
 <eef16aee-a706-9b46-047b-edc825abe7a4@kernel.org>
 <CADhT+wccrybsjRCdrH2h+SorKKCGFJs+oh-YhtfXgcM0a1k4mw@mail.gmail.com>
In-Reply-To: <CADhT+wccrybsjRCdrH2h+SorKKCGFJs+oh-YhtfXgcM0a1k4mw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d30daf0e-1ffa-40c3-14b4-08d9c07c8ebd
x-ms-traffictypediagnostic: BYAPR12MB3127:EE_
x-microsoft-antispam-prvs: <BYAPR12MB312739AD9185C9D98F85CF86A7779@BYAPR12MB3127.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kjtbm3dDpSsHzg93w3wvpnrEGt/fi3+USme6N1bjN0cwOmIex2YCXf2t7qawat+EBsy1a81b36fcvC2J1fwweDYXZUk0yez/qf38hY+h1134yGI0m9KEMZEqsMNQAZkSsxzHA27TlDxB/a/SM5x1DhLcl9E33HpNxaATqn1NuqBkm2aictRVj+j1995nqRHp15ylZ5v/88impTJKoeadwKqffyScF9aUZE6w3msKrEBG02e5bxmkyIcO3exccBnzR9w+/Cp3fPvgbpbO0v8+sw8Nr4Jx1JinGd58PtWqknDfrUIYsbLttXNSbUY51PV+CjJUUVBCuYCnQiRqlqfGp19lfdl+uJ/tGrjomh8wEU3fWGKSRKacofLftdBG+tmQwnpWcO4NydxAGWjCT+Ksnjqn4yqCmyS1P3V5hpXcNMa+1evJx33AVtZt5flIv+5N2avDtAnQHUAVM9SagkaZ0SmIZBt+RDhu0SJwAhZJvXBoxCtRyoYdBVy/OZvqE/0Us0LqC9gsWVBJO1+bY+88WKZJgz/XLmwDJMFiBzuYumVHg7S5pO/MMszqefjDeLr7h20tmFxmjVmAoAXq8EDcCRRr0DvI83HfiTArrRhPP1AH7Fl4L7aOHqKewy173uWj8i4zjBINijcQjQJJRDbY2tXNwttPpR7cqSn26QMLc1J7++gFG6YNAhEJGN2v+LXGET+HPDAr3sJ34UMMsEiJjvSxiskyMnI8oZbTwBmSGYT3DPA9FwLu7raZV0ojv2xdhef2Lh+tV/sCnKGa6FbdVPCw53sfn6qbyEupZzBGptc9EvfKhJmED2RJ2ZoGUPgH19dJ/X1Uu1c6rGv8cb059jpvcULz6Y92Fda8ZGXKR2mEK2bOU8Z7v7Dc4x1v8NAq
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6512007)(66556008)(2616005)(508600001)(66446008)(38100700002)(122000001)(4326008)(64756008)(86362001)(71200400001)(26005)(66476007)(6486002)(53546011)(110136005)(316002)(31686004)(91956017)(76116006)(66946007)(2906002)(186003)(83380400001)(8936002)(5660300002)(36756003)(38070700005)(6506007)(54906003)(31696002)(8676002)(98903001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aU5ueGZqUWdUc3UyelV2Q0t6eEJVVDl6YzZtazlZNWwreUVqS2dXeEFpQzJV?=
 =?utf-8?B?cW1SLzE0MVUxa2RGUlVwam9SOVAyNDBRckpGLzRqRlFjaHM4d3ZKRFVTdGR4?=
 =?utf-8?B?eGRnY1NDVk9ZN2xyQWRpNlVmdm9FdHpTZm8wUm5YNVhOKzVtZnoyaHdUbWkx?=
 =?utf-8?B?eTgyOFZIZDQzU0xjYkI2enBQSFk0elhlVFFXV3RubUE1Zk5sZWRUTUdpeVZB?=
 =?utf-8?B?Rm9wK0d6aFFmdDRJVWdubktrMHBsVU4rWFZOb1k4Zk9jQ2dhdkJXNTRSWGpz?=
 =?utf-8?B?WU9ScllaRlZNUHpyUWJOZmZncjFaeHZ3U2JBN2Y4N2YzM3VQRzJJWXNjTVJC?=
 =?utf-8?B?b3E3eDlJZUVNQzFwb2JTbFVtNzlXemtIcm0xZW5pcW5WUjZVUTdWdGtjSDgv?=
 =?utf-8?B?azFsaS8vZE93QmI5VmE4dExJQitwNlJsQ2Z2V1ROcFRVOE4ycTdRcDc1RFJC?=
 =?utf-8?B?QjloYS9Yc3ZFSDJpV1I5Z09YV09Jby9WdzlmNHJUSHNuMGR1ZXcrakR2L0JO?=
 =?utf-8?B?eGdpSEhxQThBTFkvZzhEWVhKWXBURWNaVkpSSkN5UmxNZTFqWFp2d0ZQS2VM?=
 =?utf-8?B?eDBSMjQxZmFEc0JXdHdFSktWYmltRjRjUUN4R0RMaWRwWWVobEVkU0xUU3Rl?=
 =?utf-8?B?TkNqallmQUhWTDBFeHBKRlVZVzh3SXE2YVpLQVgvcjkyVm1wNWdHSDJ4SFpj?=
 =?utf-8?B?N0JPOElZb05pTmdsLzF3VnJJSWk3eDRRbFYvMXdETHdYQlNUYWRRUGE3ZGZ2?=
 =?utf-8?B?cEZuZ0pQemhFd1NtcHFFNThnVmZJY3lpZDluRDRFSlhYdk9FcEF4bzZ4d00x?=
 =?utf-8?B?ZFJzQzlpU0cxcUZITDY2S2hoSlJXSnc0QjZuMnpZcW80REV5MzZNSm91dmpN?=
 =?utf-8?B?OVZ0OFp4NGxVeXE3NHdtbElrRDZpd0J3eEVDUm51UmNoSUdZd0JVZzBWRWlX?=
 =?utf-8?B?Sng2RHBtcTdaTW15cjRXL1ZaWXpTd21WQlJhNXFuVEhCSHRocnNNRXFLWkVz?=
 =?utf-8?B?S01MTWxMQWZGTnJiVDZWZkorbXRlck1LY3ZwTjltWndVWGF5MVBSNGNVS1VV?=
 =?utf-8?B?ZCt3NmFOUGJHSmxVbTVzcVUvTFV5MU1XVW1kd21JZzJLdnJjVWpvTU9GeXpt?=
 =?utf-8?B?V2RoOVNtaWxzRVlvQUNLcVJ5NjVlaDdIWTgxV0tDOWswMUhqZ3BoOGlsL0N1?=
 =?utf-8?B?NmFIaHJJZzdJWVBLWTFpZDgwckZDdS83dnRoVmpZNTBxRU95bDBTS2R0QmJo?=
 =?utf-8?B?UEowQUdyVlVHcmJzTVV4d0lzTyttVXJERFRJRkxWUmVlU2lSejF1RmNJY1Fz?=
 =?utf-8?B?WEFPdmI2VGVVQVZ1RzQvVXdpbE1OL3JpNUdadzZ5bXdxZ3ZkV2poYWNYUmVY?=
 =?utf-8?B?TlE5SWtpckplVkh1TlhQK28xNlJ4VHlESUl2dElITnQrQjZKa0ZhMDJBZms4?=
 =?utf-8?B?bmVjRzlTU21xbWovcnVpL212T0pOUEhSNEtKRWdJK3RuOTYwTUMzQ3BlWWZ0?=
 =?utf-8?B?TVZMbHdscnNzaDJOQkpQZTBEL0FMSDVQM3JLODlkL2Nld0FpdWlaRGdtVVJa?=
 =?utf-8?B?bU92TTBQYUVCYkFjUUxRTjdnOUdEU0xPbjU1cDZCL2xFL2xYQThVMksyYlhD?=
 =?utf-8?B?QXJDZkVXOElWTUs4VnVzMTJKdFE4RzhmcWErVGdFZUcvVmJUQzlvUmFPN3hM?=
 =?utf-8?B?ZWtCcjVMNGx1dHRMVGY1ell6cnRvWU5yOU15U2JtTmU2WHNodVI3UDl1Zy9U?=
 =?utf-8?B?amZkNjdIU2pmVkRiQVUxWXU5QmYyNlJGMTJ6a08xK2hCWlB1MFNyOENSTnlp?=
 =?utf-8?B?K1I0enQvM0FtQzdHcE9tZWtPekYyM2NZS0Rza3J3Vk9mUTVBUjllQUQzRy91?=
 =?utf-8?B?UXdUZkRzU1JUUm92Sy9ja1BNSjg0QWhPN0Z2QW5rZUM5ZlJvalJoRm1WN3o2?=
 =?utf-8?B?VkQ3RmgxZW9xY2VaMi9BVXlUTHI3UGVzenNpZkNEMytQakU3eVdnSndOeVU0?=
 =?utf-8?B?VktJMkYxeDlROTlSWFpiZ2RjY0RERUUvb1FMajk1cklWS3M1RVB1aG5rQ1JK?=
 =?utf-8?B?bmVJOXI2alpGaksyUWI2R0dhTHR3MkV0eEZkcCtDazZYUngrSDY1ZFhYRnV2?=
 =?utf-8?B?Y0RzS0ExL1NVTVMweXFIcVc1bUlZclBpUFVhNERJWS9QRUJrWWRQS3QwTkpT?=
 =?utf-8?B?ZFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8DDB9A86C5DD3A41BE4925AED388CAD1@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d30daf0e-1ffa-40c3-14b4-08d9c07c8ebd
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2021 10:12:24.2870
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r5usQlMGR+jq9bfy0RLWPUcnP5lH7ALg6o4P40+vc8Yq6j13aomnYf6nD2m3sUr0GHrPxzqpah9FsKmkK6LR9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3127
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgRGluaCwNCg0KT24gMTIvMTQvMjAyMSA5OjMxIFBNLCBEaW5oIE5ndXllbiB3cm90ZToNCj4g
T24gVHVlLCBEZWMgMTQsIDIwMjEgYXQgMTA6NTAgQU0gRGluaCBOZ3V5ZW4gPGRpbmd1eWVuQGtl
cm5lbC5vcmc+IHdyb3RlOg0KPj4NCj4+DQo+Pg0KPj4gT24gMTIvMTQvMjEgOTo1MCBBTSwgRGlu
aCBOZ3V5ZW4gd3JvdGU6DQo+Pj4NCj4+Pg0KPj4+IE9uIDEyLzE0LzIxIDEyOjEzIEFNLCBNaW5h
cyBIYXJ1dHl1bnlhbiB3cm90ZToNCj4+Pj4gSGkgRGluaCwNCj4+Pj4NCj4+Pj4gT24gMTIvMTQv
MjAyMSAxMjo0MCBBTSwgRGluaCBOZ3V5ZW4gd3JvdGU6DQo+Pj4+Pg0KPj4+Pj4NCj4+Pj4+IE9u
IDEyLzEzLzIxIDEwOjEzIEFNLCBEaW5oIE5ndXllbiB3cm90ZToNCj4+Pj4+PiBIaSBNaW5hcywN
Cj4+Pj4+Pg0KPj4+Pj4+IFRoYW5rcyBmb3IgcmVwbHlpbmchDQo+Pj4+Pj4NCj4+Pj4+PiBPbiAx
Mi8xMy8yMSAzOjQ3IEFNLCBNaW5hcyBIYXJ1dHl1bnlhbiB3cm90ZToNCj4+Pj4+Pj4gSGkgRGlu
aCwNCj4+Pj4+Pj4NCj4+Pj4+Pj4gT24gMTIvOS8yMDIxIDE6NDQgQU0sIERpbmggTmd1eWVuIHdy
b3RlOg0KPj4+Pj4+Pj4gSGkgQXJ0aHVyLA0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+IFRoZSB1c2IgZHJp
dmVyIGlzIGdldHRpbmcgdGhpcyBlcnJvcjoNCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBbICAgIDEuNTM5
ODU2XSBIYXJkd2FyZSBuYW1lOiBTb0NGUEdBIEFnaWxleCBTb0NESyAoRFQpDQo+Pj4+Pj4+PiBb
ICAgIDEuNTQ0Nzk5XSBDYWxsIHRyYWNlOg0KPj4+Pj4+Pj4gWyAgICAxLjU0NzIzM10gIGR1bXBf
YmFja3RyYWNlKzB4MC8weDFjMA0KPj4+Pj4+Pj4gWyAgICAxLjU1MDg5N10gIHNob3dfc3RhY2sr
MHgxOC8weDY4DQo+Pj4+Pj4+PiBbICAgIDEuNTU0MjAyXSAgZHVtcF9zdGFjaysweGQ4LzB4MTM0
DQo+Pj4+Pj4+PiBbICAgIDEuNTU3NTk3XSAgX19yZXBvcnRfYmFkX2lycSsweDM4LzB4ZjANCj4+
Pj4+Pj4+IFsgICAgMS41NjE0MjNdICBub3RlX2ludGVycnVwdCsweDMxYy8weDNlOA0KPj4+Pj4+
Pj4gWyAgICAxLjU2NTI0NF0gIGhhbmRsZV9pcnFfZXZlbnRfcGVyY3B1KzB4NjAvMHg5MA0KPj4+
Pj4+Pj4gWyAgICAxLjU2OTY3MV0gIGhhbmRsZV9pcnFfZXZlbnQrMHg0OC8weGUwDQo+Pj4+Pj4+
PiBbICAgIDEuNTczNDkxXSAgaGFuZGxlX2Zhc3Rlb2lfaXJxKzB4YjAvMHgxMzgNCj4+Pj4+Pj4+
IFsgICAgMS41Nzc1NzRdICBnZW5lcmljX2hhbmRsZV9pcnErMHgzMC8weDQ4DQo+Pj4+Pj4+PiBb
ICAgIDEuNTgxNTY3XSAgX19oYW5kbGVfZG9tYWluX2lycSsweDYwLzB4YjgNCj4+Pj4+Pj4+IFsg
ICAgMS41ODU2NDZdICBnaWNfaGFuZGxlX2lycSsweGI0LzB4ZDANCj4+Pj4+Pj4+IFsgICAgMS41
ODkzMDBdICBlbDFfaXJxKzB4YjgvMHgxNTANCj4+Pj4+Pj4+IFsgICAgMS41OTI0MjhdICBhcmNo
X2NwdV9pZGxlKzB4MTgvMHgyOA0KPj4+Pj4+Pj4gWyAgICAxLjU5NTk5Ml0gIGRlZmF1bHRfaWRs
ZV9jYWxsKzB4MjQvMHg1Yw0KPj4+Pj4+Pj4gWyAgICAxLjU5OTg5OV0gIGRvX2lkbGUrMHgxZjQv
MHgyOTANCj4+Pj4+Pj4+IFsgICAgMS42MDMxMThdICBjcHVfc3RhcnR1cF9lbnRyeSsweDI4LzB4
NjgNCj4+Pj4+Pj4+IFsgICAgMS42MDcwMjZdICByZXN0X2luaXQrMHhkOC8weGU4DQo+Pj4+Pj4+
PiBbICAgIDEuNjEwMjQyXSAgYXJjaF9jYWxsX3Jlc3RfaW5pdCsweDEwLzB4MWMNCj4+Pj4+Pj4+
IFsgICAgMS42MTQzMjldICBzdGFydF9rZXJuZWwrMHg1MGMvMHg1NDQNCj4+Pj4+Pj4+IFsgICAg
MS42MTc5ODBdIGhhbmRsZXJzOg0KPj4+Pj4+Pj4gWyAgICAxLjYyMDI0MV0gWzwwMDAwMDAwMGFl
NjAxYWFjPl0gZHdjMl9oYW5kbGVfY29tbW9uX2ludHINCj4+Pj4+Pj4+IFsgICAgMS42MjU1NDFd
IFs8MDAwMDAwMDAyNTVkNzkzYT5dIGR3YzJfaHNvdGdfaXJxDQo+Pj4+Pj4+PiBbICAgIDEuNjMw
MDU2XSBbPDAwMDAwMDAwMGJjNjhhYjQ+XSB1c2JfaGNkX2lycQ0KPj4+Pj4+Pj4gWyAgICAxLjYz
NDMxMl0gRGlzYWJsaW5nIElSUSAjMzMNCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBBZnRlciBhIGdpdC1i
aXNlY3QsIHRoZSByZXN1bHQgaXMgdGhpcyBjb21taXQ6DQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4NCj4+
Pj4+Pj4+IGNvbW1pdCA1MGZiMGMxMjhiNmU4ZGY2MjIwMGJhODVjMDVlY2Q2YjEzOTY0NzZkDQo+
Pj4+Pj4+PiBBdXRob3I6IEFydHVyIFBldHJvc3lhbjxBcnRodXIuUGV0cm9zeWFuQHN5bm9wc3lz
LmNvbT4NCj4+Pj4+Pj4+IERhdGU6ICAgVHVlIEFwciAxMyAxMTozNzoxNSAyMDIxICswNDAwDQo+
Pj4+Pj4+Pg0KPj4+Pj4+Pj4gICAgICAgICB1c2I6IGR3YzI6IEFkZCBjbG9jayBnYXRpbmcgZW50
ZXJpbmcgZmxvdyBieSBzeXN0ZW0gc3VzcGVuZA0KPj4+Pj4+Pj4gICAgICAgICBJZiBub3QgaGli
ZXJuYXRpb24gbm9yIHBhcnRpYWwgcG93ZXIgZG93biBhcmUgc3VwcG9ydGVkLA0KPj4+Pj4+Pj4g
ICAgICAgICBjbG9jayBnYXRpbmcgaXMgdXNlZCB0byBzYXZlIHBvd2VyLg0KPj4+Pj4+Pj4gICAg
ICAgICBBZGRzIGEgbmV3IGZsb3cgb2YgZW50ZXJpbmcgY2xvY2sgZ2F0aW5nIHdoZW4gUEMgaXMN
Cj4+Pj4+Pj4+ICAgICAgICAgc3VzcGVuZGVkLg0KPj4+Pj4+Pj4gICAgICAgICBTaWduZWQtb2Zm
LWJ5OiBBcnR1ciBQZXRyb3N5YW48QXJ0aHVyLlBldHJvc3lhbkBzeW5vcHN5cy5jb20+DQo+Pj4+
Pj4+PiBMaW5rOmh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2xvcmUua2VybmVs
Lm9yZy9yLzIwMjEwNDEzMDczNzE2LjMwQzEzQTAwOTRAbWFpbGhvc3Quc3lub3BzeXMuY29tX187
ISFBNEYyUjlHX3BnIUlqR1M3MGNNWEI5bWlNblBkY29HcmlVcER2QVJtN1Njd3JsUVhBaUg5cU4t
Wm5wY2FpTV9nRC1LV3BfX19NVnl2RVBtX2RqSiQNCj4+Pj4+Pj4+DQo+Pj4+Pj4+Pg0KPj4+Pj4+
Pj4gICAgICAgICBTaWduZWQtb2ZmLWJ5OiBHcmVnIEtyb2FoLUhhcnRtYW48Z3JlZ2toQGxpbnV4
Zm91bmRhdGlvbi5vcmc+DQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gVGhlIERXQzIgVVNCIHZlcnNpb24g
b24gdGhlIEFnaWxleCBwbGF0Zm9ybSBpcw0KPj4+Pj4+Pj4gMHg0RjU0MzMwQQ0KPj4+Pj4+Pj4N
Cj4+Pj4+Pj4gQ291bGQgeW91IHBsZWFzZSBwcm92aWRlIEhXIGNvbmZpZ3VyYXRpb24gcmVnaXN0
ZXJzIHZhbHVlcw0KPj4+Pj4+PiAoR0hXQ0ZHMS00KS4NCj4+Pj4+Pj4NCj4+Pj4+Pg0KPj4+Pj4+
IFsgICAgMC45ODc3NzldIGR3YzIgZmZiMDAwMDAudXNiOiBHSFdDRkcxICAgIEAweEZGRkY4MDAw
MTI5NDAwNDQgOg0KPj4+Pj4+IDB4MDAwMDAwMDANCj4+Pj4+PiBbICAgIDAuOTk0NjQ0XSBkd2My
IGZmYjAwMDAwLnVzYjogR0hXQ0ZHMiAgICBAMHhGRkZGODAwMDEyOTQwMDQ4IDoNCj4+Pj4+PiAw
eDIzOEZGQzkwDQo+Pj4+Pj4gWyAgICAxLjAwMTQ5OF0gZHdjMiBmZmIwMDAwMC51c2I6IEdIV0NG
RzMgICAgQDB4RkZGRjgwMDAxMjk0MDA0QyA6DQo+Pj4+Pj4gMHgxRjgwMDJFOA0KPj4+Pj4+IFsg
ICAgMS4wMDgzNTBdIGR3YzIgZmZiMDAwMDAudXNiOiBHSFdDRkc0ICAgIEAweEZGRkY4MDAwMTI5
NDAwNTAgOg0KPj4+Pj4+IDB4RkUwRjAwMjANCj4+Pj4+Pg0KPj4+Pj4+DQo+Pj4+Pj4gSSBkaWQg
YSBsaXR0bGUgZGVidWdnaW5nLCBhbmQgbm90aWNlZCB0aGF0IHRoZSBHSU5UU1RTX1BSVElOVCBp
cw0KPj4+Pj4+IGZpcmluZywgc28gdGhlIGR3YzJfaGFuZGxlX2NvbW1vbl9pbnRyKCkgaXMgZ2V0
dGluZyBjYWxsZWQNCj4+Pj4+PiBjb250aW51b3VzbHkuIFRoZXJlJ3MgZG9lc24ndCBzZWVtIHRv
IGJlIHdheSB0byBoYW5kbGUgdGhlDQo+Pj4+Pj4gR0lOVFNUU19QUlRJTlQgYml0LCBiZWNhdXNl
IHRoZXJlJ3MgYSBjaGVjayBmb3IgZGV2aWNlX21vZGUoKS4NCj4+Pj4+Pg0KPj4+Pj4NCj4+Pj4+
IEl0IGxvb2tzIGxpa2UgdGhlIExQTU1vZGUgYml0IGlzIGRpc2FibGVkIGluIHRoZSBHSFdDRkcz
LiBDb3VsZCB0aGF0IGJlDQo+Pj4+PiB0aGUgcmVhc29uIHdoeT8NCj4+Pj4+DQo+Pj4+PiBEaW5o
DQo+Pj4+DQo+Pj4+IENvdWxkIHlvdSBwbGVhc2UgZGlzYWJsZSBjbG9jayBnYXRpbmcgYnkgYWRk
aW5nIHRvDQo+Pj4+IGR3YzJfc2V0X2RlZmF1bHRfcGFyYW1zKCkgZnVuY3Rpb24gZm9sbG93IGxp
bmU6DQo+Pj4+IHAtPm5vX2Nsb2NrX2dhdGluZyA9IHRydWU7DQo+Pj4+IGxpa2UgaW4gZHdjMl9z
ZXRfczNjNjQwMF9wYXJhbXMoKSBmdW5jdGlvbi4NCj4+Pj4NCj4+Pg0KPj4+IFRoYXQgZGlkIG5v
dCBmaXggdGhlIGlzc3VlLiBIb3dldmVyLCBpZiBJIHJlbW92ZSB0aGUgbGluZToNCj4+Pg0KPj4+
ICsgICAgICAgICAgICAgICAvKiBBZnRlciBlbnRlcmluZyBzdXNwZW5kLCBoYXJkd2FyZSBpcyBu
b3QgYWNjZXNzaWJsZSAqLw0KPj4+ICsgICAgICAgICAgICAgICBjbGVhcl9iaXQoSENEX0ZMQUdf
SFdfQUNDRVNTSUJMRSwgJmhjZC0+ZmxhZ3MpOw0KPj4+DQo+Pj4gVGhlbiB0aGUgaXNzdWUgZ2V0
cyBmaXhlZC4NCj4+Pg0KPj4NCj4+IEkgZG9uJ3Qgc2VlIF9kd2MyX2hjZF9yZXN1bWUoKSBnZXR0
aW5nIGNhbGxlZC4NCj4+DQo+IA0KPiBUaGlzIGZpeGVzIGl0Og0KPiANCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvdXNiL2R3YzIvaGNkLmMgYi9kcml2ZXJzL3VzYi9kd2MyL2hjZC5jDQo+IGluZGV4
IDEzYzc3OWEyOGU5NC4uZjYzYTI3ZDExZmFjIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9k
d2MyL2hjZC5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzIvaGNkLmMNCj4gQEAgLTQzOTksMTEg
KzQzOTksMTIgQEAgc3RhdGljIGludCBfZHdjMl9oY2Rfc3VzcGVuZChzdHJ1Y3QgdXNiX2hjZCAq
aGNkKQ0KPiAgICAgICAgICAgICAgICAgICAqIElmIG5vdCBoaWJlcm5hdGlvbiBub3IgcGFydGlh
bCBwb3dlciBkb3duIGFyZSBzdXBwb3J0ZWQsDQo+ICAgICAgICAgICAgICAgICAgICogY2xvY2sg
Z2F0aW5nIGlzIHVzZWQgdG8gc2F2ZSBwb3dlci4NCj4gICAgICAgICAgICAgICAgICAgKi8NCj4g
LSAgICAgICAgICAgICAgIGlmICghaHNvdGctPnBhcmFtcy5ub19jbG9ja19nYXRpbmcpDQo+ICsg
ICAgICAgICAgICAgICBpZiAoIWhzb3RnLT5wYXJhbXMubm9fY2xvY2tfZ2F0aW5nKSB7DQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICBkd2MyX2hvc3RfZW50ZXJfY2xvY2tfZ2F0aW5nKGhzb3Rn
KTsNCj4gDQo+IC0gICAgICAgICAgICAgICAvKiBBZnRlciBlbnRlcmluZyBzdXNwZW5kLCBoYXJk
d2FyZSBpcyBub3QgYWNjZXNzaWJsZSAqLw0KPiAtICAgICAgICAgICAgICAgY2xlYXJfYml0KEhD
RF9GTEFHX0hXX0FDQ0VTU0lCTEUsICZoY2QtPmZsYWdzKTsNCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgLyogQWZ0ZXIgZW50ZXJpbmcgc3VzcGVuZCwgaGFyZHdhcmUgaXMgbm90IGFjY2Vzc2li
bGUgKi8NCj4gKyAgICAgICAgICAgICAgICAgICAgICAgY2xlYXJfYml0KEhDRF9GTEFHX0hXX0FD
Q0VTU0lCTEUsICZoY2QtPmZsYWdzKTsNCj4gKyAgICAgICAgICAgICAgIH0NCj4gICAgICAgICAg
ICAgICAgICBicmVhazsNCj4gICAgICAgICAgZGVmYXVsdDoNCj4gICAgICAgICAgICAgICAgICBn
b3RvIHNraXBfcG93ZXJfc2F2aW5nOw0KDQpHb29kLCB0aGlzIHBhdGNoIGFjY2VwdGFibGUuDQoN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzIvcGFyYW1zLmMgYi9kcml2ZXJzL3VzYi9k
d2MyL3BhcmFtcy5jDQo+IGluZGV4IGQzMDBhZTNkOTI3NC4uOTEwMmZlOGY2MDIxIDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MyL3BhcmFtcy5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3
YzIvcGFyYW1zLmMNCj4gQEAgLTQ0MCw2ICs0NDAsNyBAQCBzdGF0aWMgdm9pZCBkd2MyX3NldF9k
ZWZhdWx0X3BhcmFtcyhzdHJ1Y3QNCj4gZHdjMl9oc290ZyAqaHNvdGcpDQo+ICAgICAgICAgICAg
ICAgICAgcC0+Z19ucF90eF9maWZvX3NpemUgPSAxMDI0Ow0KPiAgICAgICAgICAgICAgICAgIGR3
YzJfc2V0X3BhcmFtX3R4X2ZpZm9fc2l6ZXMoaHNvdGcpOw0KPiAgICAgICAgICB9DQo+ICsgICAg
ICAgcC0+bm9fY2xvY2tfZ2F0aW5nID0gdHJ1ZTsNCkNhbiBiZSB5b3VyIHBsYXRmb3JtIEFnaWxl
eCBpbmNsdWRlZCBpbiBsaXN0IG9mIGNhcGFiaWxpdGllcyBkZXZpY2UgYW5kIA0KInAtPm5vX2Ns
b2NrX2dhdGluZyA9IHRydWU7IiBwZWZvcm1lZCBpbnNpZGUgdG8gcGxhdGZvcm0gc3BlY2lmaWMg
DQpzZXR0aW5ncyBmdW5jdGlvbiBpbnN0ZWFkIG9mIGR3YzJfc2V0X2RlZmF1bHRfcGFyYW1zKCk/
DQoNClRoYW5rcywNCk1pbmFzDQoNCg0KPiAgIH0NCg0K
