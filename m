Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09A76718955
	for <lists+linux-usb@lfdr.de>; Wed, 31 May 2023 20:25:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229681AbjEaSZy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 31 May 2023 14:25:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229581AbjEaSZw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 31 May 2023 14:25:52 -0400
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E70897
        for <linux-usb@vger.kernel.org>; Wed, 31 May 2023 11:25:50 -0700 (PDT)
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34VHXjo8017823;
        Wed, 31 May 2023 11:25:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=WcrOKc5ARe8n/VNevyULZrJz0k8tMztPSDFACAW44wY=;
 b=XrhiWQ/Sz8WpF/1URMxKFP+MXUtD+d9c4mtWbAB09QadwnSCZJOiP1My1Qb1UMlwzbRe
 +rrwzD5on3cNnWblFbrEmWFpX6XMdz52g3PsvJWfbgNvOW4Sbt8l/avW/MxxU2c1T1iz
 HA0cI4NonKXD971DJhe3b32A/ceVJQKkV+lJ6Edzl5ayRWHsfftiwfiHIJgXrdb0Xf4d
 E1DHhLr5LbwV7wqrXPUhchuR2ZnzZcF2ppwggHOJ2z5LQIKm6f2oi6CK4B5y8j7UMV19
 S2Gn3krPiZqCJNtLRTbPm51ctDWC1qrXOcnc1tqZdk++LUN4vCfbkhIXJ+2N0Crq6idM kA== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3qugsu4d8r-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 31 May 2023 11:25:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1685557540; bh=WcrOKc5ARe8n/VNevyULZrJz0k8tMztPSDFACAW44wY=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=Fzv1dL8qIwv6C+Fxu5fEx4pfJvqXJ0maVYTiHpE9TYOIztaUjw4YU6qXNZA7hCrs6
         qyVs7vO9vmg8Ed4sn9ZqjJQkdrxwDei/eUij4r4k2CImF3RGdXOIPGT+Wv7lDrUTto
         T4PlxYD0VGVkK7pS3IuLm8n7WxKCa8Q8eBRwroz8Tajj89CIlFNPvOM2hDHDDgJCZV
         Og12Nnk+Pk2/M8WMt/v01Lm13PKKrZjGbvd+t2NAFVI8PpAp1abQqXgjmR5DoUOjp9
         7Itff4RWWZgNTVp5nL+vp+boy3A3O1v4dY4cacIi0Ic3F7Q5QhPfTuaynV0+X5mIU3
         +Z5ObcLOnEZfg==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A167E4074E;
        Wed, 31 May 2023 18:25:39 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id E348DA006D;
        Wed, 31 May 2023 18:25:38 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=t0BX1aRf;
        dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id D49EC40132;
        Wed, 31 May 2023 18:25:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TPGTUioDeRNKloAO6MwEwq8yvMO0y778OjXa2JXb7MVreIPUTUa0MHfv4kYeqB48cbYmubFqMs+gUWyXkKV4vwS/PNambJ9iyL7lskEZ39kPvigNfy4aT8uZbvKkzwdqIUrwYdzZ+58cpxqtLgnp1AMdgpyc4V+DPJ5X6gMySnlarDb1sE5YARvJblTxmTBmGKCyGNYhAtL5mv2yXZi9BnHldYeh6Ne7Z/KNQEyI2Xi5qRpvyfdTR7Yx1BvKRR+SMnv/0Lakb+YkGFjPZTxlNMTZblNnbyh+uLZVHkO9Gkd11PMq4e0uf/1G2sUqcEkQc+HKV0eCIFwFkOO1o7T3UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WcrOKc5ARe8n/VNevyULZrJz0k8tMztPSDFACAW44wY=;
 b=L88zGwl7ykjQMHeFs3iS//aVAarKlC+HgpBQun2egzrrD1l5W/GA+KLfUd2p78KvGjuCt1YdfMl4+g8MFZ9BAJtAIbYJC/+ZOPnz3U1Fs9zXWuH49LSsN6ddfry3neBRbxd36F+jC5ghwek3+qU4TiPm5hArWFPeCnAf6Acs+vlm+uBSluE4J8rST2c7nMW3gZlQLmODegZ7wTekphjYpSMawWlNhpNaXH+da5tFRbfDVYNKeBM2HPN3+lPGAeZOjEZPrirVEbTMtSMUSAPyYuBk7hAeXLbyjP8J5YVMraQ8LC9zKLfiA8rBDKu4wUPi30czFFCV4uPMNpM/7fEfoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WcrOKc5ARe8n/VNevyULZrJz0k8tMztPSDFACAW44wY=;
 b=t0BX1aRf8oE8WWAZaPMirilCNSOr4J0YrENDNIUxkFJdDTpE1DtrgHRq7aFnPFzIUtR6xNgIm9UPRsdiTuqiagHgVmfdugvb7yRqtaTIiiD2/SCvD5e2m3SQuURqKkns8VLVorHKrY7Ad+YgYjUV+qVB0nZ1oO47oQg0pMbQcXA=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by IA0PR12MB8646.namprd12.prod.outlook.com (2603:10b6:208:489::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.24; Wed, 31 May
 2023 18:25:34 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3400:81ff:f191:b312]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3400:81ff:f191:b312%6]) with mapi id 15.20.6433.022; Wed, 31 May 2023
 18:25:34 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Dan Scally <dan.scally@ideasonboard.com>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "torleiv@huddly.com" <torleiv@huddly.com>
