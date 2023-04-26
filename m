Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E24376EEB88
	for <lists+linux-usb@lfdr.de>; Wed, 26 Apr 2023 02:42:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237880AbjDZAmM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Apr 2023 20:42:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229772AbjDZAmL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Apr 2023 20:42:11 -0400
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8AA149DF
        for <linux-usb@vger.kernel.org>; Tue, 25 Apr 2023 17:42:07 -0700 (PDT)
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33PNaW5L001529;
        Tue, 25 Apr 2023 17:42:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=FmxRPqBezuPxt1eZk7AUKsb4t0OIKZztayjQq0mnpDk=;
 b=G4OP0bg8pa8q6Y2lwpXBsmHfSYofXfgQZhpUHgYXava1xWYmdyu/1o4klH0xXdh8MzK+
 68gOkHHWbSME6E7CURulpT3AAsI3Yk2ledDVnu+BURuKMMzEVvjxEPqo47q7PYytIpuD
 FPXgIvvfTvbTNGk/Eu5u0M5mvzdjZaMCKWpo/JQLE7hRNT99qb58QP+7ACGA5gEnqxcU
 1hUEB689hr6dsq4lN/1APkyQT53KlMZWba6P9p9+XoeWtIEpaumXsfwG/j9772rCpR3P
 YC7kqM9/6AC56k/vGVYDXhZ6AMstRfdJ8L0ls/fsSixzxUEp0MoExqjrDduHcVwzcxvu Hg== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3q4yt1uvux-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 25 Apr 2023 17:42:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1682469724; bh=FmxRPqBezuPxt1eZk7AUKsb4t0OIKZztayjQq0mnpDk=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=UXs0pnAvDI1Zx3Jd5U6G3nqPp2FTBior77qdMbLYUTKUTE2eBymIKFuKQ1j7Ji1zN
         Gx9cGMAa1iwvMzlMp0AvNSYNVgJcNQS3P5s+Xbmy0x529yOJkfX4FDOmT2SNsfcz7K
         X0n6pYL1Ee1XYqsIax7zqDS1Yt9OTKjxacA/5CU1pxJgcrG4PeLV6qkQZHeBkPI70p
         kYfA/ekgPAUk6fZhdEKHDUj9Srv34hT0aQ1wLKWC1HYJIgpZ5y6TvcEuqJFQJiY5kH
         ZyvyU1OsmLWiqeEiq67PUsaGuczQb65pNaCI+o4tuUQg8Gd+u/ToWHjg0RTlyUkvVt
         Nn+wBGBrl5sww==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7F11440524;
        Wed, 26 Apr 2023 00:42:04 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id DC330A0062;
        Wed, 26 Apr 2023 00:42:03 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=q8LVXMYK;
        dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 48F2140615;
        Wed, 26 Apr 2023 00:42:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M9OVbDC/ZJyyB1IspZljv+4Bic4LdCr8hdE98sFXCadXO205QQNLw/aQw7+9SfciI6pSE5IiZHeOgB4uo48/DXYGeb87OoTWanVMbyzdQakCkoncDNJDmZce15tBPac8VsGrghSC31NXb0IagCl415F6u5KFaC3oZQLTjiEMNt1rLgS98gz9BuUQNjrc/IZSI3UTFclUC4VcbIBZkx8bS6RQ+8Dn6YwL2gU880pLqSsawLtKqqK3kEOjqtRBQfyhGfk3w5hDxPxRSVlZcseThL9QPlQHSdIjn0cg7Ai6S9uSbBhppPPuzOs4Osr1VUEPixymjWEba01LFWPE4njLzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FmxRPqBezuPxt1eZk7AUKsb4t0OIKZztayjQq0mnpDk=;
 b=IXA01Cq2TKaDV29tgzKx8lcdRmA4wb1Fv4eBdps2xzZCWilJ6WaIL8Dr5IGwivEV2znPfFQ60Qai4sesZFbQ4rOjq2o6hmUk+nVaFTOKYfrDH2zU6Xj06awS10KYTiW/ccYVS4VmicksGFpCGU/eZDpYI31M+zN76TNCrVzcsyMpTQC9/hLc+LxwWRBhnfnD3q7DLdXXY3Qtp2NAYvU3ShvQeKeEScc7K9vBaGXcCy+hV4tjT/hVIyawqyt/R1d6coQULqiZmq4/AnalnwN2zNxIPVXgZMPNITyfrrEuSdUOVn8v8Hxep1p6TuCG2xLmqvRRdZCSpahXkIBU+Ax8JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FmxRPqBezuPxt1eZk7AUKsb4t0OIKZztayjQq0mnpDk=;
 b=q8LVXMYKP2gGckZsH/XzIZ8uM0hHThTC4GUhEfCqwXNmp9NEZk3kVA7v9QS3qWdfErTq5fJ2XlRqkUngi6OLpO3aGMyDkR8PronbxqNw4m4pIg3mprLajStFvygNU8nVPn1YHb7FQS8f7TbkB0NS6BwK1m8qyjp/UhIPcAEEdWA=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BY5PR12MB4146.namprd12.prod.outlook.com (2603:10b6:a03:20d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.34; Wed, 26 Apr
 2023 00:41:59 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3103:ba85:b667:315d]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3103:ba85:b667:315d%7]) with mapi id 15.20.6319.034; Wed, 26 Apr 2023
 00:41:59 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v4] usb: dwc3: update link state on each device level
 interrupt
