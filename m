Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3DE56D6F08
	for <lists+linux-usb@lfdr.de>; Tue,  4 Apr 2023 23:36:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236241AbjDDVgv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 Apr 2023 17:36:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235855AbjDDVgt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 4 Apr 2023 17:36:49 -0400
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99FE830FF
        for <linux-usb@vger.kernel.org>; Tue,  4 Apr 2023 14:36:48 -0700 (PDT)
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 334LZJR5026463;
        Tue, 4 Apr 2023 14:36:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=IpLO2FJm9lP8/3Hv5zFqTD77cdenSBfIOvG5l+GX2Rs=;
 b=WcXRARRoP2KPS2j5OFvy5a5L0n7GemNg3prSouEvFVZSdMoyNq5tjaA39IuFUgF1Wky8
 E5J0oYmILe3OLz53sTfHwFxbRe23UXFhpGOhQsZs4U5TKVi3o739zAod+1NRbGHd9eU1
 VMwcNXeIPwoPhWDc6EvdgfBpnxszKDM3F5RzH9OeE2UeXGVakS59L96Yps8sPWLAjStn
 zFleRS103Lo27HU/k7c8sfRW9MOOeUrgV5u+//0EEdMtD1aCaf8t/lBVFzxunPK6HU9x
 EfXB9S6B+nrmNOqG5i0C8Xr/CHcdvyOtlIibcf4J2xbXVpsULeKaEYW+84rNqm9ylhSr ZA== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3ppkmrftwr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 04 Apr 2023 14:36:35 -0700
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6ECD240137;
        Tue,  4 Apr 2023 21:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1680644195; bh=IpLO2FJm9lP8/3Hv5zFqTD77cdenSBfIOvG5l+GX2Rs=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=AKp8BPYT98/kBKFcjhpLGIXRp8pMKrtOMZ1vC2Sy8cSd1xzamxBq9zXTKSxGcVGnk
         b+X3Q3y+WhyR4qgNDB68PKV/GB6hdubevcGN3SGB1wilMT2HQS9g24RelJLw0ZAemx
         kGug0+STswU7mXbKLN+9iyfbuVNzL2+3pohyurUpHhWNIAlVlsqkbogRQLFT3i4Dk3
         eSni3NiMTPoB2ZtSePomreEC+VbI/6CcmPNg5N7D7BGUY1mP8D07qkJtfR3rtx5lT0
         RkcuDsSRZqsq97opEoD098+43LCmhTuItOF5OI+gFyw5vf1tNk5DYmix1+JZHthpci
         0zXcQDmsyYUHQ==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id B7689A0071;
        Tue,  4 Apr 2023 21:36:34 +0000 (UTC)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2168.outbound.protection.outlook.com [104.47.73.168])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 194224006A;
        Tue,  4 Apr 2023 21:36:33 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="SFtivUhk";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XEU2bR/gNwN4XsVqr3YRaoPHDcFiIeXjSnELb6Uh0B5/f07HIbBG3FHn1PDSZaO9/QpEWanZGAZkcBVLnwzAlZ4CVwZ8NkGyVWPjq2NXslnXFqxBpGfg4bTDROJ/wrTT0nTD3tJSOfrVCdSlTEIilvFDoglASAPPObK4+QMlyeo7kGUzJ5Q8v5KOwUttfiRkrgd7aoLJauHZKSIODIVLoIYtjGvHBt6L/LJivtbmSSbUwyh5DPjTNneeZetKF6q2dXrouYMvO4KVf3SsNW271876NxrE0hBVlcN55mjMHANEeHVXCx7PqIeG2mv0KeWSYyWTNq6OmgvaUvIsBGi+DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IpLO2FJm9lP8/3Hv5zFqTD77cdenSBfIOvG5l+GX2Rs=;
 b=IaLV+6Bx9amRNY4kgctyzRr2vyNWst5ks9t62MyEQRQxcNPyzmk7J5eNSWywV59lc/gjpx8LWymL6GdGfRji/Qd8cKb2h7PNR+NLCaPQKkj50bYUuBpfUC+HE801QBtKYiNb9hCFiIP3EPvYOM1v4VSYPOqlsSvNqf4Dr4uhXVhA+iblIcirlesobAtW9i4eh/Dz7ehuvPegOJnvBw4Ccqk+uPUuDWiRlxWeKIsoOPP0EqyBBWU2rEWxXR58wp1UNiJNBGjSjKGw0bigIK4FFeuPWf7WPs9SbGPrOOeV1KBY0RWKt5e8KOVbcgbV6GmVVx7f+DQo5J37RrxjCVSDfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IpLO2FJm9lP8/3Hv5zFqTD77cdenSBfIOvG5l+GX2Rs=;
 b=SFtivUhky716Lh5o/+NTQ2TuKsz9SJ3v1bCU0ZPFLJvJ/B2HvlCZq/9bdcksgQ4eifir+clR8H+WAz5JGlk9/HPOpynJ6fqxgJVY0pMEiIdNIuOaKZcUkVlt5lqp2vEXniVnysHlruiZ40p41QtwCch2Qja8lzi+tLM3M7zuYSM=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by DS7PR12MB6024.namprd12.prod.outlook.com (2603:10b6:8:84::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 21:36:28 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3161:c44d:8bb3:423f]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3161:c44d:8bb3:423f%3]) with mapi id 15.20.6254.033; Tue, 4 Apr 2023
 21:36:28 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Johan Hovold <johan@kernel.org>