Subject: Re: [PATCH] usb: dwc3: gadget: Clear DWC3_EP_PENDING_REQUEST from
 non-0 endpoints
Thread-Topic: [PATCH] usb: dwc3: gadget: Clear DWC3_EP_PENDING_REQUEST from
 non-0 endpoints
Thread-Index: AQHZk529+zfS1a/XQE+6AxtQgYi9LK90FmoAgACc44A=
Date:   Wed, 31 May 2023 18:25:33 +0000
Message-ID: <20230531182525.r2rf3mg3fhec2uo2@synopsys.com>
References: <20230531085544.253363-1-dan.scally@ideasonboard.com>
 <69135fc1-5ebb-ff95-4c7b-17cf8e30c924@ideasonboard.com>
In-Reply-To: <69135fc1-5ebb-ff95-4c7b-17cf8e30c924@ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|IA0PR12MB8646:EE_
x-ms-office365-filtering-correlation-id: e0a2062c-413c-4f49-5e7d-08db62046c6d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Cu2PrmRJllKWO+ckR2KEY4ELTwv/Gqw7uVbSq7v1Y8JlHhZ+z1MBwZWvz3xg/OlPBf2UaJbrUy+PBvxQ3DIiT9tW6J8C8xJWHs3y8rDUVb2Bvm9ZQbCYTsS/welwhk4luq1933JYSiOfdG2A0WpVCIVd5X0HB5+zbSIe+Rrd+np2HaT+eG2os60FMQpqjZ4AAQs0+lF0letj/xEDYQkqoRsHLreps2zzUlSE37WeVIUvWM2A/+/XKgNR2+YPYGk1SY4Y1kIJXQ9WI4QKQ7FnUnzyuA3ooJXp6otrXw5H6oJZxhmZqVBtVNEj0RncfR5HdY9gAa0DlDZOpRDOjXtGyorlQbjssgeS8/L7PO6EBBPLBNSOwwv987WNJlGoB7cGQKhWA4z6p21iUaStGylXXfr9BjFJFDkGBfBHgqrVYXgGgHcPLLgZroKuddZq4YcG+3yMqcdqWs6wUaT8xLiB1v66LV+8NftfV59IBnwQV4eqTl3PsCHxP2BxzMnT2aaLgPf3aFH0SgVWaBhxV0AnpAQymSTpmKzxicc8qJVRj3+wpbh7lFCYFE02d/tG6fGQE8ju5v+cX15oNPXmJSnnFBuWgT29kp4XoDZkIfSKpLmxqceWnaa9vSQQu/t7xDCvVG0QAR0cpLc/4YLDNDZ6UTT4wTeXuGJEw8J/rW9g/e0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(346002)(39850400004)(136003)(366004)(451199021)(26005)(1076003)(54906003)(478600001)(53546011)(8676002)(8936002)(122000001)(38100700002)(64756008)(76116006)(66476007)(66556008)(66446008)(66946007)(6506007)(6916009)(6512007)(4326008)(86362001)(71200400001)(2616005)(316002)(38070700005)(5660300002)(186003)(6486002)(36756003)(41300700001)(83380400001)(966005)(2906002)(473944003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UVQvNjd0Z0FibzhCcFVubEtWdm1lQTh1cjk4Y2ZPdTkrVkpKU2tsdUNwbVdp?=
 =?utf-8?B?M2lJVFJnMVU3YTBFZjY4cXY2Vll1NjdyMDE4VlcvT0RNQkpWMjRZQWxNc2xL?=
 =?utf-8?B?RGtJKzlZazgwb3hZZFcyQ09obkxJdDBqZjRCRkZRaVdYUW1YbmV1aTMzZS9q?=
 =?utf-8?B?MmhUbDlXbWxJOGs0bFVBRDZ2UnlRenRaWGhvUmphMUd6SUZxSTIyY0Jkc1o3?=
 =?utf-8?B?NmpRaTUyR3JvSldQQmxWR1ZIYjdmZGZlWjJxdTUzQkpvaWo4SUw3N1gwZGJK?=
 =?utf-8?B?VWlIN2JKL3hFOHhOV0hqYW1EZzk1Z0cyaVYxY1pwOWdlQ2ZHZzdTd2Q2MEp4?=
 =?utf-8?B?a0N2akZvb041TE04TnZadzQ3bHpTSERwZ3BveHBRSzcyNzBkc1Fmb0JOZm80?=
 =?utf-8?B?UG8wT3RxcWZJMVR3bkVEWXVleVpVQnphZ1BOeUo0L000K1JJL3ZybHR3NXVl?=
 =?utf-8?B?UDlnRyt0VkM2Tk5qVUUzRStDUXluSU5ETktVcmxGTExBRmRhaFROVGczUHkx?=
 =?utf-8?B?cXh0Z042Wm9FUlBTekw3eHhZN3FoREJBb0xJend6bVVRM0RZeU9ZdkFBeGpM?=
 =?utf-8?B?eWZsVU10b0hMVUxlRjVyNHFZVHVaYTNBVXVUWTNpRkZ3dDZlbGZGbkdTQjV4?=
 =?utf-8?B?ajM2VUZ0NkpmeHg2d3ZpOWwxV0c0bGNJZW54RjJqdkhzWmt3Z0Z0ZU9BL2xn?=
 =?utf-8?B?eTdlbWp2Zm01UkxXK1grRlNTSDFxbXJlVHBiM0lZLzF1NTJYalgwekJTMnRj?=
 =?utf-8?B?dnlwb2ZpTXZJNnpXd29TSjFZZUdFa1dOK1IyaUVtVXhnM3NTQktUbENmd1VD?=
 =?utf-8?B?ZC8yUEV3QTJuVy9jb1NOMlJwYlpWcjNlcFQzMTk4Qmlmc0NjaXNDTG5aUUo1?=
 =?utf-8?B?UllqdWNRNGxIQnlUQzVhSkpSSjAzelFESDhiWWgyOUM3RzhmNHFUZ1FBNFhT?=
 =?utf-8?B?ZmdHVFRKQXNUNzBRRGJmWktPYjZGSnZOa1NaZTBLQ055SHE1M3JJQkNZQVYz?=
 =?utf-8?B?enAxMXJuRXFMalJ4VDM0NjVaM1Z0aFBqRTJvYUVCWWRLZFVwbldLbkhhZGND?=
 =?utf-8?B?VTl5dGk3blpDcEJsamZnY1U0bXd5eU45d282bUZiNWI3UERnVlpSZHhVdXpD?=
 =?utf-8?B?bzNTQnRlU01RZDdJU3h2b29vSkR0SHZiMXh0VmZ2eDlkVFV6enExMnBLcytk?=
 =?utf-8?B?Z2ZydGtlQnRMUnN0cjdvSnZrWnpSY0tnUXZZYVQ5S053TmV5ZEpmK09GczRJ?=
 =?utf-8?B?RGZlM082ODRjN05ObjJLSUNweTF5SG9LdzhDWC84SUYrVlJ2Tk5DODBOYytR?=
 =?utf-8?B?MkhNVEVRNzVHUFJnSnRwVEZhMHA1NENseVYrYjArT1daazRoWkI4UWVqVk9I?=
 =?utf-8?B?L3ZaTGtCbzFYRGVEWng4a0lPTHBRU0QwNEsxVS85cVhWaDdEaFBINmtKNmhM?=
 =?utf-8?B?ckRlQXYzQ0ZWZVlZci9HRDdLZWtmb0tBT0htbm9kQWdyUW4vTUExditOdVR4?=
 =?utf-8?B?Zk53YUp3UmNjYzdOc3BlOWtPZUxWaHMvLzF1MkdqSmIrSmFJVGF5cG9EdGpv?=
 =?utf-8?B?RXYrTVY2dUpBRDlvM0JScVZXNVpQMllLTDBNOWY5TUYra3FuVVN6dEQ0djA3?=
 =?utf-8?B?NmlURk51VnpHR2lDSkhsbHFRN2plcVRlUU9Vb0cxZk80TGJ3c09XbFhTZDJY?=
 =?utf-8?B?ZTlFUnB1M3dYZVo4OTF5Zlk3THYwTlJGVk1jYllFRTlpWnJLcWdUQXlNWE85?=
 =?utf-8?B?VGp1T0VXRUxqZzBSeE5NZ3R5cHVmL1dsNURaV3l0N1Y3eTY3QlF4QnNoNnNW?=
 =?utf-8?B?QlFZS2NMUXZiRkJ0WHB5N2FydUFva1ZVUU91QlcxcGpMVGN0VEowZi9iN3Bt?=
 =?utf-8?B?Mi9mTkFFaDZNdkltbkJiZXpBditTa0NvT2NYNXlmaVJnN1Vjb1liYXExendq?=
 =?utf-8?B?ZWFyNmw2c0ExMzlSczNPMHZZbGwxNXJGTUVJbnlxNXlCTGlzTE9nRDNuR1Nm?=
 =?utf-8?B?SFFKc1ZidE04VGs0R0lubHNqeHpXWWh4aUsrd0l0Q0Jicm5ZY3paVHZwNDJF?=
 =?utf-8?B?VkZobVNEQnVDTlhaYjFOWFdMTVRMcGF5NGQ1VUExWTlKSzY4RnRRQ1FCTXZa?=
 =?utf-8?Q?7K9tFyGctsAV3kS7xAZKLoklO?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9976417F92410E409BC3676CD1009489@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?TW1kSXc4TzZWR2UxcGdJbGFNMmR1QXk2T1lHam9LY0k1R1FQOXBINTA5TllL?=
 =?utf-8?B?UVZZbTlkdWo0Y2gzL3NXcVQxMU1EQkFBL085eGduSEh5U2s1UUxZSDlGeWlR?=
 =?utf-8?B?ZTlYOXZjVGhRZ2JUbUk5bVdieEZ6M3J2OVRSaktsS25vWmNFcko2dnhRUGJS?=
 =?utf-8?B?QVR2czdjR3RkZkU0WUFDTUtjMHZqNkR4NHVUaHVxY0dlcDNYbFhxaFMxQmQz?=
 =?utf-8?B?eHphekZJTGRPRUFXYk5sa1BjcncrUURMVjRXTFpDdENQQlNwcUlEV3FZcGZX?=
 =?utf-8?B?SG1TR0J4N0lLUVpyZkxoR2Z5MkNXOUsrV3NsZlFHM3luRFdNK1Q3SVE4VHV5?=
 =?utf-8?B?UUt2V25OaklmVndqdTJ5aW9xaWlvQ3JnV3UzWXV1Rml0TzNJcE1IOEVuQTNv?=
 =?utf-8?B?YVdmVDVVVWMrTTR5WmNmajlXZ2xKbENsSDVsUzNWeVlxNWRTSlBwQlJxRll2?=
 =?utf-8?B?WDQyQ2RGem1kem5TcVhDTkFOL3hsUFpmSG1GbGJNOVRSNDBoYXZVR012WGNT?=
 =?utf-8?B?VCtBYlNWL0djK2pSbzhBaUZSUVIvY1RmS2dIV3J2QmV4RXpaTWJ3WlRFTjF2?=
 =?utf-8?B?WXhDU1BjT25xZTJYa3ZaKzV3QndSYm80UU9iREFiQk5tNjJNTE1zdVQ4VjlI?=
 =?utf-8?B?aEhxMnhhVlJCaDN0MHNoR2xUdjEwV2VMR21UTk5LYkEzR3VWS3YvYTNNdjRT?=
 =?utf-8?B?cG5xNmN5ZGRmdlQwODlVL1RYT254dER3MU5udzVtRExDYkZzTFhibW9KQ3Jh?=
 =?utf-8?B?TDNZVG4wa0xYTy9pRkZ1M3Bjd3lYSDU0bHdBbU9GSDgyQnVJdlNKV3JHZnpZ?=
 =?utf-8?B?cHYxMUxEN2htSVAzK01mWm5zaWVFUGdrOUsvSjFSN2RqQUcxeXFLaDBJMldE?=
 =?utf-8?B?TFpFd0xMZEloblhsSHJWMEZOSlRBUlQvbkVaajN4dGtqOUNkeVFmNzhpcHEz?=
 =?utf-8?B?dUt1VjIxSUlNUXJ2a2pmV2Fpbm52UE9UaXZ4T3RXZXA4VjkyeStYU0p4enNM?=
 =?utf-8?B?THA3VHQvRkhDVHVhQUV0VlZ0SGVzWFBqQXZ6NnVrUEpPaWRSNXR3eDEwQ2Uw?=
 =?utf-8?B?UER6V1lXY3N1QlR3RU1vb2tGMmRDM2hYaDlxT3ZyRTVGdjFDU1Y1WXZPMmVJ?=
 =?utf-8?B?TUVpdVlKanhnRk9MZjdvcUYxbkYvNVRSMkhNcHVqM00vMUlLODZIUlV2UkZU?=
 =?utf-8?B?NUZNb2JqVXdiZjJrNmZkb3E4bDNOM1ZMTmNOZ2VPbnRUWUM4aldTZVo2c0Vx?=
 =?utf-8?Q?rih7pXW7OJ+wNJe?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0a2062c-413c-4f49-5e7d-08db62046c6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2023 18:25:34.1218
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WWtF6NJRZgo9QtegiC9gOU/Hd8MUDLj439LGqkJEW7PwQxyw2yb7er1LWT0Tbzn2oDLdzMokEmY7HItUuWlN0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8646
X-Proofpoint-GUID: wNHWwmNBlZLhyodBRioUs1KnUOijEmSa
X-Proofpoint-ORIG-GUID: wNHWwmNBlZLhyodBRioUs1KnUOijEmSa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-31_13,2023-05-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 clxscore=1011 lowpriorityscore=0 bulkscore=0 impostorscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305310156
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgRGFuLA0KDQpPbiBXZWQsIE1heSAzMSwgMjAyMywgRGFuIFNjYWxseSB3cm90ZToNCj4gSGkg
VGhpbmgNCj4gDQo+IE9uIDMxLzA1LzIwMjMgMDk6NTUsIERhbmllbCBTY2FsbHkgd3JvdGU6DQo+
ID4gVGhlIERXQzNfRVBfUEVORElOR19SRVFVRVNUIGZsYWcgaXMgc2V0IGFnYWluc3QgYW4gZW5k
cG9pbnQgd2hlbg0KPiA+IHRoZXJlIGFyZSBubyBwZW5kaW5nIG9yIHN0YXJ0ZWQgcmVxdWVzdHMg
YXZhaWxhYmxlLiBUaGlzIGZsYWcgaXMNCj4gPiBjbGVhcmVkIG9uIHF1ZXVpbmcgdG8gdGhlIGVu
ZHBvaW50IGZvciBlbmRwb2ludCAwLCBidXQgbm90IGZvciBhbnkNCj4gPiBvdGhlciBlbmRwb2lu
dHMuIFRoaXMgY2FuIGV4YWNlcmJhdGUgdGltaW5nIHByb2JsZW1zIGJ5IGFsbG93aW5nIGENCj4g
PiBxdWV1ZSB0byBnbyBhaGVhZCBmb3IgYW4gaXNvY2hyb25vdXMgZW5kcG9pbnQgdGhhdCBzaG91
bGQgbm90IGJlDQo+ID4gc3RhcnRlZCwgc28gY2xlYXIgdGhlIGZsYWcgdXBvbiBhIHN1Y2Nlc3Nm
dWwgZHdjM19nYWRnZXRfZXBfcXVldWUoKS4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBEYW5p
ZWwgU2NhbGx5IDxkYW4uc2NhbGx5QGlkZWFzb25ib2FyZC5jb20+DQo+ID4gLS0tDQo+IA0KPiAN
Cj4gSnVzdCB3YW50ZWQgdG8gZ2l2ZSBzb21lIGJhY2tncm91bmQgb24gdGhlIHRpbWluZyBpc3N1
ZXMgdGhhdCB0aGlzIGlzDQo+IGhlbHBpbmcgdG8gcmVsaWV2ZTsgd2Ugc3BvdHRlZCB0aGlzIGlz
c3VlIGFzIGEgcmVzdWx0IG9mIGEgIk5vIHJlc291cmNlIGZvcg0KPiBlcDFpbiIgZXJyb3IgYmVp
bmcgdGhyb3duIG9jY2FzaW9uYWxseSBkdXJpbmcgcmVwZWF0ZWQgc3RyZWFtIG9uL29mZiB0ZXN0
cw0KPiBmb3IgdGhlIFVWQyBnYWRnZXQgb24gYSBwbGF0Zm9ybSB1c2luZyB0aGUgRFdDMzsgZm9s
bG93aW5nIHRoZSBlcnJvciBzdHJlYW0NCj4gd29uJ3QgcmVzdGFydCB1bmxlc3MgeW91IHJlYm9v
dC4gVGhhdCBlcnJvciBvY2N1cnMgd2hlbiB0aGUgZ2FkZ2V0J3MNCj4gd29ya3F1ZXVlIGZ1bmN0
aW9uIHJ1bnMgdXNiX2VwX3F1ZXVlKCkgd2hpbHN0IHVzYl9lcF9kaXNhYmxlKCkgaXMgcnVubmlu
Zw0KPiBkdXJpbmcgc3RyZWFtIG9mZi4gVGhlIERXQzMgZ2FkZ2V0IGNvZGUncyBsb2NraW5nIHBs
dXMgdGhlIG51bGxpbmcgb2YgdGhlDQo+IGVuZHBvaW50IGRlc2NyaXB0b3IgZHVyaW5nIF9fZHdj
M19nYWRnZXRfZXBfZGlzYWJsZSgpIFsxXSBhbmQgdGhlIGNoZWNrIGZvcg0KPiB0aGF0IHNpdHVh
dGlvbiBpbiBfX2R3YzNfZ2FkZ2V0X2VwX3F1ZXVlKCkgWzJdIHNob3VsZCBtYWtlIHRoYXQgaGFy
bWxlc3MsDQo+IGJ1dCB3aGF0IG9jY2FzaW9uYWxseSBoYXBwZW5zIGlzIHRoZSBkd2MzX2dhZGdl
dF9lcF9xdWV1ZSgpIGNhbGwgc29tZXRpbWVzDQo+IG1hbmFnZXMgdG8gZ3JhYiB0aGUgbG9jayB3
aGVuIGl0J3MgYnJpZWZseSB1bmxvY2tlZCBkdXJpbmcNCj4gZHdjM19nYWRnZXRfZ2l2ZWJhY2so
KSBbM10uIFRoYXQgaGFwcGVucyBhZnRlciB0aGUgU3RvcCBUcmFuc2ZlciBjb21tYW5kIGhhcw0K
PiBiZWVuIHNlbnQsIHNvIF9fZHdjM19nYWRnZXRfZXBfcXVldWUoKSBydW5uaW5nIHRocm91Z2gg
dHJpZ2dlcnMgYSBTdGFydA0KPiBUcmFuc2ZlciBjb21tYW5kLCB0aGUgZHdjM19nYWRnZXRfZXBf
ZGlzYWJsZSgpIHRoZW4gZmluaXNoZXMgYW5kIHN0cmVhbQ0KPiBzaHV0cyBkb3duLCBidXQgd2hl
biBpdCdzIHN0YXJ0ZWQgYmFjayB1cCBhZ2FpbiBhbm90aGVyIFN0YXJ0IFRyYW5zZmVyDQo+IGNv
bW1hbmQgaXMgc2VudCBhbmQgdHJpZ2dlcnMgdGhlIGVycm9yLiBUaGlzIHBhdGNoIGFtZWxpb3Jh
dGVzIHRoZSBpbXBhY3Qgb2YNCj4gdGhhdCByYWNlIGluIG15IGNhc2UsIGJlY2F1c2UgY2xlYXJp
bmcgdGhlIGZsYWcgcHJldmVudHMNCj4gX19kd2MzX2dhZGdldF9lcF9xdWV1ZSgpIGZyb20gcnVu
bmluZyBlaXRoZXIgX19kd2MzX2dhZGdldF9zdGFydF9pc29jKCkgb3INCj4gX19kd2MzX2dhZGdl
dF9raWNrX3RyYW5zZmVyKCkgZm9yIGEgbm9uIHN0YXJ0ZWQgaXNvYyBlbmRwb2ludCAtIGJ1dCB0
aGUgcmFjZQ0KPiBpcyBzdGlsbCB0aGVyZS4gSSB0aGluayB0aGUgcG90ZW50aWFsIGZvciByYWNl
cyBpcyBwcm9iYWJseSB1bmF2b2lkYWJsZQ0KPiBnaXZlbiB0aGUgdW5sb2NrLCBidXQgSSB0aG91
Z2h0IGl0IHdhcyB3b3J0aCBleHBsYWluaW5nIHdoYXQgbGVhZCB0byB0aGUNCj4gcGF0Y2ggaW4g
Y2FzZSBpdCByYWlzZXMgc29tZSBpc3N1ZSB0aGF0IEknbSBtaXNzaW5nLg0KPiANCj4gDQo+IFRo
YW5rcw0KPiANCj4gRGFuDQo+IA0KPiANCj4gWzFdIGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMv
X19odHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC9sYXRlc3Qvc291cmNlL2RyaXZlcnMv
dXNiL2R3YzMvZ2FkZ2V0LmMqTDEwNDRfXztJdyEhQTRGMlI5R19wZyFhcUVLRFp3SHh6YjBPWW9z
MWh0RlRpWFRuUFdjUWJuTmc4cWV6aENOSjdiVlFQLUV3cDRORHcyTl9taWpMMDJNUm1veU9GajRk
bE83dkVnMU5vd21TNEEza2pVNiQNCj4gWzJdIGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19o
dHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC9sYXRlc3Qvc291cmNlL2RyaXZlcnMvdXNi
L2R3YzMvZ2FkZ2V0LmMqTDE5MjNfXztJdyEhQTRGMlI5R19wZyFhcUVLRFp3SHh6YjBPWW9zMWh0
RlRpWFRuUFdjUWJuTmc4cWV6aENOSjdiVlFQLUV3cDRORHcyTl9taWpMMDJNUm1veU9GajRkbE83
dkVnMU5vd21TN2lIcVpkZyQNCj4gWzNdIGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRw
czovL2VsaXhpci5ib290bGluLmNvbS9saW51eC9sYXRlc3Qvc291cmNlL2RyaXZlcnMvdXNiL2R3
YzMvZ2FkZ2V0LmMqTDIxNl9fO0l3ISFBNEYyUjlHX3BnIWFxRUtEWndIeHpiME9Zb3MxaHRGVGlY
VG5QV2NRYm5OZzhxZXpoQ05KN2JWUVAtRXdwNE5EdzJOX21pakwwMk1SbW95T0ZqNGRsTzd2RWcx
Tm93bVM0V09yaDk4JA0KPiANCg0KDQpUaGFua3MgZm9yIHRoZSBkZXRhaWwgYmFja2dyb3VuZCBk
ZXNjcmlwdGlvbi4gVGhpcyBoZWxwcyBhIGxvdC4gVGhlDQpEV0MzX0VQX1BFTkRJTkdfUkVRVUVT
VCBmbGFnIGlzIGFjdHVhbGx5IG9ubHkgbWVhbnQgZm9yIGVwMCBhbmQgaXNvYw0KZW5kcG9pbnRz
LiBSZWdhcmRpbmcgaXNvYyBlbmRwb2ludCwgdGhlIGdhZGdldCBkcml2ZXIgc2hvdWxkIHByZXBh
cmUgYW5kDQpxdWV1ZSBpc29jIHJlcXVlc3RzIHByaW9yIHRvIHRoZSBob3N0IHJlcXVlc3Rpbmcg
Zm9yIGl0LiBTaG91bGQgdGhhdCdzDQpub3QgdGhlIGNhc2UsIHRoaXMgZmxhZyBpcyBzZXQgc28g
dGhhdCBkd2MzIGNhbiBzY2hlZHVsZSB0cmFuc2ZlciBsYXRlcg0Kd2hlbiB0aGUgYXJlIGlzb2Mg
cmVxdWVzdHMgYXJlIHF1ZXVlZC4NCg0KVGhlICJObyByZXNvdXJjZSBmb3IgZXAxaW4iIGlzIGV4
cGVjdGVkIGluIHlvdXIgY2FzZS4gVGhlDQp1c2JfZXBfZGlzYWJsZSgpIEFQSSBpcyBkb2N1bWVu
dGVkIHRoYXQgbm8gb3RoZXIgdGFzayBtYXkgYmUgdXNpbmcgdGhlDQplbmRwb2ludCB3aGVuIGl0
J3MgY2FsbGVkLiBUaGUgVVZDIGdhZGdldCBkcml2ZXIgaXMgYnJlYWtpbmcgdGhpcyB1c2FnZQ0K
bW9kZWwgd2hlbiBpdCB0cmllcyB0byBxdWV1ZSBtb3JlIHJlcXVlc3QgYWZ0ZXIgY2FsbGluZw0K
dXNiX2VwX2Rpc2FibGUoKS4NCg0KWW91ciBwYXRjaCB3aWxsIG5vdCByZXNvbHZlIHRoZSBpc3N1
ZSB5b3UncmUgdHJ5aW5nIHRvIHNvbHZlLiBUaGUgZml4DQpzaG91bGQgYmUgaW4gdGhlIFVWQyBn
YWRnZXQgZHJpdmVyLg0KDQpUaGFua3MsDQpUaGluaA==
