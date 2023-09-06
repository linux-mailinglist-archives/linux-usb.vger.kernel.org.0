Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFA687946CF
	for <lists+linux-usb@lfdr.de>; Thu,  7 Sep 2023 01:09:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233121AbjIFXJS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Sep 2023 19:09:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232142AbjIFXJQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 Sep 2023 19:09:16 -0400
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 989D5E7C
        for <linux-usb@vger.kernel.org>; Wed,  6 Sep 2023 16:09:12 -0700 (PDT)
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 386IGW3q031372;
        Wed, 6 Sep 2023 16:09:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=gO4vBpRPDPE6KHo8VOfrkUmKb+DIRC5quJLBLjW8UfQ=;
 b=Iup7qT/US+ESjFTKW51n9tZVl7wqKLN6cZgCA60E8Apf1sFRrjknUsq+qa8qmVyy4kMo
 3o7s15YR7WEBqzMlkEBQzy+PV95t2c1pQmTyjVcc1T9qLJE1hsJB+Ai7SJNPr4SKaq6V
 aExfeokEm5CksrOWnEIX5Fe4kb6Bf1911SBt2Sl6HPPBV7uE3jPqP60b3cu2XIzLGKzf
 toPtKDLXRR/p5c8TaypYE+Sztr97fZQdzax37LJb5l2zdfGUgZfYg3nIKOKI0ieL/hIc
 yfGWGPGJJM0orj8I28TqTOQsfimO2A//rHroFK++25BoOlAfxijkoZgt/UT9nkZy9wlW 9Q== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3sv4a5k8k5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 06 Sep 2023 16:09:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1694041749; bh=gO4vBpRPDPE6KHo8VOfrkUmKb+DIRC5quJLBLjW8UfQ=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=iT+XIRQ83uk5GlPGw7M3lcEe7akafNuU6X9SDErKT9r1DXZBh2pohAIkfXwPcUfz4
         2glCnWOq/GBacwCX2/XKHWa0zu3NrHIbUOkMcKlZ4yw5lYe3aFjObDsgPMcN33sbL2
         tHZYTrUAJ05smIT6pV737qvmR7mMpAGqpFCkkSajtwgcG/XkwooHFQSLZZ37QF5bjc
         DAy2OSub7heZ0Z/Yf+4oo/WEpWemBnyXOn4SNIfLlOwfARy6wBJ1D+3dkdsZOak7Sw
         z0SeX9ZUCcwKZ1oBhb1s/xUoJAvkLA8Efwk6/Vyd8tR0dTVVY+2dERB6qXyAOuPZ7H
         CBDOqKEocyFFA==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E58DD401B8;
        Wed,  6 Sep 2023 23:09:08 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 9191CA0060;
        Wed,  6 Sep 2023 23:09:08 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=B96wGVeR;
        dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 6C7C640352;
        Wed,  6 Sep 2023 23:09:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TWwnj4YKgXVXHzl/5kgm45Gpk3vbVuULv4zP0f5n9/D2gmNuUulM8iJZr3RoCvfzhpkaOVqm/pzzbqHt4DbGhPZFzj1mEGwWUIZ+Na7S+qjx45y5SLWt0MotLGaU33wQ2tpayjkL9FnLu3QxDlDTF20TtEBxtgTMr9AXc/ZMzCS9R8YLzP3dG8GrTh30Jh8kMIR2UUUVErRnQITgSwYZgXjCxqgzzbKm0J4fHxzqhJo/LO2e1nJFbTmjSZiRboKhbR/jpnKnb8X3BkWKpMzLzRFK5jqTUBkZE3Jvf14oX9B5ZZeq9edDx6HIFz1jfYg6oOUMfQehU3ypxPRsb1qsHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gO4vBpRPDPE6KHo8VOfrkUmKb+DIRC5quJLBLjW8UfQ=;
 b=KXyoBiKsfK8vkLPUWDArvBF6sh211E1HhwI1jY12vTmAtLcfjfJFAPxJnd4MqVdT6YICiH9GBCqIgUmIr92/WuMqCIaopJ2MRPMRIm9hfjVEQTrW4K63LzTb/YaFH3wWon/8oRnckzSLnu3FiJ9CP4HAbLGFqBXL5rjWlFSb8rdtmw51Z5ops0Oz5Tej9o0s+u5fz9sCm9OxI1JsGUrhsiZFGXFzJMUBXEw07BL5jI9qWUBRCYX/ZFpqNw9TGYD6LOR4/rqnARtUWtbzusnF2al8dB7pekeG/LsfOb6sC+UgIOJQmEMj3eyIBeuYYVeY8FNSLtNFRztYfbuo2XVJGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gO4vBpRPDPE6KHo8VOfrkUmKb+DIRC5quJLBLjW8UfQ=;
 b=B96wGVeRGguwMCbUJsbOuGVNviy+WjzMYWprMfeLELD5kszm5ONLNTiKCUM9xmjU/KExpLe2HM7mz7ylnXxI4J/lA9NjahX1s7IUPytfMWkjqTsXKCEaFOO6JMUmh5HY2yOLizGz09sl1i6e5QDhnDEtbdeN3MKx4FnDoqaOw+M=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by CH3PR12MB8658.namprd12.prod.outlook.com (2603:10b6:610:175::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 23:09:04 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::548c:ae3:537f:ca2f]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::548c:ae3:537f:ca2f%5]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 23:09:03 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Michael Grzeschik <mgr@pengutronix.de>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: DWC3-Gadget: Flickering with ISOC Streaming (UVC) while
 multiplier set on Superspeed
