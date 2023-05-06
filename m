Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74F5B6F8D28
	for <lists+linux-usb@lfdr.de>; Sat,  6 May 2023 02:32:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229925AbjEFAcS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 May 2023 20:32:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229792AbjEFAcQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 May 2023 20:32:16 -0400
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3888B5FF2
        for <linux-usb@vger.kernel.org>; Fri,  5 May 2023 17:32:15 -0700 (PDT)
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 345NRTkl015868;
        Fri, 5 May 2023 17:32:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=u1Uak3m97QkVisPvXIMAMuvqchbH9V6xlG7NH9aj+BY=;
 b=iei+I2CnfGrribm5uhMxMohLxcYlBC8X/Cd5KmebxgDwGwUbb3uECzFgKQXOnrNHI1he
 RhGXu39ePNadJC14qwdAoey0I1swHmPLUlAG9n7t2PtdXscxLFiwLNaYS5f8i1eehccf
 93FKkzP2wksgW+zxqGHKF4ydhucg3PwxO72puXnRxaFZZpvaUxYhO+sU1mUafU0YM1FL
 b1Crwr+iUPSBwhR3fhuGKSgHq3RtGPcCvuwiDddDktmLiMgF0zTk3rEPfVxc+thdD2LJ
 2g5JmPLwDYX6fa5fF5mGbAYHRnsNkkef7FFVGAndBvUh8UiJ6PYG9gkXMW7ihRD7qIBF qA== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3q925xsdbb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 05 May 2023 17:32:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1683333131; bh=u1Uak3m97QkVisPvXIMAMuvqchbH9V6xlG7NH9aj+BY=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=lMD33nzZl8zq/89qqrfL2pUlAh2wwpDykvn/4HjIpqV1vxA6sIlWzGdnqr9Cu1KQY
         jpXqRAdwAkd5iIaBoKh50agnmmDDuTDRffGd2fzlSF+jH+VlzsSf+dd1MwL8NV9EKz
         c3NKqcWXPaUIEuETOtULvyLGoK/cTIDdYZJyTKjPeCQQtlET38MNLPb6Z//laTThVZ
         FCf88yH8+jVQ2s/611BjmaLqa7cM2fzLSg6wvrf8xk+uy6bJ1K24wTBPeq1TdVQ3mi
         xYABN5fHAp7cO8t+0y4GBsuPBua2X/KyFfvwo5Tb9HLQ6q6Ylj0Npv6pJhKg/i6OqP
         pJ56vhdSp91mg==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 21FBA4048F;
        Sat,  6 May 2023 00:32:10 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id AC52AA0062;
        Sat,  6 May 2023 00:32:10 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=aPwrfBCM;
        dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id C95EC40407;
        Sat,  6 May 2023 00:32:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EedyEjqLMxk2/QYv1XydcpZy1seXpnXJAqdaq4sWkQYZp6BpR/Kk4uqh/DSYNobeOHG4sCDhgzWluwYISJaOpX0tPN1xZ3tTwfowiWDdCbgEeOjDRaPPM4VwHKWRo5pkoOe64hewjpD4tr0ZSwTkgemjxpU3B3NTS8WLBDgcWqrgrUAm8Q35U2/ysnEO18H1+xTXOhXXpz7pvLrpaiaU2MXo0EA7Jep/7dmz1KR0Urn7LygKa9a+xQO+MJ2Pe6nLPs4+yYtQpc+WTL9tWX5p8YxVDn9MOM2wIHlduMjNFjxBqW9M29wEL+WeW1W/N/1uCL+LOO4H0hhuMmYNvjc0mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u1Uak3m97QkVisPvXIMAMuvqchbH9V6xlG7NH9aj+BY=;
 b=FA46egFL/zyWQnJH1ekDPXFg6N7Gzj/6oyuBP0pEIbrVV6OokYT+1JURKjL3bCxeYkzs645fVrnLkh/zhiIB9aXJajpPSArXqqSV0a6jUVmMwYrQjHuSj2HnOXBNFqua35LiZx8wBz6Lnn+J93U+isB37HMVw7L0Xe6SGm1YXonYEI1/66TSPx+rg7dQK+O6fnrNhf6INmVYyT5lVlKF/9dS9GLYgRh74uVxnFyV7jjBNlnznqNRLEkM/mLKoVfY3Z1K14abvUun1exbkvEwklxJgcbH4WM0noASI8gEwAPwK3voTAz6B1sIuRIMrW2ZE+wA68MtGk1ain/mwkbuOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u1Uak3m97QkVisPvXIMAMuvqchbH9V6xlG7NH9aj+BY=;
 b=aPwrfBCMqFq9j8JRO50ZDtQ+N4g5UvOMcrd2eIf8NK26U90cmw+lt/3DggR2JITkAQjZF9HGRx2c2eFwyXKdmLx4WKxpfMdCT+4oRmboR+wKuK7BpUIgz9xpoKmgSFsiv3oZqQkI5ZeBC+4zoO/UN7Kw1eEDYJvwed/RxK0U8bU=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by DM6PR12MB4893.namprd12.prod.outlook.com (2603:10b6:5:1bd::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.27; Sat, 6 May
 2023 00:32:06 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::bb79:9aea:e237:688c]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::bb79:9aea:e237:688c%7]) with mapi id 15.20.6363.026; Sat, 6 May 2023
 00:32:06 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v6] usb: dwc3: fix gadget mode suspend interrupt handler
 issue
