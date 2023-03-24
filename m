Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF8556C74CD
	for <lists+linux-usb@lfdr.de>; Fri, 24 Mar 2023 01:59:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231206AbjCXA7c (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Mar 2023 20:59:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229616AbjCXA7a (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Mar 2023 20:59:30 -0400
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23F332A6EC;
        Thu, 23 Mar 2023 17:59:28 -0700 (PDT)
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32NLw5QZ006040;
        Thu, 23 Mar 2023 17:59:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=Ku9YXIoscFuK6t3gAZBXCy7WknKbNg1QKSx3BBTb91o=;
 b=KT3vP19Dn3Ut/JslZKZ69civOpPekcBImBnFFWVG9/plfYp276WF8aThBEtlPCVfxnx1
 iaW2uuGsY++Ea0pTRjBbHaZzVk1r7+PMRayn4Y04Q8db96adEVSzUvXMPUTXP49xF4YH
 W9JKTjXchrnxJyNUnNj84+Ic/dg1YCloUCBGo2epkrZ6ECbFth+KVg2srEhQWr0GzTAm
 zfVWjzs2psFeKZntRbwNzCly6ek2sSzSqgPkH+FXcLNU8z5w+9XT5iJd2LoJpvA9i2CO
 o9RUTNLWi2Ad5U0wccSEIEg5xe5kRPf170lD80L2reJoPGTnX3M3xgj86yBwefJFnsMG JQ== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3pgxkcrs0a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 23 Mar 2023 17:59:14 -0700
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7FC1BC0447;
        Fri, 24 Mar 2023 00:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1679619553; bh=Ku9YXIoscFuK6t3gAZBXCy7WknKbNg1QKSx3BBTb91o=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=T7eD+FgM7J06FARfBn0eDjM3UM83wwu35of3JrClMhHwx898VKtW2OzZRVmqXLZLj
         0wwIbN4OKjulDOHYzgTDiMuq2BfXeRdRgbxRXjvSAS0nsHebAaw8du3xHhKHAko1kp
         td20lz4X1GdP3XGuTPViJPjCVWa5uGNUaRTjYKcuk6aElaxxSLqEOyKHI8gnAbctOz
         3ZNiE47ZJoPNezjzD7tiNZHjSyCUvgRrqvauVQDTARbXobLLCrGVVMLZXxxnmDQBTF
         0v7Um9Dq2BLms3V80ydE2QACnOc6xCO6hanoIhQUuqAaU3yqHSD0hYQxfbKNTsA/FO
         +2dvkn6F5k8DQ==
Received: from o365relay-in.synopsys.com (us03-o365relay5.synopsys.com [10.4.161.141])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id BB7C6A005A;
        Fri, 24 Mar 2023 00:59:12 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2109.outbound.protection.outlook.com [104.47.70.109])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 5AE10806EA;
        Fri, 24 Mar 2023 00:59:11 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="aZUucSR5";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zap3RPbKUaPSEj7USw/uoUch8hOwUwJF3ZtCkjoB77rK0ihgPvz72Z7a6f8AyZEY5JE28jMaMlwXj+XkqJLDf/H7ReBJfbeUoPTEdO9c7+037VUSZwK+Xji7lXYgCfLaIkdF7vQ/E2cptz0QoE0vsBm6p2ZekZQq3sFSuePCrnXSqBcbGOnED3JuQXqX475hey0b7wsaX/vEoSD1rVFiszMGhrTGuEgx79R/B25/+GqyLBL5FJf1H5RopCsSyiFR1kxi3Qs2HjeTS21+GOz5vxXGMaSlwII0gtOb7ipjXSOCdPdwpxGcBRfYARcItrHEXBY/TSQBr+RF1yAzbb2goQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ku9YXIoscFuK6t3gAZBXCy7WknKbNg1QKSx3BBTb91o=;
 b=n8cDzT84R2BQL3vMOFtPLf/W8C8/WcRGrXteO/DQ7U08o2QB8Z+F9pVhgRnbf3/8/+GUDXjDWhAClzrLoehr6W/a5+z3M+tGX/DuH7agycIr/9Di9+++7WxXZuQIlSupss2BNkHEw2EDz9OTofAjJ2xM19MO+E0oUEMCVFDp9iNj95jFVE3rzKgtE5cT8cpC74e6SN3Xa6dLDTpLK94VEyzFOVp+gcSTkmwgoeA/0pgekTIH5jh912RAdwVqaqRe+iPfYZ2yKd+2g+qtxg24eBknSMyoMMX1e1RYeMRv2OKbC0gWA/bl/1TVprYdY3HlXyQtyZ1UbkCo0AELs1Cjjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ku9YXIoscFuK6t3gAZBXCy7WknKbNg1QKSx3BBTb91o=;
 b=aZUucSR5oHJ649lEt32kW1PXKtGw2NYpokD0vgF+oBpIkgoZbG610bH1g0VWb1ACnBhCRpYqaYg8ApbapLqHmhhgS5EmT1uUS9qvQPoDRunaNbXAOpjuBFcaURXE2seVwRNVZc8O6l+5cY0Gzp4wyynGEGnQ/qb0iFx9s1pKoLM=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by DM6PR12MB4578.namprd12.prod.outlook.com (2603:10b6:5:2a9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Fri, 24 Mar
 2023 00:59:07 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3161:c44d:8bb3:423f]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3161:c44d:8bb3:423f%3]) with mapi id 15.20.6178.038; Fri, 24 Mar 2023
 00:59:07 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Elson Serrao <quic_eserrao@quicinc.com>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "quic_wcheng@quicinc.com" <quic_wcheng@quicinc.com>,
        "quic_jackp@quicinc.com" <quic_jackp@quicinc.com>
Subject: Re: [PATCH v12 6/6] usb: gadget: f_ecm: Add suspend/resume and remote
 wakeup support
Thread-Topic: [PATCH v12 6/6] usb: gadget: f_ecm: Add suspend/resume and
 remote wakeup support
Thread-Index: AQHZWGBkIcbTRueiF0WmOHHs1egwbK7+GWGAgAEqaoCAADpLgIAAHyEAgAARwACAACI6AIAEJKWAgAUkJACAAAzqAA==
Date:   Fri, 24 Mar 2023 00:59:06 +0000
Message-ID: <20230324005902.iv2rrhaik57m23yd@synopsys.com>
References: <1679009888-8239-1-git-send-email-quic_eserrao@quicinc.com>
 <1679009888-8239-7-git-send-email-quic_eserrao@quicinc.com>
 <20230317001149.nlvcj2y3fuvq32qt@synopsys.com>
 <0bf5bddd-515b-76b6-f22f-9da10a140d83@quicinc.com>
 <20230317212831.bcapq26jnuk2vkws@synopsys.com>
 <20230317231956.w3kr3zcy44odxdko@synopsys.com>
 <2632a958-2750-c057-2606-c2541efff392@quicinc.com>
 <20230318022558.z5v5ktfus5yt4atc@synopsys.com>
 <da2d298c-19d9-f304-6b1c-f2ecbc816fb6@quicinc.com>
 <6025a716-739e-671e-af95-44b397a695c4@quicinc.com>