Thread-Topic: DWC3-Gadget: Flickering with ISOC Streaming (UVC) while
 multiplier set on Superspeed
Thread-Index: AQHZ3FhJKJr5gUY68kuSvYhFApjTyLAFL1EAgASHkoCAA0Y9AIAAbtcAgAEIgwCAAAESAA==
Date:   Wed, 6 Sep 2023 23:09:03 +0000
Message-ID: <20230906230900.tmyhlxomrhsm3kna@synopsys.com>
References: <20230831221242.GC20651@pengutronix.de>
 <20230901013118.iqpegkklfswdkoqc@synopsys.com>
 <ZPULnRSVgd5S3Cao@pengutronix.de>
 <20230906004144.4igr4akglxxqahc3@synopsys.com>
 <ZPgnwlOV1XP82kAY@pengutronix.de>
 <20230906230510.vi7d4wnjeiapgtyk@synopsys.com>
In-Reply-To: <20230906230510.vi7d4wnjeiapgtyk@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|CH3PR12MB8658:EE_
x-ms-office365-filtering-correlation-id: f395412d-55f0-4701-e4b3-08dbaf2e4383
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r9gp8+ASMoWEmqfeF9d4N8jbuMIgi5lmavL5/QOIMc+Nd1BebRPrT1UB4GHHNFVdy4tVGohF6Y3uf7OFj9LYdRfcVS0Q8o7zk1FVO3NyYK3pCED47kb/gZ79I991A78tDHef72o6RGGzXhQh7W8chxuPnnuDk4qVf0Yxr1Ge/wXBZa1QVPgY6h2K0S8EpBJJLtHd5ZZat2DufhE7kl6cm14RFevWbVnvVN/3tQB5SXyGAOEtduEwZv0oAFciZx6xGyc0K4JKW/gGnlgPiZ7U5CBfs6pCr9yDNmw+Vwyt7tjWl4LTxahz5M0mB2kLZey+wha8lKDvuFaJJG+SwzxaH6xU12ZYfbAIrAgIm+Y9PtJ78O9Mrc8kmaTlTRvuVpi/BYGElnWoLHHHeW0Bsggj0mB57R2HhnCzYlJIabJJX30vDVTUzDFTr7hr0J1hMp0tL8dFzIRswarGy2RS/7dgRVixNcYUctBcvpGP2k7EwApCtD5vMcKteGLIxnMJtzZreC0BCOUG7b2CCm+92/imIpkGQyW6y+BjZmhbN54hX9kEBRUQ4bEOvg3O2PODYBc+X/IFO9r88lgksTyskdajVs4eZOK/ndTyr+1Y7tMs3ZFLApOFCvhZl6ZChT7/u/VJ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(346002)(39860400002)(376002)(396003)(451199024)(1800799009)(186009)(41300700001)(38100700002)(38070700005)(4326008)(8936002)(8676002)(5660300002)(66946007)(6916009)(316002)(66556008)(54906003)(66446008)(64756008)(66476007)(76116006)(2906002)(1076003)(2616005)(6512007)(6486002)(6506007)(71200400001)(478600001)(122000001)(26005)(83380400001)(36756003)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dzNta2F5UjROSFdkSHJlazF6czJ2d3QzY2JFRk1ncXJvTjJuWnJHUVdoQUJM?=
 =?utf-8?B?Uy9MMTlib1Z5cG4wRVYvejNmTXFZTUxLQndHeTlXdXJBMU9ocjBlczJIeVNO?=
 =?utf-8?B?S3YwM1U0N09UVzZnQVljY2IxZStNeEhGY05BZTVVV2svbGx1ZkVvZEdJOW1H?=
 =?utf-8?B?Z0s3Tm5qakUwWXR6a0xtek9JTnZoRFVZTklaeTRvWlpFVXdYdTRCQXVYeGdq?=
 =?utf-8?B?SGQrNCtKN09GeHN5bHBZZGo5aVAvL2RtUCtjMDdsWlR0YWVGbVVwVmhlQXE1?=
 =?utf-8?B?V1AvQjUxVGYyVFFOZjJWMlpZU3d4VWJyQUtFdUhYKyt5aTBWd1BaTXNSK29z?=
 =?utf-8?B?R0Rzb3pNVEZwOVp1dVl4ZC9CRTk4WTN5Z1lIekQ5SkJnVmo4cUMvVHh4WmhL?=
 =?utf-8?B?dmJZd0hIckIyczlWYzc0clNySlNEeTJtWFZqRzlOSGZvdVlIeVdsRkJmekll?=
 =?utf-8?B?QjVZc0lRWW00aDF3aTRYNHpmbFAvbnNLeUlzSlhTU1lXUGt4MEVOUjFleVZq?=
 =?utf-8?B?UXlXaDdWZE9CZXVJVXkvbXIwZzNJL0IzUTlKWDcwTXlNMmJwY2RPdi80OThD?=
 =?utf-8?B?MTdMYmtUT0tNMGs5YXV5dXQxNW14aHhLS29ZbkxSeFVXUklucEZMUGdCMVh2?=
 =?utf-8?B?aTVheGNmMDhOdzM5UUNHY2FhWWszSzQxdHhmWS9QSUNqak5VeGJCU3NRZXV5?=
 =?utf-8?B?eWsvam8vVjhpWGJIL1YyUUdMdE9maGwzRDRwVmpTR1RiWW5CZUxFMmUyQURM?=
 =?utf-8?B?cUxXTmtmcHdkTm9rWlpvOTc3cEhSaW1JT2tnWVBySVJPQmdiL05QV1Awalgr?=
 =?utf-8?B?VGNoYlBwVktiTnZJVXJ4M1pFTG10SE4yU2t5YjYra0lQNjMycU9VSzMwZnE5?=
 =?utf-8?B?TWhGYldaVTlOOUtLb0RwZGxSQks3Qll6Yjc0ZXhqdjlvczdJRzZieGNlYmFr?=
 =?utf-8?B?RC8yVVQzUzA4Q0ZQcWhqc050c21uUlNDNlBQUm84cktRV05OOExmNDZlbU5y?=
 =?utf-8?B?WVM1Q2dwdDIzcXArV3hNTGt2MjFmalJzcm1TWkJGWDgyY2NJdnpJei9wby9K?=
 =?utf-8?B?VUw4eFdrNHk4TGYwTEJERHhrT2tid09GQTNwR01rVE82RVp2clNHQi8zV2Rs?=
 =?utf-8?B?Mlg1OUV3MlJML3RFNk1NWUs1bWNoUFhoMjdyaDU2MkdaTEhseTZkQS91bUVI?=
 =?utf-8?B?T1F4RmJiV1NnS2VwZ1p2SDN3MUsxMThSeExTZ0VBTmlYaTVuMmRaWFJGaEdh?=
 =?utf-8?B?NTlKWnJrUmtxQUd4cktadGJoNExzL2IzSHU0bUV3aUtWUHVMTUI5RlZDYzZK?=
 =?utf-8?B?TzYzZ1h2aWxIR3BQc04xZmxha3NEYXdLQ2hUcTlKVEcxcGpOVE4vc2szTGhr?=
 =?utf-8?B?RzRrN2I0YnRCbnZlVGtuNUViOTNHaUpHb0docGdmbDlkenB2SFBEYUYxTXFH?=
 =?utf-8?B?WDg2dEthajlYY2dUK1E3OXlNWUd4RUplOFp2Tm9wTzcvODdwcnhUbnBqSDhj?=
 =?utf-8?B?ZkJQZTN3b1FVNDZZb3F1ODA1QStaWEd4TC9SczJLYmVmWXNscGVKZ3hFbjJS?=
 =?utf-8?B?YVFNbHpaL2phUEFHK2oweHRwQnp4Q1ZVNVJudkE3RnFmWG1tUTZpZE54ZjlR?=
 =?utf-8?B?RTFMNjJYZ1MwWGdBdmEwdVJoUG1ya0R6Vm12UDJoa3FGSU9KT1pObE1WY1VD?=
 =?utf-8?B?eHY4NUxTNHdFR3lrL014YVJVMS9vSVNqSFdUZGNEVVZFWmV3bFlRNFZkWE5j?=
 =?utf-8?B?cFFWVFRWcmdkV1UvbVo3WnZDcm4xWnRRd3RkYmtEd0lUZXVveXBrYWJXNTBH?=
 =?utf-8?B?UUpYR1E3WlhFV2dKbW5TdnAvdnFJYzU4bmZ0a2dNa0dPVkFGSUJuN3IyNnZM?=
 =?utf-8?B?SzV6cE9xUVp0R0cwNVlHMFlkekhOa3ZYdGlWLzJvbmhTZEo0OEM5YWZabVg4?=
 =?utf-8?B?TDR3cHVRTWMzL1hlWi9OMFJGcEF6L3FZY2FLYTBuY08zQTVVTDJ1S1hpRzFS?=
 =?utf-8?B?MzIvTmkvZnJDOFJZYWdBbXMyVEJKZll1UW83Q2xGdy9uWmlDWGhBQWl5MVBa?=
 =?utf-8?B?Q3o2SmYwbFozWXRURU9mYllwK2tick9TdmZHdHFpT2FwV3FXalBHM0lIU2lo?=
 =?utf-8?Q?L5xE6KPW331WG5QdQVmFb/4BL?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D2B2D39854F88343ADBE838757BE4C39@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: Tar8cEQ/YH77fGKZDlFnpAdftDXokyioGRaN4iIe1uXgpX+SpN1G1PQ63u0+HFLRggHTBnjvP3dCoc6akNVSogLfiMLitnBklHU+qo+L/QLTBaq0H1MaFKeH3o+4PX6bHMZkKG7cc29P3Z5FfI4ecLAFss1goPv3GfoCOInocqK7ajijimG3bhkoyMRId7TGjHQG8k9075AaGiRfEnLBXlbVx2ksRqZvAhAXYGw0zT8U0kq0vMoRnmngRn6giC8R+aEuNhwEHLPq0BJqxFRG+D+H0O0NjirFj0fxw5HbWyGjcICcQDuU/AScQCEO+Gd+xncCmqQvhn+fAoTk3Fe7batQK3Bh/3q66BoMB6ZIhQhx8UoU6C1Wi8d7vHY3wdUOA97zD2HxtAUtgFn8Mkj4hXlPNttdkEncKZGYzjfe17TbIOOVtU6vNyrksZjPuXRhhhOCp2+dMIz19MCvMYB65NUTxZfs3OBm0v270PxkCDwcFU6l5+8LZDJ2+n6i80Cq7DFTC7CzlmBC93wH/AtmYhOXsM7mlYVr+ESeCBsx4OxcsVK9ajeOLj70t5eUSoU74WPfFCDULOZJB145NLI54TxkOcQU+MeSvK260VDSRECaeyYNgNGYi6I5Isar8TSCAhsv2iMQF+Jw+ibk2TA7U23gPll69gNne9YmaXedZoApGWKORTDQHtCfwk9e3XDatpqE2RXSGl3OBnjB8kOKYotSgR9+wMM+d5AnCpoRtrFeGrBQyI6JwGV1XnmkL2yxk78jVKEtjnBy0nuDUIR7Nmu2JoMO2qpf3rP6oeOpk6noNE7EV1birbjZQrJjk1jeZQB7mo90BlTnAmhPNghevA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f395412d-55f0-4701-e4b3-08dbaf2e4383
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2023 23:09:03.8723
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TmEbLgYB+MYf/sy8tOKkzpcOrP5T4U3I3lOX7dn6yea2XUYC9wK+lmPrfkRWRgCOvEFtkf8xgEMoBH8InF2YJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8658
X-Proofpoint-GUID: LbbAUytblEMe0Hna96cn8rGuI2mONfEu
X-Proofpoint-ORIG-GUID: LbbAUytblEMe0Hna96cn8rGuI2mONfEu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-06_06,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 phishscore=0 spamscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 malwarescore=0 mlxlogscore=495 clxscore=1015 impostorscore=0 adultscore=0
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309060199
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gV2VkLCBTZXAgMDYsIDIwMjMsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gT24gV2VkLCBTZXAg
MDYsIDIwMjMsIE1pY2hhZWwgR3J6ZXNjaGlrIHdyb3RlOg0KPiA+IA0KPiA+ID4gMikgQnVyc3Qg
c2V0dGluZw0KPiA+ID4gCUkgdGhpbmsgdGhpcyBpcyBzZWxmLWV4cGxhaW5hdG9yeS4gTGFyZ2Ug
ZGF0YSByZXF1ZXN0IG5lZWRzDQo+ID4gPiAJaGlnaGVyIGJ1cnN0Lg0KPiA+IA0KPiA+IEkgd2ls
bCBoYXZlIHRvIGZpbmQgb3V0IGlmIHRoZSBidXJzdCBzZXR0aW5nIGNhbiBiZSBjaGFuZ2VkIG9u
IHRoZQ0KPiA+IHJrMzU2OCBzb21laG93LiBUaGlzIHNvdW5kcyB2ZXJ5IGxpa2VseS4NCj4gPiAN
Cj4gDQo+IFRoZSBkd2MzIGRyaXZlciBjaGVja3MgdGhlIGVuZHBvaW50IGRlc2NyaXB0b3IgZnJv
bSB0aGUgVVZDIGZ1bmN0aW9uDQo+IGRyaXZlciB0byBzZXR1cCB0aGUgYnVyc3QuIFNvIGp1c3Qg
c2V0dXAgdGhlIG1heCAxNiBidXJzdHMgKG9yIDE1IGluIHRoZQ0KPiBkZXNjcmlwdG9yKS4gVGhl
IGR3YzMgY29udHJvbGxlciBzdXBwb3J0cyB0aGF0LiBXaGV0aGVyIHRoZSBob3N0IHdvdWxkDQo+
IGRvIDE2IGJ1cnN0cyBpcyBhbm90aGVyIHRoaW5nLiBOb3RlIHRoYXQgdGhlcmUncyBubyAibXVs
dCIgc2V0dGluZyBmb3INCj4gU3VwZXJTcGVlZC4NCg0KQ2xhcmlmaWNhdGlvbjogbm8gbXVsdCBz
ZXR0aW5nIGZvciB0aGUgZHdjMyBjb250cm9sbGVyIHdoZW4gb3BlcmF0ZSBpbg0KU3VwZXJTcGVl
ZC4NCg0KVGhpbmgNCg0KPiANCj4gSSByZWNhbGwgdGhhdCBVVkMgdHJpZXMgdG8gcGFjayBhIGxv
dCBvZiBkYXRhIGluIGEgc2luZ2xlIHJlcXVlc3QuIEFsbA0KPiB0aGUgd2hpbGUgc29tZSBpbnRl
cnZhbHMgaXQgd291bGQgc2VuZCAwLWxlbmd0aCBkYXRhIGJlY2F1c2Ugb2YgaWRsZQ0KPiB0aW1l
LiBJIHdvdWxkIHNwcmVhZCB0byBtb3JlIHJlcXVlc3RzIHdpdGggYSBsaXR0bGUgbGVzcyBkYXRh
IHRvIGdpdmUNCj4gdGhlIGhvc3QgYSBsaXR0bGUgbW9yZSBicmVhdGhpbmcgcm9vbSBhbmQgYmFu
ZHdpZHRoLg0KPiANCj4gQlIsDQo+IFRoaW5o