Thread-Topic: [PATCH v6] usb: dwc3: fix gadget mode suspend interrupt handler
 issue
Thread-Index: AQHZfvPS7HdhOwEuuEGw/l7NE0fH5q9MZmKA
Date:   Sat, 6 May 2023 00:32:06 +0000
Message-ID: <20230506003149.obpauq727sgmiobe@synopsys.com>
References: <20230505014902.27313-1-quic_linyyuan@quicinc.com>
In-Reply-To: <20230505014902.27313-1-quic_linyyuan@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|DM6PR12MB4893:EE_
x-ms-office365-filtering-correlation-id: aa5f9c0b-fbb5-4349-6274-08db4dc951eb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MacbD7EQS7S0mWdFlt0SswPuszsnV6cVFGPARCXF51vTM3+J+cI79WpIeVGVGrsXlEwZjz4YxD2FUGDRl9GLNE0HacrWleWvXVz0scQj+niqKgrd6MX5gSi2OjiMXl+XLv6snXGfLI2+4zhrTUx7PtULFTElwrfSn0cwfUQ3zmidIm39hzv+m7wMvlGWTnjXdNRF3pTKCm+eYdqvanvWc9no+QC6wZngI/Im4Cq55OW7cKYZ5uTt7benHqAwsFZzughAn+Xa3oxELWm0e+h5ZO2qYKhnf7plfLgUlyp/NTtJQEXlIIIDzzDiRD23cXdiJvRodMvbp1zOpcF5lZIq8CkCltwzo73BOypgCp1r4M7ew7PYHydSt3Jx64o729XpBi8KEtXJopDCBt/bEtXzYbuLRBE7eDrZFmximXkwmmuXFTt/TdLC32ZQV+Sd2y+22MdkKddTAhPimshA3GUBrzKseAlxHXxLmtmTP+933rfnozvM/WgNfNnb6DETU+Ji05dBAIJll0HE7r7odm1NfJpc1vcA/dXsUInZm202mWZsEKKPLAMxD7YE0HBmiW7cDdpTVNyfdfiOGLkz3NgH0LheyF1jdNTh/20mtXWi/UWNfYLP1DOrV7E+yadrW+KNZOq4pZFT5NCcF0Qk6fsxPQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(346002)(396003)(376002)(39860400002)(451199021)(15650500001)(83380400001)(2906002)(6506007)(6512007)(2616005)(186003)(41300700001)(26005)(1076003)(4326008)(64756008)(66446008)(76116006)(66476007)(66946007)(66556008)(316002)(6916009)(54906003)(71200400001)(5660300002)(478600001)(966005)(6486002)(8936002)(8676002)(38070700005)(38100700002)(122000001)(86362001)(36756003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U1FCMW80VUwxSjJyVGRhNlcyZm9kVWRTRmlvL0wweEtZSmlFdnc3cUVVbDQw?=
 =?utf-8?B?c1U4Lys1a1VXVSs3Q2dlb3VGK0ExM3E3eVpnalBPUG9UMWU5WmRaVlEwZm5h?=
 =?utf-8?B?VnZKQzJkWWhlTU43MmxCb0dTc2tmYzh0bGk0dTh4b2gweXZCaGo4M2xTOXBG?=
 =?utf-8?B?b1JqUWZ5RTFxbVI4ZGxrWm50a1JrZFpIeDNvRVBWODRmbFV6N25WSFBaVGhj?=
 =?utf-8?B?MFR6YitCWUFmM2hiUDRTTkNHeXFZblZEUEoyLzd2ZUxUMUpuWG1VK2RQZkoz?=
 =?utf-8?B?dmdtTGxVMC82OVNoblVyam1PSFlWL25WT3U5akpEemtKQ21mQ2RpOVpXejlV?=
 =?utf-8?B?SitpYXRCZEtmNDFQSE9BcmJ5T1ZHaWd4eVpTdE1IK0NBc0RVV0FHN21UZkJY?=
 =?utf-8?B?eEZ3SS9INEF4cW10Vk9yNitrMHBKWHBKdjY5elJuNTluS28vRUlrRmlWSnhq?=
 =?utf-8?B?TWF3RWlBdytuZW5Za3dCcGIxaWZpZElMcUt5SUt2VHpqcTNZRmtQcjcyMzlP?=
 =?utf-8?B?R1lkTUdPc25EbUpKdWkvRlFIVDkxeHBMVW9kUUl4YWZubWI1Z1lEc2Z4U1Rn?=
 =?utf-8?B?b1ZkdHZhamFRRmwvcEVGQXZYaUtrZHRyQUxndWFZZU9KUUIwQnV1WlFiSHdU?=
 =?utf-8?B?RkRDc0M1eExMeHZJcHNaZS8wc0d1NDFmTlUvc29rYWFDTEgwdFlXWUtlTWNh?=
 =?utf-8?B?OWE2OFpOa2xiWnhkek14NFF4UUxKSG83Nk1DTm1kanlET3NIWTM4WlFRWENT?=
 =?utf-8?B?Y1YyWTdHdEZYN0FKbUNwY3VmNldWVjQyUWVkVmpPUzdVbVlJVzRSQnNMeUd4?=
 =?utf-8?B?MUtHbnFjc3JPK1d1WUVzUEd5R2JKcGUzUTFiQzFMd0pINUg1NTEzbjVNRW4x?=
 =?utf-8?B?UlJieDlETnpUNVZlWUtsNGhucmloUFhZalFob2dDR2hZZHA0NzArendHYzEx?=
 =?utf-8?B?Wk5Mc09YZWJuRWo0eGwySnB0S3dQWGh3ZGpPY0l6YWtJekQ5OGI4dFZHeTN1?=
 =?utf-8?B?amR5N21iRnJXMVYzMTQ0MWxxTm5wWFlEUXRveWNlY0xnL0ptLzdtOTNiQVBm?=
 =?utf-8?B?RGIrSlJrVnRiNUpUblRFZEN1WVhCcHZzRldPVzNBT2grMHB5c2F2NU5uekF3?=
 =?utf-8?B?MkFCekxVSDhURmhPeXYwWmUxM1Z6WWhXWU0xNDNMUS9ZcFQ5VU5yQkxIamhi?=
 =?utf-8?B?Z29xcUhjSnlaeVFxaFhOdkEyWW5vVkI2cmNzZVJQVXQrS3V4K2d6bWVFM2dx?=
 =?utf-8?B?ZzFJaVJJU09teXd1STlqVTRXSlpQcEZoRlk0amtCczBFOTE0TTAxSzNwRkg1?=
 =?utf-8?B?UlgyYmZHSTZBU2RDMDhpRXdYbmVlZEFRWFNROHMrWENaTVRqSnRBTVRrWm1w?=
 =?utf-8?B?UkdiNVJzK0xOcHFZdkJsQ1cvdSs5cEFIRmcyTStwWHF6LzIvU0VReFhHNlNP?=
 =?utf-8?B?T3JVTm90ci9mL0M5OU5HbE1MbHM5VnBOV0NMTUNmVlpGVm55UVVWRXM3aWk2?=
 =?utf-8?B?SStTY0VsMDhoQklKQVM4aHVkY0RzcEREOWtqcnVLcEgzYWQ3czNaRThJdTh0?=
 =?utf-8?B?QnA5NGd5eXIyd1hkYzRrQW5Bb1VSM3VkekdxSmhZcW5RYnl3amxiYW92Znhs?=
 =?utf-8?B?NjZEVkl6NWJMeHpyczBMckI2R3hxQTU1ZVU3R3ZOQVdrTTdadVB2Ky9hSmEy?=
 =?utf-8?B?eHRwb0JXaXhBbkk3NUhGTUtPVDFXUmhwQlF2UjNaTnV5SDFidEZiUzI1N2ov?=
 =?utf-8?B?cjR1eDJvWENsUTcrNFRENmhXYmhIOWg4eHI4WjBRSFg2dksycFMrYVlzd2xU?=
 =?utf-8?B?MGQ1NTZ3RnJwV0JDMTNqTWg1SGdzdDZGTFRPd1BRdXlOVWZYbi9ocVlqd0FF?=
 =?utf-8?B?UmRuT0Nsb3o1bmpDNTFPQ1JYOCthWXBHd2t2TE8zQVBwc3E0Vnc4TXJWeHNo?=
 =?utf-8?B?SVg0U3dSQ3Byd05BSHluOWlQMHQxUUhMWXdpWTIyRU1hNEdSZmQ3ZWJhSStQ?=
 =?utf-8?B?dkY3dzAxUVpCMlJZdHNZUUZ6RUpBSE9YME1naUp5WTBwSHlLV0ZrY2Z0Z2JP?=
 =?utf-8?B?eGk5ZkoyL1ZucHIrTzY0eENyclUzM2pTcjhGazM0aFBzT1RjeWFwbVh1Tm85?=
 =?utf-8?Q?w0hXDTXIlaqL4n9xP7WhtEUax?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EE97C7B776C71141B174DDC272D0941B@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 7d65jrvVVXv4LbstHRB9iQ1fzEm17oKgzrorQzfYlg+W+TaPux3UxGy7HlrWZpiMLdOZqBbnlhcosnJByJNgHVMAOrJxTxPwQheIWB2bYWWh+UrTS8e+2tgUjO9P+W8ptBNB7qlJQwubLdwDfHXJVBUEUrbXKw9mLVermPdusbh2YaseEo6qk9SwDo8K9cBVWrMW8d/Mx61BE7/C+HzND11T2BQKs028oO5whvfuINNJ7CNTxDWzkZ307zUSwiilbn450T2V6iKNZchxSUKWql+lwrTy0dkyTHBLq0RllZBzKj+qWDm2cfUT3FZF78toWa5qfwERoKIOB1JIjqmDoDUyCxWsygdb1bhPfbAaGN7mh3eqoXh3fT8Uqkv5lfajZHhVYa+fFWEyNI+i1TEpPmvD5NqAYfvf4pBhBaNm9HZGXlfCqLRDcea+V3wveLC5XBJrL4Eet6V2FxBq8UqONlI1lH+qV4V8Z2zb8zzlTbcn3ODuh2ZCTyFUXN6woBykoZCWlA+wiqg/Hq+qD3JyCcLZFBgYvpMH7a1749E7bTfZcA5lEgFttCgj6Ktsy+OE0CGV5gY34AABsgWpVGXEyxspcVQboQS7ehpBAK6HDeTl6OkVJigzZlJv0OrFbALrGefJn2Fmk59npJFJH4FvVWvNV97APujUN4xq2tDCRWSQJFK8wrR0Yes0iRcEwyt1IvuoK01k6C8FX+3uBYoidLVoYyLU2KXAW9AFif61yjHwoKFUQjIrQA6lwkfyu6KljP6pN5QGfmVxB/lPvbeetkh5ptzCqmJqmqWES9YDIZujrVmEt6/54nnDjifljh9u+vW15JKJnDpB47uMwSpniD3nH0+kLEM8t2MGyWkBfMKtdxUwm3YOjB5KkDtbMp2MzD084cCC6FdsXUhVtBcXIw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa5f9c0b-fbb5-4349-6274-08db4dc951eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2023 00:32:06.1014
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W3KJrwZtkLPa8fgFlGI2vkOBCFMEXPnOx8IkAI8ci3cDS3xWiYcqGrcMEvkPaWqTlyE5363sEdpjJ/9rUpNGzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4893
X-Proofpoint-GUID: Rb-97wI5AsiaQ4ToFGh6CqRKJWFbP6EZ
X-Proofpoint-ORIG-GUID: Rb-97wI5AsiaQ4ToFGh6CqRKJWFbP6EZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-05_29,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 impostorscore=0 priorityscore=1501 spamscore=0 clxscore=1015 mlxscore=0
 adultscore=0 mlxlogscore=999 lowpriorityscore=0 suspectscore=0
 phishscore=0 bulkscore=0 malwarescore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2305060002
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gRnJpLCBNYXkgMDUsIDIwMjMsIExpbnl1IFl1YW4gd3JvdGU6DQo+IFdoZW4gd29yayBpbiBn
YWRnZXQgbW9kZSwgY3VycmVudGx5IGRyaXZlciBkb2Vzbid0IHVwZGF0ZSBzb2Z0d2FyZSBsZXZl
bA0KPiBsaW5rX3N0YXRlIGNvcnJlY3RseSBhcyBsaW5rIHN0YXRlIGNoYW5nZSBldmVudCBpcyBu
b3QgZW5hYmxlZCBmb3IgbW9zdA0KPiBkZXZpY2VzLCBpbiBmdW5jdGlvbiBkd2MzX2dhZGdldF9z
dXNwZW5kX2ludGVycnVwdCgpLCBpdCB3aWxsIG9ubHkgcGFzcw0KPiBzdXNwZW5kIGV2ZW50IHRv
IFVEQyBjb3JlIHdoZW4gc29mdHdhcmUgbGV2ZWwgbGluayBzdGF0ZSBjaGFuZ2VzLCBzbyB3aGVu
DQo+IGludGVycnVwdCBnZW5lcmF0ZWQgaW4gc2VxdWVuY2VzIG9mIHN1c3BlbmQgLT4gcmVzZXQg
LT4gY29ubmRvbmUgLT4NCj4gc3VzcGVuZCwgbGluayBzdGF0ZSBpcyBub3QgdXBkYXRlZCBkdXJp
bmcgcmVzZXQgYW5kIGNvbm5kb25lLCBzbyBzZWNvbmQNCj4gc3VzcGVuZCBpbnRlcnJ1cHQgZXZl
bnQgd2lsbCBub3QgcGFzcyB0byBVREMgY29yZS4NCj4gDQo+IFJlbW92ZSBsaW5rX3N0YXRlIGNv
bXBhcmUgaW4gZHdjM19nYWRnZXRfc3VzcGVuZF9pbnRlcnJ1cHQoKSBhbmQgYWRkIGENCj4gc3Vz
cGVuZGVkIGZsYWcgdG8gcmVwbGFjZSB0aGUgY29tcGFyZSBmdW5jdGlvbi4NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IExpbnl1IFl1YW4gPHF1aWNfbGlueXl1YW5AcXVpY2luYy5jb20+DQo+IC0tLQ0K
PiB2NjogKHJlZmVyIHY1IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2xvcmUu
a2VybmVsLm9yZy9saW51eC11c2IvMTY4MjQ3Njc4MC0yMzY3LTEtZ2l0LXNlbmQtZW1haWwtcXVp
Y19saW55eXVhbkBxdWljaW5jLmNvbS9fXzshIUE0RjJSOUdfcGchZElRMlZIY2NtWlRYcDEtNTlo
VEZmRWhjNjVXMGdhdGYxbjJ3bUJmczVZYjBpcGpIa3NEX0VTUVNtZ1hreTFvMXNjNHdFWjVxcDlK
S1Y3SUttazVLbTRiSnppMnBHZyQgKQ0KPiAxKSBjaGFuZ2Ugc3ViamVjdA0KPiAyKSBvbmx5IGtl
ZXAgc3VzcGVuZGVkIGZsYWcgcmVsYXRlZCBjaGFuZ2UNCj4gDQo+IHY1OiAocmVmZXIgdjQgaHR0
cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXVz
Yi8xNjgyMzkzMjU2LTE1NTcyLTEtZ2l0LXNlbmQtZW1haWwtcXVpY19saW55eXVhbkBxdWljaW5j
LmNvbS9fXzshIUE0RjJSOUdfcGchZElRMlZIY2NtWlRYcDEtNTloVEZmRWhjNjVXMGdhdGYxbjJ3
bUJmczVZYjBpcGpIa3NEX0VTUVNtZ1hreTFvMXNjNHdFWjVxcDlKS1Y3SUttazVLbTRaWG1zS1N2
USQgKQ0KPiAxKSByZW5hbWUgc3VzcGVuZF9pcnFfaGFwcGVuIHRvIHN1c3BlbmRlZCBhbmQgZG9j
dW1lbnQgaXQNCj4gMikgYWRkIG9sZF9saW5rX3N0YXRlIGZvciBsaW5rIGNoYW5nZSBpbnRlcnJ1
cHQgdXNhZ2UgYW5kIGNoYW5nZSBhY2NvcmRpbmdseQ0KPiANCj4gdjQ6IChyZWZlciB2MyBodHRw
czovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtdXNi
LzE2ODIwNTM4NjEtMjE3MzctMS1naXQtc2VuZC1lbWFpbC1xdWljX2xpbnl5dWFuQHF1aWNpbmMu
Y29tL19fOyEhQTRGMlI5R19wZyFkSVEyVkhjY21aVFhwMS01OWhURmZFaGM2NVcwZ2F0ZjFuMndt
QmZzNVliMGlwakhrc0RfRVNRU21nWGt5MW8xc2M0d0VaNXFwOUpLVjdJS21rNUttNGFxV05VaC1R
JCApDQo+IDEpIHJlbW92ZSBsaW5rIHN0YXRlIGNoZWNraW5nIGluIGR3YzNfZ2FkZ2V0X3dha2V1
cF9pbnRlcnJ1cHQoKQ0KPiAyKSByZW1vdmUgdHdvIHN3aXRjaC9jYXNlIHRvIGlmIG9wZWFydGlv
bg0KPiANCj4gdjM6IChyZWZlciB2MiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtdXNiLzE2ODIwNDI0NzItMjEyMjItMS1naXQtc2VuZC1l
bWFpbC1xdWljX2xpbnl5dWFuQHF1aWNpbmMuY29tL19fOyEhQTRGMlI5R19wZyFkSVEyVkhjY21a
VFhwMS01OWhURmZFaGM2NVcwZ2F0ZjFuMndtQmZzNVliMGlwakhrc0RfRVNRU21nWGt5MW8xc2M0
d0VaNXFwOUpLVjdJS21rNUttNGJSbW4wSE5BJCApDQo+IG5vIGNvZGUgY2hhbmdlIHNpbmNlIHYy
LCBjaGFuZ2VzIGNvbXBhcmUgdjEgYXMgYmVsb3csDQo+IDEpIGFkZCBhIGZsYWcgc3VzcGVuZF9p
cnFfaGFwcGVuIHRvIHNpbXBsaWZ5IGR3YzNfZ2FkZ2V0X3N1c3BlbmRfaW50ZXJydXB0KCksDQo+
ICAgIGl0IHdpbGwgYXZvaWQgcmVmZXIgdG8gc29mdHdhcmUgbGV2ZWwgbGlua19zdGF0ZSwgZmlu
YWxseSBsaW5rX3N0YXRlIHdpbGwNCj4gICAgb25seSB1c2VkIGluIGR3YzNfZ2FkZ2V0X2xpbmtz
dHNfY2hhbmdlX2ludGVycnVwdCgpLg0KPiAyKSByZW1vdmUgc3cgc2V0dGluZyBvZiBsaW5rX3N0
YXRlIGluIGR3YzNfZ2FkZ2V0X2Z1bmNfd2FrZXVwKCkNCj4gMykgYWRkIGR3YzNfZ2FkZ2V0X2lu
dGVycnVwdF9lYXJseSgpIHRvIGNvcnJlY3Qgc2V0dGluZyBvZiBsaW5rX3N0YXRlDQo+ICAgIGFu
ZCBzdXNwZW5kX2lycV9oYXBwZW4uDQo+IA0KPiB2MjogdXBkYXRlIGFjY29yZGluZyB2MSBkaXNj
dXNzaW9uDQo+IHYxOiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGludXgtdXNiLzE2NzUyMjEyODYtMjM4MzMtMS1naXQtc2VuZC1lbWFpbC1xdWlj
X2xpbnl5dWFuQHF1aWNpbmMuY29tL19fOyEhQTRGMlI5R19wZyFkSVEyVkhjY21aVFhwMS01OWhU
RmZFaGM2NVcwZ2F0ZjFuMndtQmZzNVliMGlwakhrc0RfRVNRU21nWGt5MW8xc2M0d0VaNXFwOUpL
VjdJS21rNUttNFpCbl9UUEV3JCANCj4gDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2NvcmUuaCAgIHwg
MiArKw0KPiAgZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYyB8IDcgKysrKysrLQ0KPiAgMiBmaWxl
cyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuaCBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5oDQo+
IGluZGV4IGQ1NjQ1N2MwMjk5Ni4uZWZhY2FhY2JiZWIyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L3VzYi9kd2MzL2NvcmUuaA0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuaA0KPiBAQCAt
MTExNiw2ICsxMTE2LDcgQEAgc3RydWN0IGR3YzNfc2NyYXRjaHBhZF9hcnJheSB7DQo+ICAgKiBA
ZGlzX21ldGFzdGFiaWxpdHlfcXVpcms6IHNldCB0byBkaXNhYmxlIG1ldGFzdGFiaWxpdHkgcXVp
cmsuDQo+ICAgKiBAZGlzX3NwbGl0X3F1aXJrOiBzZXQgdG8gZGlzYWJsZSBzcGxpdCBib3VuZGFy
eS4NCj4gICAqIEB3YWtldXBfY29uZmlndXJlZDogc2V0IGlmIHRoZSBkZXZpY2UgaXMgY29uZmln
dXJlZCBmb3IgcmVtb3RlIHdha2V1cC4NCj4gKyAqIEBzdXNwZW5kZWQ6IHNldCBpZiBzdXNwZW5k
IGlycSBoYXBwZW4gdG8gYXZvaWQgcG9zc2libGUgY29uc2VjdGl2ZSBzdXNwZW5kLg0KDQpDYW4g
d2UgcmVwaHJhc2UgdG86ICJzZXQgdG8gdHJhY2sgc3VzcGVuZCBldmVudCBkdWUgdG8gVTMvTDIi
DQoNCj4gICAqIEBpbW9kX2ludGVydmFsOiBzZXQgdGhlIGludGVycnVwdCBtb2RlcmF0aW9uIGlu
dGVydmFsIGluIDI1MG5zDQo+ICAgKgkJCWluY3JlbWVudHMgb3IgMCB0byBkaXNhYmxlLg0KPiAg
ICogQG1heF9jZmdfZXBzOiBjdXJyZW50IG1heCBudW1iZXIgb2YgSU4gZXBzIHVzZWQgYWNyb3Nz
IGFsbCBVU0IgY29uZmlncy4NCj4gQEAgLTEzMzIsNiArMTMzMyw3IEBAIHN0cnVjdCBkd2MzIHsN
Cj4gIAl1bnNpZ25lZAkJZGlzX3NwbGl0X3F1aXJrOjE7DQo+ICAJdW5zaWduZWQJCWFzeW5jX2Nh
bGxiYWNrczoxOw0KPiAgCXVuc2lnbmVkCQl3YWtldXBfY29uZmlndXJlZDoxOw0KPiArCXVuc2ln
bmVkCQlzdXNwZW5kZWQ6MTsNCj4gIA0KPiAgCXUxNgkJCWltb2RfaW50ZXJ2YWw7DQo+ICANCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMgYi9kcml2ZXJzL3VzYi9kd2Mz
L2dhZGdldC5jDQo+IGluZGV4IGMwY2E0ZDEyZjk1ZC4uMmM3NTA1MzRiNDA1IDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMv
Z2FkZ2V0LmMNCj4gQEAgLTQzMDMsOCArNDMwMywxMCBAQCBzdGF0aWMgdm9pZCBkd2MzX2dhZGdl
dF9zdXNwZW5kX2ludGVycnVwdChzdHJ1Y3QgZHdjMyAqZHdjLA0KPiAgew0KPiAgCWVudW0gZHdj
M19saW5rX3N0YXRlIG5leHQgPSBldnRpbmZvICYgRFdDM19MSU5LX1NUQVRFX01BU0s7DQo+ICAN
Cj4gLQlpZiAoZHdjLT5saW5rX3N0YXRlICE9IG5leHQgJiYgbmV4dCA9PSBEV0MzX0xJTktfU1RB
VEVfVTMpDQo+ICsJaWYgKCFkd2MtPnN1c3BlbmRlZCAmJiBuZXh0ID09IERXQzNfTElOS19TVEFU
RV9VMykgew0KPiArCQlkd2MtPnN1c3BlbmRlZCA9IHRydWU7DQo+ICAJCWR3YzNfc3VzcGVuZF9n
YWRnZXQoZHdjKTsNCj4gKwl9DQo+ICANCj4gIAlkd2MtPmxpbmtfc3RhdGUgPSBuZXh0Ow0KPiAg
fQ0KPiBAQCAtNDMxMiw2ICs0MzE0LDkgQEAgc3RhdGljIHZvaWQgZHdjM19nYWRnZXRfc3VzcGVu
ZF9pbnRlcnJ1cHQoc3RydWN0IGR3YzMgKmR3YywNCj4gIHN0YXRpYyB2b2lkIGR3YzNfZ2FkZ2V0
X2ludGVycnVwdChzdHJ1Y3QgZHdjMyAqZHdjLA0KPiAgCQljb25zdCBzdHJ1Y3QgZHdjM19ldmVu
dF9kZXZ0ICpldmVudCkNCj4gIHsNCj4gKwlpZiAgKGV2ZW50LT50eXBlICE9IERXQzNfREVWSUNF
X0VWRU5UX1NVU1BFTkQpDQoNCk1pbm9yIG5pdDogc3BhY2luZyBiZXR3ZWVuIGlmIGFuZCAoLg0K
DQpXaGlsZSB0aGlzIG1heSB3b3JrIGJlY2F1c2UgdGhlIG5leHQgc3VzcGVuZCBldmVudCB3b24n
dCBjb21lIHVudGlsIGENCnJlc3VtZS9yZXNldC9kaXNjb25uZWN0IGV2ZW50IG9jY3VyLCBsZXQn
cyBjbGVhciB0aGlzIG9ubHkgb24gcmVzZXQsDQpyZXN1bWUsIGFuZCBkaXNjb25uZWN0IGV2ZW50
cy4NCg0KPiArCQlkd2MtPnN1c3BlbmRlZCA9IGZhbHNlOw0KPiArDQo+ICAJc3dpdGNoIChldmVu
dC0+dHlwZSkgew0KPiAgCWNhc2UgRFdDM19ERVZJQ0VfRVZFTlRfRElTQ09OTkVDVDoNCj4gIAkJ
ZHdjM19nYWRnZXRfZGlzY29ubmVjdF9pbnRlcnJ1cHQoZHdjKTsNCj4gLS0gDQo+IDIuMTcuMQ0K
PiANCg0KVGhhbmtzLA0KVGhpbmg=