Thread-Topic: [PATCH v4] usb: dwc3: update link state on each device level
 interrupt
Thread-Index: AQHZdyXrgX/aOSabu02bEoEcSOoyba88wXmA
Date:   Wed, 26 Apr 2023 00:41:59 +0000
Message-ID: <20230426004149.kd6ndy6b2ncpaokv@synopsys.com>
References: <1682393256-15572-1-git-send-email-quic_linyyuan@quicinc.com>
In-Reply-To: <1682393256-15572-1-git-send-email-quic_linyyuan@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|BY5PR12MB4146:EE_
x-ms-office365-filtering-correlation-id: 226a4557-99e7-42a0-5b56-08db45ef0b75
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ESa/lcrghRIv17HdZJdxTW7ic4dPab6Uby0Na0YIFJ8mIv5QzDZLIyuTrOY0m1+SE1bv+d7Sd+qX37VmSdx2g6Lspuh0PR7i9onBkxSzUSw+r2vLClC8fP1EmjmLS2pLoCOSnJXodwAiqmDHlaWlXfgIUlwuOfOF48fZNCr7YNgfMuUjBa9z7vKW9b2ewFSwKOe3akJ/la3gfrWWoQxvzu/NglwmxMSgf2VgRVFiVyebtFuLUSPa5+R/ZbWHfQK/SHiTmlbZ4cQMpSW3kjU6cgN9284evQOVCk5UicvXW7EahaFCGFQxKm8JweF25FHMjlDeksinqzh9dylReV8XypCSplO1Gj1SpGRYsEnTCH5/AyMNkb7uTqsjgIAmNURJnY9dPkzO+BOi8CP1WOXSChXSzcH0bddAbDQOcPdJjQN5GY0OJvDEIQ40K55oUSn1+eBffsAYacA/Tl0q2BkD7hQLucq7KMuFkuRrs+tl52xYW36nACUFkic5irCD6ACYOR9mJoJEzObu8+PbVvKpXGA3ScmeeDZPxVYlxzcv0GMAfPFjbql/GPhJACat4SXqjIi9jLvx6gpQNFL2e0FrPKm9OCxeTIJioo3wXnKVRcLMNmGNvTY2hUMhFdQFMJlzrkJhG0jxsv3oDuKshleikg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39850400004)(136003)(346002)(396003)(376002)(366004)(451199021)(316002)(66446008)(64756008)(15650500001)(4326008)(6916009)(38100700002)(41300700001)(122000001)(5660300002)(8936002)(8676002)(36756003)(86362001)(38070700005)(2906002)(66476007)(66556008)(966005)(6486002)(71200400001)(6512007)(1076003)(26005)(6506007)(478600001)(2616005)(83380400001)(186003)(54906003)(76116006)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Rjgxd1UwWkVjeUFkNWZ4L2d1K0l2c3BhUVlIQ0x0U3lPZE5xWG5qMmMzN2Ux?=
 =?utf-8?B?ZTFTVFhQOXNRRko0UlBQUGtUVTFCSzNPZXBYZmZ1VVoybkJ5KzZXY3Fwa21t?=
 =?utf-8?B?M3VjMG5ZYkx1Nk9LWkFzdlA0NlZkTU9QWGJ6bXoyeHpOanZta01GRE9URHFQ?=
 =?utf-8?B?d2ZVMmF0WUExVWJZaXNPY1BWNUZiaXg0QUVxV3hkTnRiZEcvNDNrYWVkN2xm?=
 =?utf-8?B?WXVvK1diL0VJemxwR3NpMW4vZTFTY05Zak10THZmYUhXaWM5bE9tUXNZMk5Z?=
 =?utf-8?B?UWZGZnAvUnRZNXVTMVVLQ0pXZXVSY1NwUW9CWFNKV25IU2RobkJXaWcvYWJL?=
 =?utf-8?B?QUNCdHgrTzJhdE1OMmt1TmpwK0Ztb3BhVE9vdm5JenNMZkIxNm9ET2NKZkJr?=
 =?utf-8?B?dWZLeVVoUW5WQW8yZFRoSzllMHVPNU1qYWg3eEdjSklsdklsd3RxLzZSc21C?=
 =?utf-8?B?V1FSbHhtNmx0RzdCVnhCRCtGQ3BzR3l6QmhyeGE3UnNnelpMYk1sdU03MkpQ?=
 =?utf-8?B?QzE4QkczK3FlRms5WlM4VVgzaER3TUtxRm9YSTJXbVlQMTZveE9uck9DaUla?=
 =?utf-8?B?T1BFcEZaSlFrZk80eEMzei9CUi9MVHpqdU1oekJmbWFjYkFaYW9UQUJBZ2h0?=
 =?utf-8?B?ckFZb0VuZUdTeVhlSU1hdUd4QzdwK083WDU0czZRd2NJY0c0QkhRZmxUSStq?=
 =?utf-8?B?RkJlTXBnaWlGZ1VwYXVMbnBaSU9KVXNIKzFOcmFVZnp4TUE0bjQ1dThGejNs?=
 =?utf-8?B?ZXJVSVFNL2V6SWNSdkxkNnVNZ2R5MndZYmIwKzRZMnR3SVJlRml0MFFWUGRQ?=
 =?utf-8?B?bWlpNXA4VlNvZGJqYS9lT0Mwd293ZTFCa09VSzJtMVpBdkZoT2VGbWlDZ1pT?=
 =?utf-8?B?bUVyRTVvUU1hM3FhcHJCTFVGRDk3STU2bkhwUDZqTkVjdkZNenFDT1h5amY5?=
 =?utf-8?B?Mlg1YnUyWEFxZEE2VU5DcnA5L0l0MHFwZDl3c0psS3NQTVNIalN6a0xpVTha?=
 =?utf-8?B?dHNwQ0tEYzM1YmFUTFZuRGFnam0rTTlQc1FGaVZFOVBuelR5dHd1TXZ2MVU3?=
 =?utf-8?B?b2N3UXl3aXVFSFBZY1dqbEtPcW95RFlBNTRvN2VSSXNrb1BJWE96YVZBQk5i?=
 =?utf-8?B?UEkxU0xzZlh2SjlnanNIbXR4QVhDS3d4TTVaZU1uazVneFBWUjNtV3UyYXFS?=
 =?utf-8?B?MUpsUXI1OFg4WmJ4Q0oyUWUzdFZVaUZCMHJCODI5TFpFcUp5bFVDcnFJRnpI?=
 =?utf-8?B?Y3UxTjI2NXlkMFZLKzNiMk15Rkdxd1I0WnMyeGVwUThtQjJDMXpwMlgxYjdY?=
 =?utf-8?B?RkxCVEJXUzhGYU5rSWJQQURMOFZPalRwYlpVZFZWOTVlZTNxc0R3eEllK3Er?=
 =?utf-8?B?SkJVWXdDcVlVS3BwQmVIMVNOQXFBc1JQcFEvaXFLemdrZFUvbmMrSEZGMkJY?=
 =?utf-8?B?UEZERFg2by8rU1hEK3djTWh3a2FJYWZWVk1ndlloS1VMTTl0U0czK2UzT0s2?=
 =?utf-8?B?dkpwUGRJa212S1FLWFJ1RHExL1QvR2tTNHZjYWc4Q3NHQkdBSlVsamdwamt3?=
 =?utf-8?B?Q3ljandVMmNlVVZQZ0FaNHJReHhWRjdRMjBwcExoMzVRUHhHZDV3ZnJXcXh1?=
 =?utf-8?B?Z1ZBV3F1Z0U0dzY3cHcxOWRZajNMdFdrejZoZm5HRllocmNmeXNlbWhGdllT?=
 =?utf-8?B?K0k1RWRhcEFRTk1aOG9xOURrb3NWd0xVNFpCayt6RlRSV2kwdzY3UjhBeWxY?=
 =?utf-8?B?MGtiMW05UEs4blVGNVlrcTdmc0xEWWMxbWlQdGN4Y3Q4MlF1NjhmbXhWUEsz?=
 =?utf-8?B?VzhDaVdGWU5mSHJMZVdpS0w3Q05nRnR6RXdiQTVIYkdybDEzUUEwdFdqaW1B?=
 =?utf-8?B?VDcrVEhWN29kUStHNHRQV0kvWVNIYWk1NHpBVXBaY0N6VXV0NjhmY1A0c0lP?=
 =?utf-8?B?M1hLUlBtSmttK3Nla1p5OHU0VXFzOVAxYWNucFZwejhrTlNXSnB3UGtUNzA5?=
 =?utf-8?B?ZlVCRVdnZk80cTVMU3lqTDZKd2VJOXFtaFpKNkN3OXZadE5QbE9LY3FLZHFw?=
 =?utf-8?B?WVd0RFR3VXlaOTFkWG9YcTFhektuZERySzVUeXZjaVZVZHAxSjFZK0kreUtS?=
 =?utf-8?B?VHZuL3o0M1hFZHFKb0tRN1FGWGVNRGx3bUtIRzQzZmlZYVE5aGx2SWhLZUNK?=
 =?utf-8?B?U2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <32239081D4FA684CA161A8DFE6F08113@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: xho21d3K0O18XPVol+/B4isMgfZHje4qc5AoxzIvyqImNrN0EnIOnSiyGxLEav9dYdYS1PeZsVL8DthDHM5EPtgnLOqjfz2VLtTDzIRlJhUfg5mtSqT5zJKpDjK4NCODonRJDSyyIUH7/ZL5FO5CMHDNXpu4ODA/T6t2wEf5e+mVKVCjEeF6SrQwSOZDNHPdxw6EZK2JE0sG861B0wEz3F5LVqC31ktmvEXd+W+aSIhVsjGq3fphtiE+PG25TX4oneBSuPymm6p0YHlN9unqa/Hk7s3J2Vw1YODLFFQ92qajpSqU+YSV7j89DNEzuhGbOQjbhlGMSibpzp3AAmKM1iJAFx2G820PziP0lvvVv38Ah2jUKGtd+t5LqHuZG7sgW2a6hpwZCwWZbE5/slkbcjwfg+rDhcVMIl8Wfad7BJt19NSK8KjH1tbATzYuJd2UoucfMlFkD1PQYEjCmnI/g4WF/YOsTqp3Y8vEGu/9xjLZ6BDKjepbHa/DDyQIqnuJAqtkZOAQ510Po3JlLtOxT+Ua+jZ8biXOqtc4IKv71C4mZ3bhp1JjZ43iHwFT6p8PQ3NYGoC5UZHz0OojtUs42/pbHJF0coGul06iADXxwsep7NUzZmymnw0QcOM7dJXCtQXTByWLM6lw/TJRxM4ZW3NTkax1sL5zRfkt11UIr/GYdjOlMAfrOBLhI+5pdWvRW4WnkWGpWkVddOD5Pmw9Epmuh0IsbbmrfFsFCW33AXEDnoU5B6YnAsojJfPMjeuE/ll51OzbeM/JP07PVAUWHeC6wn3AFRmE8zfoMxFQppBlvV0ySg/fFaMcYa0rR0bCr+U+u5pzNToACMhDyic4vCJS+GfoZ0htN51NfIOrz/DBCypgRCf7JuGA69dt7jIHq6/i3zLfEy5m62+/5gjXYg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 226a4557-99e7-42a0-5b56-08db45ef0b75
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2023 00:41:59.4691
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jh6AHBfmUBv6eEtPLo2SK6kr3FMf9FnKM8ldMbeaEigbzhtE5rr4LsVDnqAy5cy7nfMKBsnFct7V1gC9nCx6Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4146
X-Proofpoint-GUID: HJo5D4Fx2uvlzAqAnHY6NtY9PdKYjhao
X-Proofpoint-ORIG-GUID: HJo5D4Fx2uvlzAqAnHY6NtY9PdKYjhao
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-25_11,2023-04-25_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0 mlxlogscore=999
 impostorscore=0 phishscore=0 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304260004
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVHVlLCBBcHIgMjUsIDIwMjMsIExpbnl1IFl1YW4gd3JvdGU6DQo+IFdoZW4gd29yayBpbiBn
YWRnZXQgbW9kZSwgY3VycmVudGx5IGRyaXZlciBkb2Vzbid0IHVwZGF0ZSBzb2Z0d2FyZSBsZXZl
bA0KPiBsaW5rX3N0YXRlIGNvcnJlY3RseSBhcyBsaW5rIHN0YXRlIGNoYW5nZSBldmVudCBpcyBu
b3QgZW5hYmxlZCBmb3IgbW9zdA0KPiBkZXZpY2VzLCBpbiBmdW5jdGlvbiBkd2MzX2dhZGdldF9z
dXNwZW5kX2ludGVycnVwdCgpLCBpdCB3aWxsIG9ubHkgcGFzcw0KPiBzdXNwZW5kIGV2ZW50IHRv
IFVEQyBjb3JlIHdoZW4gc29mdHdhcmUgbGV2ZWwgbGluayBzdGF0ZSBjaGFuZ2VzLCBzbyB3aGVu
DQo+IGludGVycnVwdCBnZW5lcmF0ZWQgaW4gc2VxdWVuY2VzIG9mIHN1c3BlbmQgLT4gcmVzZXQg
LT4gY29ubmRvbmUgLT4NCj4gc3VzcGVuZCwgbGluayBzdGF0ZSBpcyBub3QgdXBkYXRlZCBkdXJp
bmcgcmVzZXQgYW5kIGNvbm5kb25lLCBzbyBzZWNvbmQNCj4gc3VzcGVuZCBpbnRlcnJ1cHQgZXZl
bnQgd2lsbCBub3QgcGFzcyB0byBVREMgY29yZS4NCj4gDQo+IEFzIGluIGdhZGdldCBtb2RlLCBk
ZXZpY2UgbGV2ZWwgaW50ZXJydXB0IGV2ZW50IGhhdmUgbGluayBzdGF0ZQ0KPiBpbmZvcm1hdGlv
biwgbGV0J3MgdHJ1c3QgaXQgYW5kIHVwZGF0ZSBzb2Z0d2FyZSBsZXZlbCBsaW5rIHN0YXRlIHRv
IGl0DQo+IHdoZW4gcHJvY2VzcyBlYWNoIGRldmljZSBsZXZlbCBpbnRlcnJ1cHQuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBMaW55dSBZdWFuIDxxdWljX2xpbnl5dWFuQHF1aWNpbmMuY29tPg0KPiAt
LS0NCj4gDQo+IHY0OiAocmVmZXIgdjMgaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXVzYi8xNjgyMDUzODYxLTIxNzM3LTEtZ2l0LXNlbmQt
ZW1haWwtcXVpY19saW55eXVhbkBxdWljaW5jLmNvbS9fXzshIUE0RjJSOUdfcGchYTEyV1R3bnlu
TVdldlRlOHRTeXh4M01vRjBYaEt6OWszOENqRnVZS09jMnZEMTlERU1sb3lVc1Z6dHdTeU1xb05l
cFV4b3h2NkR2VklxSzc3N0F0U2hhYlhMQ0hnZyQgKQ0KPiAxKSByZW1vdmUgbGluayBzdGF0ZSBj
aGVja2luZyBpbiBkd2MzX2dhZGdldF93YWtldXBfaW50ZXJydXB0KCkNCj4gMikgcmVtb3ZlIHR3
byBzd2l0Y2gvY2FzZSB0byBpZiBvcGVhcnRpb24NCj4gDQo+IHYzOiAocmVmZXIgdjIgaHR0cHM6
Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXVzYi8x
NjgyMDQyNDcyLTIxMjIyLTEtZ2l0LXNlbmQtZW1haWwtcXVpY19saW55eXVhbkBxdWljaW5jLmNv
bS9fXzshIUE0RjJSOUdfcGchYTEyV1R3bnluTVdldlRlOHRTeXh4M01vRjBYaEt6OWszOENqRnVZ
S09jMnZEMTlERU1sb3lVc1Z6dHdTeU1xb05lcFV4b3h2NkR2VklxSzc3N0F0U2haY2ZjY2tEZyQg
KQ0KPiBubyBjb2RlIGNoYW5nZSBzaW5jZSB2MiwgY2hhbmdlcyBjb21wYXJlIHYxIGFzIGJlbG93
LA0KPiAxKSBhZGQgYSBmbGFnIHN1c3BlbmRfaXJxX2hhcHBlbiB0byBzaW1wbGlmeSBkd2MzX2dh
ZGdldF9zdXNwZW5kX2ludGVycnVwdCgpLA0KPiAgICBpdCB3aWxsIGF2b2lkIHJlZmVyIHRvIHNv
ZnR3YXJlIGxldmVsIGxpbmtfc3RhdGUsIGZpbmFsbHkgbGlua19zdGF0ZSB3aWxsDQo+ICAgIG9u
bHkgdXNlZCBpbiBkd2MzX2dhZGdldF9saW5rc3RzX2NoYW5nZV9pbnRlcnJ1cHQoKS4NCj4gMikg
cmVtb3ZlIHN3IHNldHRpbmcgb2YgbGlua19zdGF0ZSBpbiBkd2MzX2dhZGdldF9mdW5jX3dha2V1
cCgpDQo+IDMpIGFkZCBkd2MzX2dhZGdldF9pbnRlcnJ1cHRfZWFybHkoKSB0byBjb3JyZWN0IHNl
dHRpbmcgb2YgbGlua19zdGF0ZQ0KPiAgICBhbmQgc3VzcGVuZF9pcnFfaGFwcGVuLg0KPiANCj4g
djI6IHVwZGF0ZSBhY2NvcmRpbmcgdjEgZGlzY3Vzc2lvbg0KPiB2MTogaHR0cHM6Ly91cmxkZWZl
bnNlLmNvbS92My9fX2h0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXVzYi8xNjc1MjIxMjg2
LTIzODMzLTEtZ2l0LXNlbmQtZW1haWwtcXVpY19saW55eXVhbkBxdWljaW5jLmNvbS9fXzshIUE0
RjJSOUdfcGchYTEyV1R3bnluTVdldlRlOHRTeXh4M01vRjBYaEt6OWszOENqRnVZS09jMnZEMTlE
RU1sb3lVc1Z6dHdTeU1xb05lcFV4b3h2NkR2VklxSzc3N0F0U2hZNkwxdjNSQSQgDQo+IA0KPiAg
ZHJpdmVycy91c2IvZHdjMy9jb3JlLmggICB8ICAxICsNCj4gIGRyaXZlcnMvdXNiL2R3YzMvZ2Fk
Z2V0LmMgfCAzMCArKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0NCj4gIDIgZmlsZXMgY2hh
bmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmggYi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuaA0KPiBp
bmRleCBkNTY0NTdjLi44NjIyZjljIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2Nv
cmUuaA0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuaA0KPiBAQCAtMTMzMiw2ICsxMzMy
LDcgQEAgc3RydWN0IGR3YzMgew0KPiAgCXVuc2lnbmVkCQlkaXNfc3BsaXRfcXVpcms6MTsNCj4g
IAl1bnNpZ25lZAkJYXN5bmNfY2FsbGJhY2tzOjE7DQo+ICAJdW5zaWduZWQJCXdha2V1cF9jb25m
aWd1cmVkOjE7DQo+ICsJdW5zaWduZWQJCXN1c3BlbmRfaXJxX2hhcHBlbjoxOw0KDQpTdGlsbCBu
b3QgZG9jdW1lbnRpbmcgdGhpcy4uLiBXaHk/DQoNCj4gIA0KPiAgCXUxNgkJCWltb2RfaW50ZXJ2
YWw7DQo+ICANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMgYi9kcml2
ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQo+IGluZGV4IGMwY2E0ZDEuLjlkYzY0YTQgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4gKysrIGIvZHJpdmVycy91c2IvZHdj
My9nYWRnZXQuYw0KPiBAQCAtMjQ0MCw3ICsyNDQwLDYgQEAgc3RhdGljIGludCBkd2MzX2dhZGdl
dF9mdW5jX3dha2V1cChzdHJ1Y3QgdXNiX2dhZGdldCAqZywgaW50IGludGZfaWQpDQo+ICAJCQly
ZXR1cm4gLUVJTlZBTDsNCj4gIAkJfQ0KPiAgCQlkd2MzX3Jlc3VtZV9nYWRnZXQoZHdjKTsNCj4g
LQkJZHdjLT5saW5rX3N0YXRlID0gRFdDM19MSU5LX1NUQVRFX1UwOw0KPiAgCX0NCj4gIA0KPiAg
CXJldCA9IGR3YzNfc2VuZF9nYWRnZXRfZ2VuZXJpY19jb21tYW5kKGR3YywgRFdDM19ER0NNRF9E
RVZfTk9USUZJQ0FUSU9OLA0KPiBAQCAtNDE3OCw3ICs0MTc3LDcgQEAgc3RhdGljIHZvaWQgZHdj
M19nYWRnZXRfY29ubmRvbmVfaW50ZXJydXB0KHN0cnVjdCBkd2MzICpkd2MpDQo+ICAJICovDQo+
ICB9DQo+ICANCj4gLXN0YXRpYyB2b2lkIGR3YzNfZ2FkZ2V0X3dha2V1cF9pbnRlcnJ1cHQoc3Ry
dWN0IGR3YzMgKmR3YywgdW5zaWduZWQgaW50IGV2dGluZm8pDQo+ICtzdGF0aWMgdm9pZCBkd2Mz
X2dhZGdldF93YWtldXBfaW50ZXJydXB0KHN0cnVjdCBkd2MzICpkd2MpDQo+ICB7DQo+ICAJLyoN
Cj4gIAkgKiBUT0RPIHRha2UgY29yZSBvdXQgb2YgbG93IHBvd2VyIG1vZGUgd2hlbiB0aGF0J3MN
Cj4gQEAgLTQxOTAsOCArNDE4OSw2IEBAIHN0YXRpYyB2b2lkIGR3YzNfZ2FkZ2V0X3dha2V1cF9p
bnRlcnJ1cHQoc3RydWN0IGR3YzMgKmR3YywgdW5zaWduZWQgaW50IGV2dGluZm8pDQo+ICAJCWR3
Yy0+Z2FkZ2V0X2RyaXZlci0+cmVzdW1lKGR3Yy0+Z2FkZ2V0KTsNCj4gIAkJc3Bpbl9sb2NrKCZk
d2MtPmxvY2spOw0KPiAgCX0NCj4gLQ0KPiAtCWR3Yy0+bGlua19zdGF0ZSA9IGV2dGluZm8gJiBE
V0MzX0xJTktfU1RBVEVfTUFTSzsNCj4gIH0NCj4gIA0KPiAgc3RhdGljIHZvaWQgZHdjM19nYWRn
ZXRfbGlua3N0c19jaGFuZ2VfaW50ZXJydXB0KHN0cnVjdCBkd2MzICpkd2MsDQo+IEBAIC00Mjk4
LDIwICs0Mjk1LDI5IEBAIHN0YXRpYyB2b2lkIGR3YzNfZ2FkZ2V0X2xpbmtzdHNfY2hhbmdlX2lu
dGVycnVwdChzdHJ1Y3QgZHdjMyAqZHdjLA0KPiAgCWR3Yy0+bGlua19zdGF0ZSA9IG5leHQ7DQo+
ICB9DQo+ICANCj4gLXN0YXRpYyB2b2lkIGR3YzNfZ2FkZ2V0X3N1c3BlbmRfaW50ZXJydXB0KHN0
cnVjdCBkd2MzICpkd2MsDQo+IC0JCQkJCSAgdW5zaWduZWQgaW50IGV2dGluZm8pDQo+ICtzdGF0
aWMgdm9pZCBkd2MzX2dhZGdldF9zdXNwZW5kX2ludGVycnVwdChzdHJ1Y3QgZHdjMyAqZHdjKQ0K
PiAgew0KPiAtCWVudW0gZHdjM19saW5rX3N0YXRlIG5leHQgPSBldnRpbmZvICYgRFdDM19MSU5L
X1NUQVRFX01BU0s7DQo+IC0NCj4gLQlpZiAoZHdjLT5saW5rX3N0YXRlICE9IG5leHQgJiYgbmV4
dCA9PSBEV0MzX0xJTktfU1RBVEVfVTMpDQo+ICsJaWYgKCFkd2MtPnN1c3BlbmRfaXJxX2hhcHBl
bikgew0KPiArCQlkd2MtPnN1c3BlbmRfaXJxX2hhcHBlbiA9IHRydWU7DQo+ICAJCWR3YzNfc3Vz
cGVuZF9nYWRnZXQoZHdjKTsNCj4gKwl9DQo+ICt9DQo+ICANCj4gLQlkd2MtPmxpbmtfc3RhdGUg
PSBuZXh0Ow0KPiArc3RhdGljIGlubGluZSB2b2lkIGR3YzNfZ2FkZ2V0X2ludGVycnVwdF9lYXJs
eShzdHJ1Y3QgZHdjMyAqZHdjLA0KPiArCQkJY29uc3Qgc3RydWN0IGR3YzNfZXZlbnRfZGV2dCAq
ZXZlbnQpDQo+ICt7DQo+ICsJaWYgKGV2ZW50LT50eXBlICE9IERXQzNfREVWSUNFX0VWRU5UX0xJ
TktfU1RBVFVTX0NIQU5HRSkNCj4gKwkJZHdjLT5saW5rX3N0YXRlID0gZXZlbnQtPmV2ZW50X2lu
Zm8gJiBEV0MzX0xJTktfU1RBVEVfTUFTSzsNCj4gKw0KPiArCWlmICAoZXZlbnQtPnR5cGUgIT0g
RFdDM19ERVZJQ0VfRVZFTlRfU1VTUEVORCkNCj4gKwkJZHdjLT5zdXNwZW5kX2lycV9oYXBwZW4g
PSBmYWxzZTsNCj4gIH0NCj4gIA0KPiAgc3RhdGljIHZvaWQgZHdjM19nYWRnZXRfaW50ZXJydXB0
KHN0cnVjdCBkd2MzICpkd2MsDQo+ICAJCWNvbnN0IHN0cnVjdCBkd2MzX2V2ZW50X2RldnQgKmV2
ZW50KQ0KPiAgew0KPiArCWR3YzNfZ2FkZ2V0X2ludGVycnVwdF9lYXJseShkd2MsIGV2ZW50KTsN
Cj4gKw0KDQpUaGlzIG1heSBjYXVzZSByZWdyZXNzaW9uIGZvciB0aGUgcXVpcmsgZm9yIGR3Y191
c2IzIHYyLjUwYSBhbmQNCnByZXZpb3VzIGFzIG5vdGVkIGVhcmxpZXIuIFdoeSBhcmUgeW91IHN0
aWxsIGRvaW5nIGl0IGxpa2UgdGhpcz8NCg0KQlIsDQpUaGluaA0KDQo+ICAJc3dpdGNoIChldmVu
dC0+dHlwZSkgew0KPiAgCWNhc2UgRFdDM19ERVZJQ0VfRVZFTlRfRElTQ09OTkVDVDoNCj4gIAkJ
ZHdjM19nYWRnZXRfZGlzY29ubmVjdF9pbnRlcnJ1cHQoZHdjKTsNCj4gQEAgLTQzMjMsNyArNDMy
OSw3IEBAIHN0YXRpYyB2b2lkIGR3YzNfZ2FkZ2V0X2ludGVycnVwdChzdHJ1Y3QgZHdjMyAqZHdj
LA0KPiAgCQlkd2MzX2dhZGdldF9jb25uZG9uZV9pbnRlcnJ1cHQoZHdjKTsNCj4gIAkJYnJlYWs7
DQo+ICAJY2FzZSBEV0MzX0RFVklDRV9FVkVOVF9XQUtFVVA6DQo+IC0JCWR3YzNfZ2FkZ2V0X3dh
a2V1cF9pbnRlcnJ1cHQoZHdjLCBldmVudC0+ZXZlbnRfaW5mbyk7DQo+ICsJCWR3YzNfZ2FkZ2V0
X3dha2V1cF9pbnRlcnJ1cHQoZHdjKTsNCj4gIAkJYnJlYWs7DQo+ICAJY2FzZSBEV0MzX0RFVklD
RV9FVkVOVF9ISUJFUl9SRVE6DQo+ICAJCWRldl9XQVJOX09OQ0UoZHdjLT5kZXYsIHRydWUsICJ1
bmV4cGVjdGVkIGhpYmVybmF0aW9uIGV2ZW50XG4iKTsNCj4gQEAgLTQzMzQsNyArNDM0MCw3IEBA
IHN0YXRpYyB2b2lkIGR3YzNfZ2FkZ2V0X2ludGVycnVwdChzdHJ1Y3QgZHdjMyAqZHdjLA0KPiAg
CWNhc2UgRFdDM19ERVZJQ0VfRVZFTlRfU1VTUEVORDoNCj4gIAkJLyogSXQgY2hhbmdlZCB0byBi
ZSBzdXNwZW5kIGV2ZW50IGZvciB2ZXJzaW9uIDIuMzBhIGFuZCBhYm92ZSAqLw0KPiAgCQlpZiAo
IURXQzNfVkVSX0lTX1BSSU9SKERXQzMsIDIzMEEpKQ0KPiAtCQkJZHdjM19nYWRnZXRfc3VzcGVu
ZF9pbnRlcnJ1cHQoZHdjLCBldmVudC0+ZXZlbnRfaW5mbyk7DQo+ICsJCQlkd2MzX2dhZGdldF9z
dXNwZW5kX2ludGVycnVwdChkd2MpOw0KPiAgCQlicmVhazsNCj4gIAljYXNlIERXQzNfREVWSUNF
X0VWRU5UX1NPRjoNCj4gIAljYXNlIERXQzNfREVWSUNFX0VWRU5UX0VSUkFUSUNfRVJST1I6DQo+
IC0tIA0KPiAyLjcuNA0KPiA=