CC:     Udipto Goswami <quic_ugoswami@quicinc.com>,
        Oliver Neukum <oneukum@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v4] usb: dwc3: debugfs: Prevent any register access when
 devices
Thread-Topic: [PATCH v4] usb: dwc3: debugfs: Prevent any register access when
 devices
Thread-Index: AQHZZtyBQSzEIU4DQUOpQRrLn0wgo68a/QEAgAABE4CAAAmMgIAACSWAgAApgoCAAHMDgA==
Date:   Tue, 4 Apr 2023 21:36:28 +0000
Message-ID: <20230404213625.zta3tdkqdrthufbl@synopsys.com>
References: <20230404100055.28100-1-quic_ugoswami@quicinc.com>
 <ZCwEeFzSFVRmB/yI@hovoldconsulting.com>
 <9f8277ce-7888-46b7-fe82-90fe4b775762@suse.com>
 <ZCwNYU3kR1Lb2kt5@hovoldconsulting.com>
 <8a209f5f-8aa1-35b1-20ed-2f0b95f960a7@quicinc.com>
 <ZCw33woJ3C6roK93@hovoldconsulting.com>
In-Reply-To: <ZCw33woJ3C6roK93@hovoldconsulting.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|DS7PR12MB6024:EE_
x-ms-office365-filtering-correlation-id: 65b83b02-6a27-40b1-ace8-08db3554a633
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PYTG7qN4PdokNRC2qyeoRFd5PVU4L61jekmBj2QL/O/YVmLClVfEZwCq63b5MKprqKoNVNe0iDe7pA5sf8OgGgpXeC8J8pag+NYqjFAK2QAWhvLIluu2HkHkNKuSv5LUwUmm6e0OQc170pmoq9h6pD1J97Aw55Jb1PFJc6FSygIU234c+Ymw7W72MjH2Cgq/0l8w2q2FXVUAjlqjGi9mbh/pJrtJWQUrCHb/2QdF9O/nfZwNa3lifQ6ksfV84cnTweZEiHL6kPihjMfJHTeGEERUIzzVd6jaeEC/4pcUPD2/Mo7lIoW/xQC2gJJuBV2ZLMDtVVj5BLDksZqC6yE3DSiB1xB8czhOVLmLj8I6DdnL03pWNVgaBGR+gD8hk992srspA4pcT8JyOTfxcUi0NNLASqIBzMnY3WLWEDZAX2y7rutU2Rtbjv0oJVOWkpgCh4PRj9z1W5GEPgn67Q0GS/g9Z6ipEarvU6lPKQPQAouGUl+jkbOZZ6I69TdNKYEI0F+ljQ7h68feVaU0XW7SYfZUTgUlRyUYhxv43JHiBMY+FahHv0jieuk3/Mgln+TzWlssdMHw5h3QAlQdXiYmnT2IbowjT0uQ9je2rmD2lrsqiBtBSXXvM+7SfJA7IHfD
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(346002)(376002)(39860400002)(396003)(451199021)(71200400001)(6486002)(4326008)(6916009)(66476007)(66556008)(66946007)(66446008)(64756008)(8676002)(76116006)(316002)(2906002)(38100700002)(36756003)(122000001)(38070700005)(86362001)(5660300002)(8936002)(478600001)(41300700001)(54906003)(6512007)(6506007)(1076003)(26005)(53546011)(186003)(83380400001)(2616005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZEVFR1Q0cmR6ejQ0bE4yeXI2cS96YVNuei9xcEZ2RkFUb2RSSkU3Vko0YlFJ?=
 =?utf-8?B?R0NMMm90RWdJUlhGYUlQMmNsZCtRRzhnRzZpU29BeHUwb1U1OC9hQUJ5STdX?=
 =?utf-8?B?SDNpWVBXdTVVc3ZuMExFNHFieUpyR1BpZG1TSk5UOFJ1dVU1RWRvbGZMT1ho?=
 =?utf-8?B?dXhVSy9ETjI5YVhodzhDbW5XZVFVaDdPV0VNRFlsd04xUThUMmxxRmVNVm4x?=
 =?utf-8?B?YXd3Q2RWOEFNUUNyUHBjamp0OCtZQlVUa2x1dWdvcHlDUnZBb25CL1VnNUxU?=
 =?utf-8?B?QkJuWVBmbjYremlWY2d3V0tPYUl6MUg2Z1VoUTVtdEovREdjbW42TW5nOXVL?=
 =?utf-8?B?akNyQk8wM2grck1Ec2lLUzlyaXhqMFpzT25DUGVRK3Evck5Hc3hhdlFTWXZm?=
 =?utf-8?B?TWt3a2xmbHVGTkRPWkhiNTRlNTRtVmlaOGNKNmNEVHJWNi9EQ3UwTElxMjJQ?=
 =?utf-8?B?RjEyVVUzNytYMmNSK0NERXlINXhwbzJPdWhmOXVLdzRaWDRyb2ZkNnFOY2hp?=
 =?utf-8?B?TG5EUzNqUHYyZ2FnVFRtQ1dDbGlnNGNsSGE4UmJXVWNzcExJWjdLbVVxQU9k?=
 =?utf-8?B?M3hZYWZlRUxXTWdUMGYyUGFMSEZORW5SdWxDQ0tKdTMzQVRkbWFFNWg5OWdZ?=
 =?utf-8?B?bXpFSzFielhHallLYXdVOVZjZFhhRm1PSTVYZnpSdmlrRmJnNkFrRXZKM25H?=
 =?utf-8?B?WDRkMzVTa3VqSWhEcmhram1RYUFrYTU5Y0U3aVhvTlNzL0RyOUtyUHlTNnNv?=
 =?utf-8?B?Q25hMnRhMGVWUlRGeVJVSUNyYXZmOCtGcjROY1BLM0xJVTA2WFEzWWhkcC8w?=
 =?utf-8?B?QzRFYk1yN3QvOTY2STNDQXkxaXhYc0xzOGIwMTMrOTBuMmE5N1F6TjlGRGNo?=
 =?utf-8?B?TXVSOTlGRDM1bHRRVThrMHhLenluaGRkUnhQRE9oeVQzdkFmdFhyeDFIMzNY?=
 =?utf-8?B?dXdFMXZZOERLN1NMeFZBeTMrUmVra3duYmdyMVI3cnNnc2djejlZOCtqcGhB?=
 =?utf-8?B?anlwbG9vTFZja08vU3p2Z0dQWWVHZDI0RmdJSnBsS1V5cmZrNFdZWDNTVDZp?=
 =?utf-8?B?LzVqYmVtektuTHFlSERmajhFaGIwbmhOb3hxWWxlMW5jdWJRZnQ5dVMvK1VY?=
 =?utf-8?B?ZVBqVEc0UUFTRnk2cFlId0VGaTNrTEJIcFVyKy9qS3V3ZEhva1RvOVFwemxF?=
 =?utf-8?B?enpzU3JNdCtNcUNCVjJyUkdrV0tJMHcyVjB5UENFZGNodmFiNnRtT2tMVkVH?=
 =?utf-8?B?V3oyOFFYb01CbHBBWVUrc2ZiL1BqcjAzRFBBdUtIdjdXby9tMlhXY3VFVlk1?=
 =?utf-8?B?bTN6VjVtNDBsMDJiOEhhQ3kyTkVVcElnbUlSRGNtMjdzZmdaMktGQTlvVXJp?=
 =?utf-8?B?Q21JUFhEcWRubysxRHJDYk1vbFJlUGZFQUVJcW84Syt1NDl4VEN6RUZyUEZz?=
 =?utf-8?B?cFdJRzdMQXBSVFVIMDRoOUhKaVhUZzN5VkEwWDlnenN3OWdEWDRGUDRCN1FE?=
 =?utf-8?B?WkNpQU50ZUpSSlRZTzhseUZrZktjc2tQZzFQZUxqS1EyZE1URlkzL2Q0Lytv?=
 =?utf-8?B?ajM2d3pYRjJSVktFSWVPRVVsQzBCcUV6a3BFdC9BcTI0bTlOeVBkNjBud2oz?=
 =?utf-8?B?UWZzVEFKV3J3SG9tSFYvVVpyZXpLRC9ZNStUU09xVlYyU2pMTVM2dEVzUHhh?=
 =?utf-8?B?dVpRQVRrUkwvU3pDOTJMdXhUWlBkcmxpMVdjdStuK0xwR3NsL0cxUDNGWktN?=
 =?utf-8?B?aytISko1SmxVZnVnSkJGZHczNVlLSUZvcnoyNERPajVvMmYwcEZBVXZRdXda?=
 =?utf-8?B?YU5CaW9wUlp2eTRkMHZEMWMySnlyYURaZnZCTXZ6MHpiNGFpaWMxQzA2NzRu?=
 =?utf-8?B?Ni8wdVBOdVpwa1N3RzdFaGtJc3IvcmQxeitWSWhhdlJtY0RranY3WTdGaWJY?=
 =?utf-8?B?M2R2QXBTTWZ5Y0g3SmZHazJXTjVQVGdyejVSN25wT2EvNlZzbXpwLzVMYko5?=
 =?utf-8?B?WlpYNk05UjUyR0ZBMENqcXBTNXlhNnloUUcwUFBDbjB6R1BaV0RkTEl4c1V6?=
 =?utf-8?B?WFE0M09BbFlEZW15L2tGbVlsL2o0ZVl3U1krZm5ibHdmS2hXamdZZDJ0Q1dT?=
 =?utf-8?B?RXhzUWtJaEYyQVF3bk1MRnBodlQxTHVsZWsveS9sZmUzc0tWb3dLMERxZE5O?=
 =?utf-8?B?ZEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F5098F7F821AC440921E46CF2EDFFE7F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?M0RPeHBFVXAxNVlYYTIvamtmWTBRWko1QzlVS1I0cEpmMTFqNmoxeS9YRGJH?=
 =?utf-8?B?UGxuWFUvdzNPcHFQaEllTXdhODlEU0pwZ2l6OE16UWZIV0xNZmhxbmJxSWRG?=
 =?utf-8?B?UVVsYVhPTlpnUVovUVJEeW5mVGJYemI5TDFCZ3I1WVMxY0kxbTdjRFZIZ3U0?=
 =?utf-8?B?OHNleW53cEM1cEVIcDAwa0NpSGhuNjh3bzU2TEJpamFhaDNNUFZNNlN0ZTRU?=
 =?utf-8?B?RSt5b1dudDJ1MzdsZ2htZzBRdWdBbVV1dHNoWE8xWGZsQ0NNZnErWmY4WjE0?=
 =?utf-8?B?QkFqYW05Smk2eFkwNnFxbVhyYnJ6WjkvMUpRdmFXVGhCc3ZTRzlHOFJZcWZl?=
 =?utf-8?B?amw1cEpLYTBZR1JobGQrZVNXbmw0R3lxeHNFZlJQMjQzSkNLTDJvKzJwYU1D?=
 =?utf-8?B?TktrOFBGZ3dVVWFXREcxN3Y0OHJ2ZGtMT2laSTZJZkhHZFJCOThFaElMQzE1?=
 =?utf-8?B?b3hOMklqRngvVGRKMXpJSW85UTBPWVQ3a2VqMGVxZ00veVl5TXZ3MEN5R1Zq?=
 =?utf-8?B?YjJJM2EzY2xDWmVpK2owRE8rekxaaTZ6OXUvdUJkWHJaVDNvWXJRdERtZXo5?=
 =?utf-8?B?YmcvSGhKSmUzelRNc1NjcDB0M1JRRFV2bmlMbnBFWkRnRkhPSnhxSkVTWHhU?=
 =?utf-8?B?NU9Cc25mQmwwQlprZnNWNVMyeEdyQktOcEJEQjFVekdQQjZqN3pMR2tlWjBR?=
 =?utf-8?B?NUxEMGhycXhHS1paaUppbW1lQ1VDUHZiQ2Y0d2dTcWZaUUdqM1lYM0hVYXBK?=
 =?utf-8?B?eDFsaXhOZVpJM09EdENuNlhFVVZWa3o1U1MzVzVqazI5MFVzblR5RDRqaVpl?=
 =?utf-8?B?ZVg4blY1YTdxdVpOV2o1TmFMNXc0STV5RDZ4VFdUdGxqSXRoeU13YkgvOTRH?=
 =?utf-8?B?UEtMU0VLYnp3d1JRVlFZYXQ0NEVxU1lza2RNdzJZMUFzRGFzUlZDVXE1dnlj?=
 =?utf-8?B?SlNucy9XV2ZLc1QrUzRvRzlRMjM3UmpCcDh1U1l2bTg1K2pVVDVDN3hqeXY3?=
 =?utf-8?B?dHFMdWwvQmI1RnlyN1gyRnJUZUF4OXFKWVFEQjY2WThLM0tFbFM4WUFEVUhh?=
 =?utf-8?B?OEVaN2JVZ3ZNMjZ3OHZoeGVHVmpsSExYcmxPT1hKZGdhaWNQRVRyUkNoS3Vy?=
 =?utf-8?B?VURLMGR2T1VJeXpyRXFBa2NweVd1Y2FOdlZEOW5JdDBpK2N6ai9teXhKSjJI?=
 =?utf-8?B?elR6eEVodjgvZ3ltZHlyb2pNSG1remRLcUlBcUpkbGN1Wm5zRzJ4R2swN09B?=
 =?utf-8?B?eVE2NlNTWWl1Zzl0dFNyWGwvU2VuQ3QyRisvVkNlM0huL1Vydz09?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65b83b02-6a27-40b1-ace8-08db3554a633
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2023 21:36:28.4469
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KcBh32yXAEW5UvZndEax0eQ6SdccIyvG7ZT1bLz+in4X5SrVIUtdsacJlxt4IBolIu7BAocNOwniw5XmKvimjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6024
X-Proofpoint-ORIG-GUID: 4INUAx96zG_IzLVuYeJ9Ah5jTGOsxyId
X-Proofpoint-GUID: 4INUAx96zG_IzLVuYeJ9Ah5jTGOsxyId
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-04_12,2023-04-04_05,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 malwarescore=0 clxscore=1011 bulkscore=0 priorityscore=1501 adultscore=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=692 impostorscore=0
 phishscore=0 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2304040197
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVHVlLCBBcHIgMDQsIDIwMjMsIEpvaGFuIEhvdm9sZCB3cm90ZToNCj4gT24gVHVlLCBBcHIg
MDQsIDIwMjMgYXQgMDU6NDY6MTNQTSArMDUzMCwgVWRpcHRvIEdvc3dhbWkgd3JvdGU6DQo+ID4g
T24gNC80LzIzIDU6MTMgUE0sIEpvaGFuIEhvdm9sZCB3cm90ZToNCj4gPiA+IE9uIFR1ZSwgQXBy
IDA0LCAyMDIzIGF0IDAxOjA5OjE5UE0gKzAyMDAsIE9saXZlciBOZXVrdW0gd3JvdGU6DQo+ID4g
Pj4gT24gMDQuMDQuMjMgMTM6MDUsIEpvaGFuIEhvdm9sZCB3cm90ZToNCj4gDQo+ID4gPj4+IFRo
aXMgaXMgYmFja3dhcmRzLiBJZiB5b3UgbmVlZCB0aGUgZGV2aWNlIHRvIGJlIGFjdGl2ZSB0byBh
Y2Nlc3MgdGhlc2UNCj4gPiA+Pj4gcmVnaXN0ZXJzIHRoZW4geW91IHNob3VsZCByZXN1bWUgaXQg
dW5jb25kaXRpb25hbGx5IGluc3RlYWQgb2YgZmFpbGluZy4NCj4gPiA+IA0KPiA+ID4+IHVzdWFs
bHkgeW91IHdvdWxkIGJlIHJpZ2h0LiBCdXQgdGhpcyBpcyBkZWJ1Z2ZzLiBJdCBpcyBpbnRlbmRl
ZCB0byBvYnNlcnZlDQo+ID4gPj4gdGhlIHN5c3RlbSBpbiB0aGUgc3RhdGUgaXQgaXMgYWN0dWFs
bHkgaW4uIElmIGJ5IHRoZSBhY3Qgb2Ygb2JzZXJ2YXRpb24geW91DQo+ID4gPj4gd2FrZSB1cCB0
aGUgZGV2aWNlLCB5b3UgY2hhbmdlIHRoZSBleHBlcmltZW50Lg0KPiA+ID4gDQo+ID4gPiBJIGFk
bWl0dGVkbHkgZGlkbid0IGxvb2sgdG8gY2xvc2VseSBhdCB3aGF0IHRoaXMgcGFydGljdWxhciBk
ZWJ1Z2ZzDQo+ID4gPiBpbnRlcmZhY2UgaXMgdXNlZCBmb3IsIGJ1dCBJIGdlbmVyYWxseSBkbyBu
b3QgYWdyZWUgd2l0aCB0aGF0IHJlYXNvbmluZy4NCj4gPiA+IA0KPiA+ID4gVGhlIGRldmljZSBp
cyBiZWluZyB1c2VkOyBieSB0aGUgZHJpdmVyIGFuZCB1bHRpbWF0ZWx5IGJ5IGEgdXNlciB0ZWxs
aW5nDQo+ID4gPiB0aGUgZHJpdmVyIHRvIGRvIHNvbWV0aGluZyBvbiB0aGVpciBiZWhhbGYuIFRo
ZSBmYWN0IHRoYXQgdGhlIHVzZXIgaXMNCj4gPiA+IGluaXRpYXRpbmcgYW4gYWN0aW9uIHRocm91
Z2ggYW4gaW50ZXJmYWNlIHdoaWNoIGludGVuZGVkIGZvciBkZWJ1Z2dpbmcNCj4gPiA+IHNob3Vs
ZCBub3QgbWF0dGVyIChhbmQgdGhlIHVzZXIgYWx3YXlzIGhhcyB0aGUgb3B0aW9uIHRvIGNoZWNr
IHRoZQ0KPiA+ID4gcnVudGltZSBwbSBzdGF0ZSBiZWZvcmUgaW5pdGlhdGluZyB0aGUgYWN0aW9u
IGlmIHRoYXQgbWF0dGVycyBhdCBhbGwpDQo+IA0KPiA+IGZvciBpbnN0YW5jZSwgbGV0cyBzYXkg
dXNlciBpcyB0cnlpbmcgdG8gZHVtcCB0aGUgdmFsdWUgb2YgbGlua19zdGF0ZSANCj4gPiByZWdp
c3RlciB0aHJvdWdoIGR3YzNfbGlua19zdGF0ZV9zaG93LCB3b3VsZG4ndCBhIHBtX3J1bnRpbWVf
Z2V0IHdvdWxkIA0KPiA+IGNoYW5nZSB0aGUgbGlua19zdGF0ZT8gb3IgSSdtIGFzc3VtaW5nIGl0
IHdyb25nPw0KPiANCj4gVGhlcmUgbWF5IGJlIHNvbWUgc3BlY2lmaWMgZGVidWdmcyBpbnRlcmZh
Y2VzIChlLmcuIHJlbGF0ZWQgdG8gUE0pIHdoZXJlDQo+IHRha2luZyB0aGUgcnVudGltZSBwbSBz
dGF0ZSBpbnRvIGFjY291bnQgbWFrZXMgc2Vuc2UsIGJ1dCB0aGVuIEkgZG9uJ3QNCj4gdGhpbmsg
eW91IHNob3VsZCByZXR1cm4gYW4gZXJyb3IgaWYgdGhlIGRldmljZSBoYXBwZW5zIHRvIGJlIHN1
c3BlbmRlZC4NCg0KQWdyZWUgaGVyZS4NCg0KPiANCj4gTG9va2luZyBhdCB0aGUgZHdjMyAnbGlu
a19zdGF0ZScsIGl0IGN1cnJlbnRseSBqdXN0IHJldHVybnMgIk5vdA0KPiBhdmFpbGFibGVcbiIg
d2hlbiBub3QgaW4gcGVyaXBoZXJhbCBtb2RlLCBmb3IgZXhhbXBsZS4gUGVyaGFwcyB5b3UgY2Fu
DQo+IGRvIHNvbWV0aGluZyBzaW1pbGFyIGlmIHlvdSBjYW4gbmVpdGhlciBpbmZlciBvciByZXRy
aWV2ZSB0aGUgYWN0dWFsDQo+IGxpbmsgc3RhdGUuDQo+IA0KPiBCdXQgYWZ0ZXIgc2tpbW1pbmcg
dGhlIGJhY2tzdG9yeSBmb3IgdGhpcyBwYXRjaCwgeW91IHlvdXJzZWxmIHNhaWQgdGhhdA0KPiB0
aGUgbW90aXZhdGlvbiBmb3IgdGhpcyBwYXRjaCBpcyBzaW1wbHkgdG8gYXZvaWQgY3Jhc2hpbmcg
d2hlbiBhY2Nlc3NpbmcNCj4gdGhlc2UgaW50ZXJmYWNlcyBpZiB0aGUgZGV2aWNlIGhhcHBlbnMg
dG8gYmUgcnVudGltZSBzdXNwZW5kZWQuDQo+IA0KPiBGb3IgdGhhdCB5b3Ugc2hvdWxkIGp1c3Qg
cmVzdW1lIHRoZSBkZXZpY2UgdW5jb25kaXRpb25hbGx5IGJlZm9yZSB0aGUNCj4gcmVnaXN0ZXIg
YWNjZXNzZXMgYXMgYWxsIG90aGVyIGRyaXZlcnMgZG8gKGFuZCBzdWNoIGEgcGF0Y2ggc2hvdWxk
DQo+IGJlIGJhY2twb3J0ZWQgdG8gc3RhYmxlKS4NCj4gDQo+IFRoZXJlJ3Mgbm8gbmVlZCB0byB0
YWtlIGh5cG90aGV0aWNhbCBQTSBkZWJ1Z2dpbmcgaXNzdWVzIGludG8gYWNjb3VudCB0bw0KPiBh
ZGRyZXNzIHRoaXMuDQo+IA0KDQpJIGRpc2FncmVlIGhlcmUuIFdlIHNob3VsZCBub3QgdW5jb25k
aXRpb25hbGx5IHJlc3VtZSB0aGUgZGV2aWNlLg0KQ2hlY2tpbmcgdGhlc2Ugc3RhdGVzIHNob3Vs
ZCBub3QgaW50ZXJmZXJlIHdpdGggdGhlIGRldmljZSBjdXJyZW50DQpvcGVyYXRpb24uIFRoZXNl
IGRlYnVnZnMgYXR0cmlidXRlcyBhcmUgbWVhbnQgdG8gcHJvdmlkZSB0aGUgdXNlciB3aXRoDQpk
ZWJ1ZyBpbmZvLiBXaGV0aGVyIHRoZSBjb250cm9sbGVyIGlzIGN1cnJlbnRseSBpbiBzdXNwZW5k
IG9yIG5vdCwNCnRoYXQncyBhIGRhdGEgcG9pbnQuDQoNClRoYW5rcywNClRoaW5o