In-Reply-To: <6025a716-739e-671e-af95-44b397a695c4@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|DM6PR12MB4578:EE_
x-ms-office365-filtering-correlation-id: 7d5f41df-db1b-4ffa-d03b-08db2c02f805
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: N3FGxVlFA7BQ6wrZPjM3uFV2wkZPDMQZeiA43xzGGNI/7fsMZZUbZAX7/DdYTsp7jFTJU+tJdwqXBPevD+W2QRaP16T0vHrY5WOCLc8LVO/TIkU0lj8zkpfqKq1yxGX7dBUidXmRRTvy2fzXoMYqqIntIeHeQvayoBt10Az2lj6DQTTs8bI+3FWHhce/Dtz60vi+K5GLrqQkwz48+mylYH4KHaNURfZh3rNNaZCLjHdcsgYEY4GDeI7BbUleyhLJLvWE5rGrLHrpFLi4nkOHwR9k+Gw/88mg7CnOmXNgNzUaQl6SZ5UVg41MLymxjKADm821o3SSwzzgsvBt2ymDttHEnyr4LeOxTpDNBBzqT1blYpZJ7OT39ehAztN8T1Kidn3SfT6nasxNylXi9OVo6eOqggmTiVHruxFF5ejQ2Wy3CS0j1o6r+k5oNyleoG5A/hZP23a/UJHUHkwsWzMaBreYBMq5QjPcDh0MOKFwGKxXIqRsc37mAEyA8MNfN90bJPHlJY6r8PPubuM1HKAB/annPGDt2jwjRvTPQHS1W/VoQ06kat6VJxyFYTp6wbnXUkrUPPh+1Jth4qboajL9ekPgFzaJampiNS04AsFNAHroIfMZqXhY6/4PsZWNLJShkv6rue8OyGmwpkCCOePfBi7eIXqToZjO3+hNYkXlekNif50yTvztbxkBGUvsn3XT+WVQEes9nNkhctgXcyhqSw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(136003)(366004)(376002)(396003)(346002)(451199018)(6486002)(66446008)(8676002)(64756008)(4326008)(5660300002)(53546011)(66556008)(66946007)(66476007)(1076003)(30864003)(6916009)(76116006)(41300700001)(8936002)(26005)(122000001)(15650500001)(316002)(6512007)(6506007)(54906003)(2616005)(186003)(71200400001)(478600001)(83380400001)(86362001)(36756003)(38070700005)(38100700002)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ODhtbkNwY3Q5amg1UndTTjlCYlBHMzN3VTF2Y0JERlpUTCtxRjZ6bVdwSGww?=
 =?utf-8?B?ZDFaL21JanZLQWFZMXdreGo0cVg1cEE4Y0JnQmpKaUQvZXhxMVRZaTRQbStr?=
 =?utf-8?B?SDd4U016VXNodVU0aSt4ci8rWDd2US81Y0VjRVZaekI5elh0VnJPYmx0cnNy?=
 =?utf-8?B?OUZOUmxRNGZJMUg1MWtMM3ljYmRDcHAwamUvUmFhQVR1cnVtL1lPL0x2b1ZG?=
 =?utf-8?B?NzBOUnVuTlMvaTZVaDd6VUc4TVp0L0FSOGg3RWJQMDR1djloK1VJQmVJUjhz?=
 =?utf-8?B?NTdmbEY5UmxzQVAwN2p2V3lDN0xKR2VpbWVYRHYrZGNCeVpvS0JwOStoTEhP?=
 =?utf-8?B?bWowUkl6MXdmVkZCNHAxWjBsWXcrVGxNeDA5aVpJRk90cVZORnVxU21DWXFP?=
 =?utf-8?B?eWg4bFRRbTNjMVJwYi9lV3ZJeFZvV1p5TmJ1NWpGM04yQ0dad1l6N2FMcTVL?=
 =?utf-8?B?M3RaVmROSkRzSmdiaVBBQXRQYlAxalJmS3RhQVNmeUpESDg0Z0RneExmd1Iw?=
 =?utf-8?B?UU9QOVhkb0ZweW9OZ1pKc2RNdXJwaG90UFZ3TU5nYnNybk90dSszd2V1QUxw?=
 =?utf-8?B?MDZjNzRKc00wL1M4TnhicEYzbXNSMUZ3SXpRakR0MHM2ZFlHbmM1c2xmOHh4?=
 =?utf-8?B?VEFYVzVLNnBKalp4cFE1YW5LTmVDaHVobFB1UE9wNmdjTkc0VC9Oei9yVTJS?=
 =?utf-8?B?bitmcXBSNUR4enhIRldyRVprOUdrQW9lcSszemJMbkxvU2M0WXJMdlF6R3Ry?=
 =?utf-8?B?dU1Zc0JUam1sQi9MS29oS0lWeWIwQThrMU1IRU9sYmY1NUpXUWdqeGw3Vzhi?=
 =?utf-8?B?QnFlcENWeHF6NUFpd0FDVjJBK2hGK1RZdnJQajVPcmVVV0xoZ2NGYTJtOEVF?=
 =?utf-8?B?S0UzMFU1UUJTUlJJaEQwU2xYcWI0YU1neWtmY1JsUnF4LzdaaVhBOWFaM0JX?=
 =?utf-8?B?VGxnNGVLMGxTOER1a0tKTXpiVEJiKzVLNXFjWVlweFhjREdaUVVhdkpCNmVR?=
 =?utf-8?B?MUtMM2VQMFpDRGFyemlWcTBXc3FQVHdsL2k0eDN3bCtCdzRubUdkaG5qMFYx?=
 =?utf-8?B?dDhJalhPVG9lZDZjS0F2bjBNb3l0MmRBdGVhR0F3UlAxM2ZOSXFtRkZUd3Rv?=
 =?utf-8?B?dDlDZ1UwNUw3THo3ZnBpbHRxZkQ4cnpCclRrK1VUVDQ0Tll2YTNmamE3OW1S?=
 =?utf-8?B?QlZ1M3hqMFFVVTkyUVhJNmYwaDN1bWY4YjhvNys5NjViKzlhZ3p1elZ4elJz?=
 =?utf-8?B?Q2twN3hlV2RkYlFVUW1mbDJNeFZIUnFrN2VSU2dMcHNUcEcyaldMc004U2M2?=
 =?utf-8?B?YzVBN3VWUmIyYVcwb1ZKRUMzN3ZLV3VMMkFLdmhVdjNXZEhGbjR6aU02aFJn?=
 =?utf-8?B?Z3RuMEpVeUszRUcwcHZIMHBkYlhvcWllSjJtK05WVnkzUGhXRHozSzJ2ejJ5?=
 =?utf-8?B?bzFFNzk1bGs2V1hOTTJReExXeHVQVzd5R1RKR1pUUjVzLzFwZlhUcVNWWUlP?=
 =?utf-8?B?akdrQ2p6YW1hQzVENkJFckhtR01nNHBaTVZoN0s5VHY3VS93UzY1c0s0SUhp?=
 =?utf-8?B?ZTNVTURCU2dGRXd5K1NUcU9hOFExMlExcjk4ZU5zVzBaeURSUDRoR1FkSTJC?=
 =?utf-8?B?Mk9odCt3MDZQUHhTZDE5RWU3a3paOVZ3VXRkS1djQVYzQjEzNlN0R21EYnZU?=
 =?utf-8?B?MCs3WEZXN2pUdWpuN0w5NmRjOXNCVFNlRFl5U2EyWDVTdlFVcHFtbGpGVFNn?=
 =?utf-8?B?Z3hUWEQxTEZzcUJNd05yL1RiQXowTHZQVEw4cVRLZTRreVliSjRyMkxZMEVy?=
 =?utf-8?B?SVM4L0FSaExqMnBPS1o0dkd5Y095L0FoL1pSQkNkY1I1N2IvSFUrTUNjM2xi?=
 =?utf-8?B?Ync4cGJ2T3BXMWdoeVY0K3l3dmVQK3diRVdzWmlRVW5aS1k4L3U3UmFsTE55?=
 =?utf-8?B?emtjWEE4NjJILzQwdUFITWtFMEwxc2pTQ2lhcG83Z1hCWVhyZ1dYbEt2Nmsw?=
 =?utf-8?B?S2VrOTIvNVo4QWhEYW9VVXFwOXY5YUNMQmZ0b2x6aHZXcjFXVTlDSnR5UFdx?=
 =?utf-8?B?dHdkNXkyS2RSOXUvSWJCd1R5dWVoMUFsMzBvNkg3VkZZQmYwWHJCRnRRUTB5?=
 =?utf-8?B?NUxlcEhjTENBRWpzQlcweW5ZQ3laNzZvYmY5YTRWZjJGd04vcTA1RHFjOFUz?=
 =?utf-8?B?R3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A86F266E679BB54DAB984F0F228DC250@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: KIPaUjge0xrWQay2lxeR+dR8qOaOmeVHiQMMZAKkEPXd9JsUJ4dHz+C5+IByx1AzFt//SJrOt6F0jKaGj5B4KtgE1/JfyDlHHVWvB3xAKQF/+yVhOLC0I2AYgIFhTnCr2XIwE2Dm92zDQV2qC1BDplt5OsmXt6E5ClpK+dl6DbGzrOzFYDLvN+4CYDSODe+eVNwE8MAQKcC77oQKbcPpf6v+pjVM73L1GjW3UbqpVQX2uCmf3F7yY75YzN3m8wf6SJhJce8C+ADoevbhGSXLd344fi/QAPJYUhmFbZ8jq5Tw5llgxqT3n4B/DLThixq5d4am/DZCyBEt3tCSgibu09AW3GBm+x1ZmC+YkLCJoMgUnSyW37r07xw24M2eY9uvu7b9Tay0czbYTk18GvOPq4Mf6546ie3drk8V9PVC79lKHH2U1fR8QZZWFZgH2uTI20ZvGfCobX/HoPOz4yw7JM5EoNWcVAMvq8klRcfazDOeoIMUriwM+FZPlwW5gOAlpCs674OwRfzuED5SbVhYgCyJXbiMgdhqf6a2rDfTKf9QvHlaJYtoP34q9wzHvfxoTVQi3aZu1lmkNj1fXmSmOcifv6XxJk+Qlordyw6L4tN3vpjdz/mfqcx26pngEiy51OxMj1C1gKuNLuCCcmCSk+ZCVBRJS4v+nnq7PHJC1EgU1hFlzmtDE4pjGlfbJZm3ITn9MKdGM5Pie7nF0/hicgNqCyHuo94NaRRFqraj6N9ot9B3jHjXv1qR+WdTAT/c/xAkOAEDshHGQ8taUAbCnAGW5OtwHf8ogTV/ROvU1hiS1MI+nvl3DAWzyT5mJt/EWnsRkSZiXpyFrP71S/SnjICChnfzQXLpXdU2fIJQ13cZJuW9IsgE8uPefhFSQV7Fm2zVMSvY6O/7cCFcY22P+A==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d5f41df-db1b-4ffa-d03b-08db2c02f805
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2023 00:59:06.5431
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /nZvklaYQuHiRUtG+ByB7GCRnbv047QIXhCjnTRP6zje9vTDGQQqFEexhUIupQ1VeZ0nkq/zO7jBuaeG+xXeUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4578
X-Proofpoint-GUID: KxKueAYIbwCBWWPDGZMXkOv5m251VpXx
X-Proofpoint-ORIG-GUID: KxKueAYIbwCBWWPDGZMXkOv5m251VpXx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-23_15,2023-03-23_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxscore=0 suspectscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2303240006
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVGh1LCBNYXIgMjMsIDIwMjMsIEVsc29uIFNlcnJhbyB3cm90ZToNCj4gDQo+IA0KPiBPbiAz
LzIwLzIwMjMgMTA6NDIgQU0sIEVsc29uIFNlcnJhbyB3cm90ZToNCj4gPiANCj4gPiANCj4gPiBP
biAzLzE3LzIwMjMgNzoyNiBQTSwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+ID4gT24gRnJpLCBN
YXIgMTcsIDIwMjMsIEVsc29uIFNlcnJhbyB3cm90ZToNCj4gPiA+ID4gDQo+ID4gPiA+IA0KPiA+
ID4gPiBPbiAzLzE3LzIwMjMgNDoyMCBQTSwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+ID4gPiA+
IE9uIEZyaSwgTWFyIDE3LCAyMDIzLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4gPiA+ID4gPiBP
biBGcmksIE1hciAxNywgMjAyMywgRWxzb24gU2VycmFvIHdyb3RlOg0KPiA+ID4gPiA+ID4gPiAN
Cj4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+IE9uIDMvMTYvMjAyMyA1OjExIFBNLCBUaGlu
aCBOZ3V5ZW4gd3JvdGU6DQo+ID4gPiA+ID4gPiA+ID4gT24gVGh1LCBNYXIgMTYsIDIwMjMsIEVs
c29uIFJveSBTZXJyYW8gd3JvdGU6DQo+ID4gPiA+ID4gPiA+ID4gPiBXaGVuIGhvc3Qgc2VuZHMg
YSBzdXNwZW5kIG5vdGlmaWNhdGlvbiB0byB0aGUgZGV2aWNlLCBoYW5kbGUNCj4gPiA+ID4gPiA+
ID4gPiA+IHRoZSBzdXNwZW5kIGNhbGxiYWNrcyBpbiB0aGUgZnVuY3Rpb24gZHJpdmVyLiBFbmhh
bmNlZCBzdXBlcg0KPiA+ID4gPiA+ID4gPiA+ID4gc3BlZWQgZGV2aWNlcyBjYW4gc3VwcG9ydCBm
dW5jdGlvbiBzdXNwZW5kIGZlYXR1cmUgdG8gcHV0IHRoZQ0KPiA+ID4gPiA+ID4gPiA+ID4gZnVu
Y3Rpb24gaW4gc3VzcGVuZCBzdGF0ZS4gSGFuZGxlIGZ1bmN0aW9uIHN1c3BlbmQgY2FsbGJhY2su
DQo+ID4gPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gPiA+IERlcGVuZGluZyBvbiB0aGUg
cmVtb3RlIHdha2V1cCBjYXBhYmlsaXR5IHRoZSBkZXZpY2UgY2FuIGVpdGhlcg0KPiA+ID4gPiA+
ID4gPiA+ID4gdHJpZ2dlciBhIHJlbW90ZSB3YWtldXAgb3Igd2FpdCBmb3IgdGhlIGhvc3QgaW5p
dGlhdGVkIHJlc3VtZSB0bw0KPiA+ID4gPiA+ID4gPiA+ID4gc3RhcnQgZGF0YSB0cmFuc2ZlciBh
Z2Fpbi4NCj4gPiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1i
eTogRWxzb24gUm95IFNlcnJhbyA8cXVpY19lc2VycmFvQHF1aWNpbmMuY29tPg0KPiA+ID4gPiA+
ID4gPiA+ID4gLS0tDQo+ID4gPiA+ID4gPiA+ID4gPiDCoMKgwqAgZHJpdmVycy91c2IvZ2FkZ2V0
L2Z1bmN0aW9uL2ZfZWNtLmPCoMKgIHwNCj4gPiA+ID4gPiA+ID4gPiA+IDcxICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gPiA+ID4gPiA+ID4gPiDCoMKgwqAgZHJpdmVy
cy91c2IvZ2FkZ2V0L2Z1bmN0aW9uL3VfZXRoZXIuYyB8DQo+ID4gPiA+ID4gPiA+ID4gPiA2MyAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gPiA+ID4gPiA+ID4gPiDCoMKgwqAg
ZHJpdmVycy91c2IvZ2FkZ2V0L2Z1bmN0aW9uL3VfZXRoZXIuaCB8wqAgNCArKw0KPiA+ID4gPiA+
ID4gPiA+ID4gwqDCoMKgIDMgZmlsZXMgY2hhbmdlZCwgMTM4IGluc2VydGlvbnMoKykNCj4gPiA+
ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+ID4gZGlmZiAtLWdpdA0KPiA+ID4gPiA+ID4g
PiA+ID4gYS9kcml2ZXJzL3VzYi9nYWRnZXQvZnVuY3Rpb24vZl9lY20uYw0KPiA+ID4gPiA+ID4g
PiA+ID4gYi9kcml2ZXJzL3VzYi9nYWRnZXQvZnVuY3Rpb24vZl9lY20uYw0KPiA+ID4gPiA+ID4g
PiA+ID4gaW5kZXggYTdhYjMwZS4uYzQzY2Q1NTcgMTAwNjQ0DQo+ID4gPiA+ID4gPiA+ID4gPiAt
LS0gYS9kcml2ZXJzL3VzYi9nYWRnZXQvZnVuY3Rpb24vZl9lY20uYw0KPiA+ID4gPiA+ID4gPiA+
ID4gKysrIGIvZHJpdmVycy91c2IvZ2FkZ2V0L2Z1bmN0aW9uL2ZfZWNtLmMNCj4gPiA+ID4gPiA+
ID4gPiA+IEBAIC02MzMsNiArNjMzLDggQEAgc3RhdGljIHZvaWQgZWNtX2Rpc2FibGUoc3RydWN0
IHVzYl9mdW5jdGlvbiAqZikNCj4gPiA+ID4gPiA+ID4gPiA+IMKgwqDCoMKgwqDCoMKgIHVzYl9l
cF9kaXNhYmxlKGVjbS0+bm90aWZ5KTsNCj4gPiA+ID4gPiA+ID4gPiA+IMKgwqDCoMKgwqDCoMKg
IGVjbS0+bm90aWZ5LT5kZXNjID0gTlVMTDsNCj4gPiA+ID4gPiA+ID4gPiA+ICvCoMKgwqAgZi0+
ZnVuY19zdXNwZW5kZWQgPSBmYWxzZTsNCj4gPiA+ID4gPiA+ID4gPiA+ICvCoMKgwqAgZi0+ZnVu
Y193YWtldXBfYXJtZWQgPSBmYWxzZTsNCj4gPiA+ID4gPiA+ID4gPiA+IMKgwqDCoCB9DQo+ID4g
PiA+ID4gPiA+ID4gPiAgICAgIC8qLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSovDQo+ID4gPiA+ID4gPiA+ID4g
PiANCj4gPiA+ID4gPiA+ID4gPiA+IEBAIC04ODUsNiArODg3LDcxIEBAIHN0YXRpYyBzdHJ1Y3QN
Cj4gPiA+ID4gPiA+ID4gPiA+IHVzYl9mdW5jdGlvbl9pbnN0YW5jZSAqZWNtX2FsbG9jX2luc3Qo
dm9pZCkNCj4gPiA+ID4gPiA+ID4gPiA+IMKgwqDCoMKgwqDCoMKgIHJldHVybiAmb3B0cy0+ZnVu
Y19pbnN0Ow0KPiA+ID4gPiA+ID4gPiA+ID4gwqDCoMKgIH0NCj4gPiA+ID4gPiA+ID4gPiA+ICtz
dGF0aWMgdm9pZCBlY21fc3VzcGVuZChzdHJ1Y3QgdXNiX2Z1bmN0aW9uICpmKQ0KPiA+ID4gPiA+
ID4gPiA+ID4gK3sNCj4gPiA+ID4gPiA+ID4gPiA+ICvCoMKgwqAgc3RydWN0IGZfZWNtICplY20g
PSBmdW5jX3RvX2VjbShmKTsNCj4gPiA+ID4gPiA+ID4gPiA+ICvCoMKgwqAgc3RydWN0IHVzYl9j
b21wb3NpdGVfZGV2ICpjZGV2ID0gZWNtLT5wb3J0LmZ1bmMuY29uZmlnLT5jZGV2Ow0KPiA+ID4g
PiA+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ID4gPiA+ID4gK8KgwqDCoCBpZiAoZi0+ZnVuY19zdXNw
ZW5kZWQpIHsNCj4gPiA+ID4gPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoCBEQkcoY2RldiwgIkZ1
bmN0aW9uIGFscmVhZHkgc3VzcGVuZGVkXG4iKTsNCj4gPiA+ID4gPiA+ID4gPiA+ICvCoMKgwqDC
oMKgwqDCoCByZXR1cm47DQo+ID4gPiA+ID4gPiA+ID4gPiArwqDCoMKgIH0NCj4gPiA+ID4gPiA+
ID4gPiA+ICsNCj4gPiA+ID4gPiA+ID4gPiA+ICvCoMKgwqAgREJHKGNkZXYsICJFQ00gU3VzcGVu
ZFxuIik7DQo+ID4gPiA+ID4gPiA+ID4gPiArDQo+ID4gPiA+ID4gPiA+ID4gPiArwqDCoMKgIGdl
dGhlcl9zdXNwZW5kKCZlY20tPnBvcnQpOw0KPiA+ID4gPiA+ID4gPiA+ID4gK30NCj4gPiA+ID4g
PiA+ID4gPiA+ICsNCj4gPiA+ID4gPiA+ID4gPiA+ICtzdGF0aWMgdm9pZCBlY21fcmVzdW1lKHN0
cnVjdCB1c2JfZnVuY3Rpb24gKmYpDQo+ID4gPiA+ID4gPiA+ID4gPiArew0KPiA+ID4gPiA+ID4g
PiA+ID4gK8KgwqDCoCBzdHJ1Y3QgZl9lY20gKmVjbSA9IGZ1bmNfdG9fZWNtKGYpOw0KPiA+ID4g
PiA+ID4gPiA+ID4gK8KgwqDCoCBzdHJ1Y3QgdXNiX2NvbXBvc2l0ZV9kZXYgKmNkZXYgPSBlY20t
PnBvcnQuZnVuYy5jb25maWctPmNkZXY7DQo+ID4gPiA+ID4gPiA+ID4gPiArDQo+ID4gPiA+ID4g
PiA+ID4gPiArwqDCoMKgIC8qDQo+ID4gPiA+ID4gPiA+ID4gPiArwqDCoMKgwqAgKiBJZiB0aGUg
ZnVuY3Rpb24gaXMgaW4gVVNCMyBGdW5jdGlvbg0KPiA+ID4gPiA+ID4gPiA+ID4gU3VzcGVuZCBz
dGF0ZSwgcmVzdW1lIGlzDQo+ID4gPiA+ID4gPiA+ID4gPiArwqDCoMKgwqAgKiBjYW5jZWxlZC4g
SW4gdGhpcyBjYXNlIHJlc3VtZSBpcw0KPiA+ID4gPiA+ID4gPiA+ID4gZG9uZSBieSBhIEZ1bmN0
aW9uIFJlc3VtZSByZXF1ZXN0Lg0KPiA+ID4gPiA+ID4gPiA+ID4gK8KgwqDCoMKgICovDQo+ID4g
PiA+ID4gPiA+ID4gPiArwqDCoMKgIGlmIChmLT5mdW5jX3N1c3BlbmRlZCkNCj4gPiA+ID4gPiA+
ID4gPiA+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm47DQo+ID4gPiA+ID4gPiA+ID4gPiArDQo+ID4g
PiA+ID4gPiA+ID4gPiArwqDCoMKgIERCRyhjZGV2LCAiRUNNIFJlc3VtZVxuIik7DQo+ID4gPiA+
ID4gPiA+ID4gPiArDQo+ID4gPiA+ID4gPiA+ID4gPiArwqDCoMKgIGdldGhlcl9yZXN1bWUoJmVj
bS0+cG9ydCk7DQo+ID4gPiA+ID4gPiA+ID4gPiArfQ0KPiA+ID4gPiA+ID4gPiA+ID4gKw0KPiA+
ID4gPiA+ID4gPiA+ID4gK3N0YXRpYyBpbnQgZWNtX2dldF9zdGF0dXMoc3RydWN0IHVzYl9mdW5j
dGlvbiAqZikNCj4gPiA+ID4gPiA+ID4gPiA+ICt7DQo+ID4gPiA+ID4gPiA+ID4gPiArwqDCoMKg
IHN0cnVjdCB1c2JfY29uZmlndXJhdGlvbiAqYyA9IGYtPmNvbmZpZzsNCj4gPiA+ID4gPiA+ID4g
PiA+ICsNCj4gPiA+ID4gPiA+ID4gPiA+ICvCoMKgwqAgLyogRDAgYW5kIEQxIGJpdCBzZXQgdG8g
MCBpZiBkZXZpY2UgaXMgbm90IHdha2V1cCBjYXBhYmxlICovDQo+ID4gPiA+ID4gPiA+ID4gPiAr
wqDCoMKgIGlmICghKFVTQl9DT05GSUdfQVRUX1dBS0VVUCAmIGMtPmJtQXR0cmlidXRlcykpDQo+
ID4gPiA+ID4gPiA+ID4gPiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIDA7DQo+ID4gPiA+ID4gPiA+
ID4gPiArDQo+ID4gPiA+ID4gPiA+ID4gPiArwqDCoMKgIHJldHVybiAoZi0+ZnVuY193YWtldXBf
YXJtZWQgPyBVU0JfSU5UUkZfU1RBVF9GVU5DX1JXIDogMCkgfA0KPiA+ID4gPiA+ID4gPiA+ID4g
K8KgwqDCoMKgwqDCoMKgIFVTQl9JTlRSRl9TVEFUX0ZVTkNfUldfQ0FQOw0KPiA+ID4gPiA+ID4g
PiA+ID4gK30NCj4gPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gPiBXaHkgZG8gd2UgbmVl
ZCB0byBpbXBsZW1lbnQgZWNtX2dldF9zdGF0dXMgaWYNCj4gPiA+ID4gPiA+ID4gPiBpdCdzIGFs
cmVhZHkgaGFuZGxlZCBpbg0KPiA+ID4gPiA+ID4gPiA+IGNvbXBvc2l0ZS5jIG5vdz8NCj4gPiA+
ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+IFllcyB0aGlzIGNhbiBi
ZSByZW1vdmVkIG5vdy4gV2lsbCBtb2RpZnkgYWNjb3JkaW5nbHkuDQo+ID4gPiA+ID4gPiA+ID4g
PiArDQo+ID4gPiA+ID4gPiA+ID4gPiArc3RhdGljIGludCBlY21fZnVuY19zdXNwZW5kKHN0cnVj
dCB1c2JfZnVuY3Rpb24gKmYsIHU4IG9wdGlvbnMpDQo+ID4gPiA+ID4gPiA+ID4gPiArew0KPiA+
ID4gPiA+ID4gPiA+ID4gK8KgwqDCoCBzdHJ1Y3QgdXNiX2NvbXBvc2l0ZV9kZXYgKmNkZXYgPSBm
LT5jb25maWctPmNkZXY7DQo+ID4gPiA+ID4gPiA+ID4gPiArDQo+ID4gPiA+ID4gPiA+ID4gPiAr
wqDCoMKgIERCRyhjZGV2LCAiZnVuYyBzdXNwICV1IGNtZFxuIiwgb3B0aW9ucyk7DQo+ID4gPiA+
ID4gPiA+ID4gPiArDQo+ID4gPiA+ID4gPiA+ID4gPiArwqDCoMKgIGlmIChvcHRpb25zICYgKFVT
Ql9JTlRSRl9GVU5DX1NVU1BFTkRfTFAgPj4gOCkpIHsNCj4gPiA+ID4gPiA+ID4gPiANCj4gPiA+
ID4gPiA+ID4gPiBUaGlzIGZlYXR1cmUgc2VsZWN0b3IgZG9lc24ndCBpbmRpY2F0ZSB3aGV0aGVy
IGl0J3MgU2V0RmVhdHVyZSBvcg0KPiA+ID4gPiA+ID4gPiA+IENsZWFyRmVhdHVyZSByZXF1ZXN0
LiBlY21fZnVuY19zdXNwZW5kIGlzIHN1cHBvc2VkIHRvIGJlIGZvcg0KPiA+ID4gPiA+ID4gPiA+
IFNldEZlYXR1cmUoc3VzcGVuZCkgb25seS4gUGVyaGFwcyB3ZSBtYXkgaGF2ZSB0bw0KPiA+ID4g
PiA+ID4gPiA+IGRlZmluZSBmdW5jX3Jlc3VtZSgpDQo+ID4gPiA+ID4gPiA+ID4gZm9yIENsZWFy
RmVhdHVyZShzdXNwZW5kKT8NCj4gPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+IA0KPiA+ID4g
PiA+ID4gPiBIb3N0IHVzZXMgdGhlIHNhbWUgZmVhdHVyZSBzZWxlY3RvciBGVU5DVElPTl9TVVNQ
RU5EDQo+ID4gPiA+ID4gPiA+IGZvciBmdW5jdGlvbiBzdXNwZW5kDQo+ID4gPiA+ID4gPiA+IGFu
ZCBmdW5jdGlvbiByZXN1bWUgYW5kIGZ1bmNfc3VzcGVuZCgpIGNhbGxiYWNrIGNhbiBiZSB1c2Vk
IHRvDQo+ID4gPiA+ID4gPiA+IGhhbmRsZSBib3RoIHRoZSBjYXNlcyA/IFRoZSBkaXN0aW5jdGlv
biBjb21lcyB3aGV0aGVyIGl0IGlzIGENCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gSG93IGRv
IHlvdSBwbGFuIHRvIGhhbmRsZSB0aGF0PyBQYXNzIHRoaXMgaW5mbyBpbiBzb21lIHVudXNlZC9y
ZXNlcnZlZA0KPiA+ID4gPiA+ID4gYml0IG9mIHRoZSAib3B0aW9ucyIgYXJndW1lbnQ/IEludHJv
ZHVjZSBhIG5ldyBwYXJhbWV0ZXIgdG8gdGhlDQo+ID4gPiA+ID4gPiBmdW5jX3N1c3BlbmQoKT8N
Cj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gSWYgdGhhdCdzIHRoZSBjYXNlLCB0aGVuIHlvdSBu
ZWVkIHRvIHVwZGF0ZSB0aGUgZG9jdW1lbnQgb24NCj4gPiA+ID4gPiA+IGZ1bmNfc3VzcGVuZCgp
IHRvIGFsc28gc3VwcG9ydCBDbGVhckZlYXR1cmUoc3VzcGVuZCkuIFJpZ2h0IG5vdyBpdCdzDQo+
ID4gPiA+ID4gPiBkb2N1bWVudGVkIGZvciBTZXRGZWF0dXJlIG9ubHkuIEFsc28sIG1ha2Ugc3Vy
ZSB0aGF0IG90aGVyIGV4aXN0aW5nDQo+ID4gPiA+ID4gPiBmdW5jdGlvbiBkcml2ZXJzIHdpbGwg
bm90IGJyZWFrIGJlY2F1c2Ugb2YgdGhlIGNoYW5nZSBvZiB0aGUNCj4gPiA+ID4gPiA+IGZ1bmNf
c3VzcGVuZCBiZWhhdmlvci4NCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiBTZXRGZWF0dXJl
KEZVTkNUSU9OX1NVU1BFTkQpIG9yDQo+ID4gPiA+ID4gPiA+IENsZWFyRmVhdHVyZShGVU5DVElP
Tl9TVVNQRU5EKSB3aGljaCBjYW4gYmUNCj4gPiA+ID4gPiA+ID4gZWFzaWx5IGRvbmUgaW4gdGhl
IGZ1bmNfc3VzcGVuZCBjYWxsYmFjayBpdHNlbGYuIFdlDQo+ID4gPiA+ID4gPiA+IGNhbiBhZGQg
YW5vdGhlciBjYWxsYmFjaw0KPiA+ID4gPiA+ID4gPiBmdW5jX3Jlc3VtZSBzcGVjaWZpYyB0bw0K
PiA+ID4gPiA+ID4gPiBDbGVhckZlYXR1cmUoRlVOQ1RJT05fU1VTUEVORCkgYnV0IHdvbnQgdGhh
dCBiZQ0KPiA+ID4gPiA+ID4gPiByZWR1bmRhbnQgYW5kIG1vcmUgY2FsbGJhY2sgaGFuZGxpbmcg
b24gZnVuY3Rpb24NCj4gPiA+ID4gPiA+ID4gZHJpdmVyL2NvbXBvc2l0ZSBzaWRlIGFzDQo+ID4g
PiA+ID4gPiA+IHdlbGw/IFBsZWFzZSBsZXQgbWUga25vdyB5b3VyIG9waW5pb24uDQo+ID4gPiA+
ID4gPiA+IA0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBXZSBhY3R1YWxseSBkaWRuJ3QgcHJv
cGVybHkgZGVmaW5lIGZ1bmNfc3VzcGVuZCBhbmQgaXRzDQo+ID4gPiA+ID4gPiBjb3VudGVyIHBh
cnQuIEl0DQo+ID4gPiA+ID4gPiBzZWVtcyBjbGVhbmVyIHRvIG1lIHRvIGludHJvZHVjZSBmdW5j
X3Jlc3VtZSBhcyBpdCBzZWVtcw0KPiA+ID4gPiA+ID4gbW9yZSBpbnR1aXRpdmUNCj4gPiA+ID4g
PiA+IGFuZCBlYXNpZXIgdG8gcmVhZC4gTGV0IG1lIGtub3cgaG93IHlvdSBwbGFuIHRvIHVzZSBm
dW5jX3N1c3BlbmQoKSBmb3INCj4gPiA+ID4gPiA+IGJvdGggY2FzZXMuDQo+ID4gPiA+ID4gPiAN
Cj4gPiA+ID4gPiANCj4gPiA+ID4gPiBIb3cgYWJvdXQgd2UgaGFuZGxlIGZ1bmN0aW9uIHN1c3Bl
bmQgcmVzdW1lIGluIGNvbXBvc2l0ZSBhbHNvPyBJIG1lYW4NCj4gPiA+ID4gPiBzb21ldGhpbmcg
bGlrZSB0aGlzOg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Vz
Yi9nYWRnZXQvY29tcG9zaXRlLmMNCj4gPiA+ID4gPiBiL2RyaXZlcnMvdXNiL2dhZGdldC9jb21w
b3NpdGUuYw0KPiA+ID4gPiA+IGluZGV4IDM2YWRkMTg3OWVkMi4uNzlkYzA1NWViNWY3IDEwMDY0
NA0KPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvdXNiL2dhZGdldC9jb21wb3NpdGUuYw0KPiA+ID4g
PiA+ICsrKyBiL2RyaXZlcnMvdXNiL2dhZGdldC9jb21wb3NpdGUuYw0KPiA+ID4gPiA+IEBAIC0x
OTQ4LDkgKzE5NDgsMTggQEAgY29tcG9zaXRlX3NldHVwKHN0cnVjdCB1c2JfZ2FkZ2V0DQo+ID4g
PiA+ID4gKmdhZGdldCwgY29uc3Qgc3RydWN0IHVzYl9jdHJscmVxdWVzdCAqY3RybCkNCj4gPiA+
ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmID0gY2Rldi0+Y29uZmlnLT5pbnRlcmZhY2VbaW50
Zl07DQo+ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFmKQ0KPiA+ID4gPiA+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7DQo+ID4gPiA+ID4gLcKgwqDCoMKgwqDC
oMKgIHN0YXR1cyA9IGYtPmdldF9zdGF0dXMgPyBmLT5nZXRfc3RhdHVzKGYpIDogMDsNCj4gPiA+
ID4gPiAtwqDCoMKgwqDCoMKgwqAgaWYgKHN0YXR1cyA8IDApDQo+ID4gPiA+ID4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgYnJlYWs7DQo+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ICvCoMKgwqDCoMKg
wqDCoCBpZiAoZi0+Z2V0X3N0YXR1cykgew0KPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHN0YXR1cyA9IGYtPmdldF9zdGF0dXMoZik7DQo+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgaWYgKHN0YXR1cyA8IDApDQo+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBicmVhazsNCj4gPiA+ID4gPiArwqDCoMKgwqDCoMKgwqAgfSBlbHNlIHsNCj4g
PiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoZi0+Y29uZmlnLT5ibUF0dHJpYnV0
ZXMgJiBVU0JfQ09ORklHX0FUVF9XQUtFVVApIHsNCj4gPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHN0YXR1cyB8PSBVU0JfSU5UUkZfU1RBVF9GVU5DX1JXX0NBUDsNCj4g
PiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChmLT5mdW5jX3dha2V1
cF9hcm1lZCkNCj4gPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgc3RhdHVzIHw9IFVTQl9JTlRSRl9TVEFUX0ZVTkNfUlc7DQo+ID4gPiA+ID4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfQ0KPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoCB9DQo+ID4gPiA+ID4g
wqDCoMKgwqDCoMKgwqDCoMKgwqAgcHV0X3VuYWxpZ25lZF9sZTE2KHN0YXR1cyAmIDB4MDAwMGZm
ZmYsIHJlcS0+YnVmKTsNCj4gPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsNCj4g
PiA+ID4gPiDCoMKgwqDCoMKgwqAgLyoNCj4gPiA+ID4gPiBAQCAtMTk3MSw5ICsxOTgwLDI4IEBA
IGNvbXBvc2l0ZV9zZXR1cChzdHJ1Y3QgdXNiX2dhZGdldA0KPiA+ID4gPiA+ICpnYWRnZXQsIGNv
bnN0IHN0cnVjdCB1c2JfY3RybHJlcXVlc3QgKmN0cmwpDQo+ID4gPiA+ID4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBmID0gY2Rldi0+Y29uZmlnLT5pbnRlcmZhY2VbaW50Zl07DQo+ID4g
PiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoIWYpDQo+ID4gPiA+ID4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOw0KPiA+ID4gPiA+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGlmICh3X2luZGV4ICYgVVNCX0lOVFJGX0ZVTkNfU1VTUEVORF9S
Vykgew0KPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCEoZi0+
Y29uZmlnLT5ibUF0dHJpYnV0ZXMgJg0KPiA+ID4gPiA+IFVTQl9DT05GSUdfQVRUX1dBS0VVUCkp
DQo+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFr
Ow0KPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGYtPmZ1bmNfd2FrZXVwX2FybWVkID0gKGN0cmwtPmJSZXF1ZXN0ID09DQo+ID4gPiA+ID4gVVNC
X1JFUV9TRVRfRkVBVFVSRSk7DQo+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQ0K
PiA+ID4gPiA+ICsNCj4gPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHZhbHVl
ID0gMDsNCj4gPiA+ID4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoZi0+ZnVuY19zdXNw
ZW5kKQ0KPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChmLT5mdW5jX3N1c3Bl
bmQpIHsNCj4gPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdmFs
dWUgPSBmLT5mdW5jX3N1c3BlbmQoZiwgd19pbmRleCA+PiA4KTsNCj4gPiA+ID4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB9IGVsc2UgaWYgKHdfaW5kZXggJiBVU0JfSU5UUkZfRlVOQ19TVVNQ
RU5EX0xQKSB7DQo+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAo
Zi0+c3VzcGVuZCAmJiAmJiAhZi0+ZnVuY19zdXNwZW5kZWQgJiYNCj4gPiA+ID4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY3RybC0+YlJlcXVlc3QgPT0gVVNCX1JF
UV9TRVRfRkVBVFVSRSkpIHsNCj4gPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgZi0+c3VzcGVuZChmKTsNCj4gPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgZi0+ZnVuY19zdXNwZW5kZWQgPSB0cnVlOw0KPiA+ID4gPiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfSBlbHNlIGlmIChmLT5yZXN1bWUgJiYg
Zi0+ZnVuY19zdXNwZW5kZWQgJiYNCj4gPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgY3RybC0+YlJlcXVlc3QgPT0NCj4gPiA+ID4gPiBVU0JfUkVR
X0NMRUFSX0ZFQVRVUkVfRkVBVFVSRSkpIHsNCj4gDQo+IExpbnV4IGJhc2VkIGhvc3RzLCBkb250
IHVzZSBDbGVhckZlYXR1cmUoRlVOQ1RJT05fU1VTUEVORCkgZm9yIGZ1bmN0aW9uDQo+IHJlc3Vt
ZS4gVGhleSB1c2UgU2V0RmVhdHVyZShGVU5DVElPTl9TVVNQRU5EKSBpdHNlbGYgYnV0IHdpdGgg
Qml0KDApIGkuZQ0KPiBVU0JfSU5UUkZfRlVOQ19TVVNQRU5EX0xQIHJlc2V0LiBTbyB3ZSBtYXkg
bm90IGJlIGFibGUgdG8gZGlzdGluZ3Vpc2ggYmFzZWQNCj4gb24gU0VUX0ZFQVRVUkUgYW5kIENM
RUFSX0ZFQVRVUkUgcGFja2V0cyBmb3IgZnVuY3Rpb24gc3VzcGVuZCBhbmQgZnVuY3Rpb24NCj4g
cmVzdW1lLiBJbnN0ZWFkIHdlIGNhbiBnZW5lcmFsaXplICh3X2luZGV4ICYgVVNCX0lOVFJGX0ZV
TkNfU1VTUEVORF9MUCkgZm9yDQo+IGZ1bmN0aW9uIHN1c3BlbmQgYW5kIGFsbCBvdGhlciBjYXNl
cyBmb3IgZnVuY3Rpb24gcmVzdW1lLg0KPiANCj4gaWYgKGYtPmZ1bmNfc3VzcGVuZCkgew0KPiAJ
CXZhbHVlID0gZi0+ZnVuY19zdXNwZW5kKGYsIHdfaW5kZXggPj4gOCk7DQo+IH0gZWxzZSBpZiAo
d19pbmRleCAmIFVTQl9JTlRSRl9GVU5DX1NVU1BFTkRfTFApIHsNCj4gCQlpZiAoZi0+c3VzcGVu
ZCAmJiAhZi0+ZnVuY19zdXNwZW5kZWQpIHsNCj4gCQkJCWYtPnN1c3BlbmQoZik7DQo+IAkJCQlm
LT5mdW5jX3N1c3BlbmRlZCA9IHRydWU7DQo+IAkJfQ0KPiB9IGVsc2Ugew0KPiAJCWlmIChmLT5y
ZXN1bWUgJiYgZi0+ZnVuY19zdXNwZW5kZWQpIHsNCj4gCQkJCWYtPnJlc3VtZShmKTsNCj4gCQkJ
CWYtPmZ1bmNfc3VzcGVuZGVkID0gZmFsc2U7DQo+IAkJfQ0KPiB9DQo+IA0KPiANCg0KQWguLiBy
aWdodC4gVGhhdCdzIHBvc3NpYmxlIGFsc28uIFRoZW4gY2FuIHdlIGNoZWNrIGZvciBib3RoIGNh
c2VzPw0KU29tZXRoaW5nIGxpa2UgdGhpczoNCg0KQCAtMTk5NCw4ICsyMDAzLDM0IEBAIGNvbXBv
c2l0ZV9zZXR1cChzdHJ1Y3QgdXNiX2dhZGdldCAqZ2FkZ2V0LCBjb25zdCBzdHJ1Y3QgdXNiX2N0
cmxyZXF1ZXN0ICpjdHJsKQ0KICAgICAgICAgICAgICAgICAgICAgICAgaWYgKCFmKQ0KICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBicmVhazsNCiAgICAgICAgICAgICAgICAgICAgICAg
IHZhbHVlID0gMDsNCi0gICAgICAgICAgICAgICAgICAgICAgIGlmIChmLT5mdW5jX3N1c3BlbmQp
DQorICAgICAgICAgICAgICAgICAgICAgICBpZiAoZi0+ZnVuY19zdXNwZW5kKSB7DQogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHZhbHVlID0gZi0+ZnVuY19zdXNwZW5kKGYsIHdfaW5k
ZXggPj4gOCk7DQorICAgICAgICAgICAgICAgICAgICAgICB9IGVsc2UgaWYgKGN0cmwtPmJSZXF1
ZXN0ID09IFVTQl9SRVFfU0VUX0ZFQVRVUkUpIHsNCisgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgaWYgKCEoZi0+Y29uZmlnLT5ibUF0dHJpYnV0ZXMgJiBVU0JfQ09ORklHX0FUVF9XQUtF
VVApICYmDQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAod19pbmRleCAmIFVT
Ql9JTlRSRl9GVU5DX1NVU1BFTkRfUlcpKQ0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgYnJlYWs7DQorDQorICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGYtPmZ1bmNfd2FrZXVwX2FybWVkID0gISEod19pbmRleCAmIFVTQl9JTlRSRl9GVU5DX1NV
U1BFTkRfUlcpOw0KKw0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpZiAoKHdfaW5k
ZXggJiBVU0JfSU5UUkZfRlVOQ19TVVNQRU5EX0xQKSAmJg0KKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgZi0+c3VzcGVuZCAmJiAhZi0+ZnVuY19zdXNwZW5kZWQpIHsNCisgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmLT5zdXNwZW5kKGYpOw0KKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGYtPmZ1bmNfc3VzcGVuZGVkID0gdHJ1
ZTsNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfSBlbHNlIGlmIChmLT5yZXN1bWUg
JiYgZi0+ZnVuY19zdXNwZW5kZWQpIHsNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBmLT5yZXN1bWUoZik7DQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgZi0+ZnVuY19zdXNwZW5kZWQgPSBmYWxzZTsNCisgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfQ0KKyAgICAgICAgICAgICAgICAgICAgICAgfSBlbHNlIGlmIChjdHJsLT5iUmVx
dWVzdCA9PSBVU0JfUkVRX0NMRUFSX0ZFQVRVUkVfRkVBVFVSRSkpIHsNCisgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgaWYgKHdfaW5kZXggJiBVU0JfSU5UUkZfRlVOQ19TVVNQRU5EX1JX
KQ0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGYtPmZ1bmNfd2FrZXVw
X2FybWVkID0gZmFsc2U7DQorDQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlmICgo
d19pbmRleCAmIFVTQl9JTlRSRl9GVU5DX1NVU1BFTkRfTFApICYmDQorICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBmLT5yZXN1bWUgJiYgZi0+ZnVuY19zdXNwZW5kZWQpIHsNCisg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmLT5yZXN1bWUoZik7DQorICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZi0+ZnVuY19zdXNwZW5kZWQgPSBm
YWxzZTsNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfQ0KKyAgICAgICAgICAgICAg
ICAgICAgICAgfQ0KKw0KICAgICAgICAgICAgICAgICAgICAgICAgaWYgKHZhbHVlIDwgMCkgew0K
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBFUlJPUihjZGV2LA0KICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAiZnVuY19zdXNwZW5kKCkgcmV0dXJuZWQgZXJyb3Ig
JWRcbiIsDQoNCg0KVGhhbmtzLA0KVGhpbmg=
