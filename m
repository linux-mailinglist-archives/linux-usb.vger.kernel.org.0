Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D9136B54F5
	for <lists+linux-usb@lfdr.de>; Fri, 10 Mar 2023 23:59:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232022AbjCJW70 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Mar 2023 17:59:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231852AbjCJW7P (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Mar 2023 17:59:15 -0500
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EF63138F4B
        for <linux-usb@vger.kernel.org>; Fri, 10 Mar 2023 14:59:04 -0800 (PST)
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32ALnTri016273;
        Fri, 10 Mar 2023 14:58:51 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=+a350uaHw6gjyVGINwES539usOqDhQPLdzRQTUYPFmQ=;
 b=pyAel/g6jqAdUQwoV1WLBlE0O2IP8QiOV/PjwVg16yWoib3FDVaWBLZHbaImphlvl7QN
 L+OgLMzWlMRbFLQS32kBymYPeZOlyNn9W2Eg7B7Atx9d360XFXDGI/4vCHw4eJmwJeaA
 LaKQ3cStDtjvY7aify9yXCi1EMqwsuQPZnofeHDbn3Jqzq1pWolR2Dyt0K8AYqRR977r
 HXikzWknTRakhttEdBjXrmxtfM0WpiW7UeL+2AhxIdjGEcEsh5l5S7lQKeZT9vbM1vbH
 CC3GYgOozjyUCtP1pF39qhCStZyD/v4QEKGugVsEK4FRAg2Ik9weeSgTq6TCrewNU63m qA== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3p6tgsh55r-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 10 Mar 2023 14:58:51 -0800
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7BEB140083;
        Fri, 10 Mar 2023 22:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1678489130; bh=+a350uaHw6gjyVGINwES539usOqDhQPLdzRQTUYPFmQ=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=fkvEO/gVzqfSUkgTC0+xYzq57F4Y9GilDP2Z/M7yYRd1HNdRQGZzP7EMvwvE9n0hB
         UPbZpuznXFsWILOcZbsw9V6ggqOxK8g4IRF6ODwmpTjveVZ4uP8x1H0cooZaWn4Omn
         XDS+91gH7bGwt8FlevJbQdwlGbERIrWPopfbeehWiF/iJ0MiBflqyZFyoPK6yE3SF4
         dWRECNXnw+mptrIBVC57ZoJxhkfWH1y4EkF82kXamwu6NJf6TAdawj9PWtZwEeFxgm
         JtA+qK7SNkwFJdJFwzHkULB59sAPA/5jggpLt3y75cRGIPqc+zT2jwt45XVCzwL8sa
         mzdRUwt9yRMBA==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id DF261A0072;
        Fri, 10 Mar 2023 22:58:49 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id DE1B9800BD;
        Fri, 10 Mar 2023 22:58:48 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="mi1GToxI";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hm92yTUYEkbDjc9NTClPeCDhN2CiWlE4q4+S5JT7iHe4mSxauJoHn38nLwBhi1G/8zgdqcxT0FQDWfgrxDLO1WiGy8y8nG8XBGpLDoswR2fuBoJvLk+oK5rx71/0vt5mIR8x9qcYsCJc75y4xzxdKdk0mcGW6A31IjuqKYkYlr73p4RuO25sEhRMrzdxekopMVIQOjkNCo4fhhhzv4X/B5UHhTzGTC0cAtgI7bcggUd/EKTX3WteraGri3Tt7WvYNOvUxvfPAGJWk63qUjwGhrFPT8gN4VL7u8nHRN4vrwOQFX0+T5TObY5vZMQsCzqRz86X8K/cu12yvrSjEzhNiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+a350uaHw6gjyVGINwES539usOqDhQPLdzRQTUYPFmQ=;
 b=dkBCJt3Qz04fMi5gGMF0KeR4kIjgsEj+W0V92QMaHu6vBKMaiTgD3A5Ol2XmzICO6CVL7mtPOviylT2a4XcwbTVXq3j0BCcyKqfdLnvdE/d2BvuQTNjuvUjSe44CeYrf4c8JvRZ0RdT36lhWAJAEcReovEVi1awC46jQC1oh7dkfu+nx9XlPcwapTdodHDo7Np2gQ1lV6GAsNpI47JaY8P1BC0rEFpIImiW0ZMunBdBRjCig7YD5ABVjKH9U0GdXSG4KukLNZOfYzZexIOFj4rRU7LpNpdHRcPxB9QLACtcoapYQZgxhuBWanymg3udRztnTkGHnBa3I6vsmAmuQAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+a350uaHw6gjyVGINwES539usOqDhQPLdzRQTUYPFmQ=;
 b=mi1GToxIzqYRV3pr31WhPkcJGEz60ZUfv8jbwVrle294iBK2aZysy9tiHs8g7131OJYHTervyjiies0QIONUL0Hlf27mfzJ1b8G4OpQxNqZ2mb2yDyLD5wjGE79I3oV2e/8igGNBuEK1S4XQDhd5SIh1DQ6YYPofQ54EsbDfzE8=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by PH7PR12MB6466.namprd12.prod.outlook.com (2603:10b6:510:1f6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.27; Fri, 10 Mar
 2023 22:58:46 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3161:c44d:8bb3:423f]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3161:c44d:8bb3:423f%3]) with mapi id 15.20.6178.019; Fri, 10 Mar 2023
 22:58:46 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "balbi@kernel.org" <balbi@kernel.org>
Subject: Re: dwc3 gadget and USB3
Thread-Topic: dwc3 gadget and USB3
Thread-Index: AQHZUeDbzC3YzvbOF0edn6Gh7r6tPa7xIiEAgAANS4CAAAy+gIAAKXUAgAE//gCAAAYfAIAAMwIAgAAPLgCAAAUXgIAAz5OAgADhYYA=
Date:   Fri, 10 Mar 2023 22:58:45 +0000
Message-ID: <20230310225843.m4ypslx5x6wsldla@synopsys.com>
References: <ZAjE+p4IoXk/kvXu@kroah.com>
 <d4be672670da6b06456b5a82624e3db0128fdae8.camel@infinera.com>
 <ZAja0So7EDH5FfI0@kroah.com>
 <e31b7802f0b33f66338b009de898526b8eb936f6.camel@infinera.com>
 <14bebac5f1e046c4fcdedc540bcdddc83cdd2b47.camel@infinera.com>
 <4f6fa0c5f077c01c7fb5b15667d061ffa81af8ea.camel@infinera.com>
 <20230309195634.e4r5fjbqtycwt4dq@synopsys.com>
 <08af59771700795133a9522d8ba5dc7272a78142.camel@infinera.com>
 <20230309210907.r5daisahfzyhjl46@synopsys.com>
 <50fc84ff18f33a8d70986c1865c977e638a8563f.camel@infinera.com>
In-Reply-To: <50fc84ff18f33a8d70986c1865c977e638a8563f.camel@infinera.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|PH7PR12MB6466:EE_
x-ms-office365-filtering-correlation-id: 8cd57151-9ab9-47e8-afb9-08db21bb00d5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DLVU8XRN1T4ZmJnkNwNf8ps6DzxEYLMuM8WOFvkGl4UveOm5r63m9vfKXO57tM00yuQ3lhoH3/+q7N/ErYWfYcCBxbxwJ925cLMVL+libVnzuyt4PK+hwF9dsirSP1QRds8BuhGeVsXlA+In8WS2v4HcDPw00vsTigh0kCVYFBggPa3ECtzII+EsUrAkggAq2EvfjRy/N6WEn1Np8GDVSGEQYnuqXBCMNbFq/LCCgIy4hdd4jOJUghgVDz3/E6BWymUzeLk6FBXTTwAoBG5+9Qw8NhDQ1+g5KfbaGDiorsMLg+HKpFBeuGmIeuG68di8mVs06s+ibOF+xD71UuiL4qcWrXjUa9qOkXCu2r8MP9m6NcQNRDPKVbjiJDGhN/DdzMrLCR+rsS9W/euTxWoFBCDAIffnyi9YcuxYIPz58i/kHSu5AobmX8xpKqqR6+4eTWFRMd30InBYsVIScjP1Vr1bLBm0JidJ49GcAJoSY1je9oWVEbUaxBlIADuArI6fpS4NVx/ucOF1sKswHlFlG3K23xN3097w6LhPv+Lk++Jo7d82j/pOiDCsNHVf+UUTt99SNL8L3Wc8Xc3bd3ZCgFM5uxrBW5xH3axRL88Drr1uJHX7ygKqCfLoc7MK15yyNyvKdbJRexgD1KaRYdCh/rZMNAmCM7/757GvpQBjd2pu7WpVDr4gG8tC/XA0dBsaHcc0t69vh5GBc4tNqNaiPw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(376002)(396003)(366004)(39860400002)(346002)(451199018)(478600001)(83380400001)(36756003)(122000001)(316002)(54906003)(38070700005)(38100700002)(71200400001)(66446008)(6916009)(26005)(41300700001)(6512007)(8936002)(2616005)(186003)(6486002)(1076003)(8676002)(64756008)(86362001)(4326008)(5660300002)(6506007)(76116006)(66476007)(66946007)(66556008)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cFJ3UVNYbkFNMnVJbXBpaUhTa2d1bTEwK05WNmZkU1A4VGpvMnJCSy9VdTZL?=
 =?utf-8?B?M2pENlVwRVc2K2x4TW9HeTdiOUJscnpPalM3UGtZSG9OWCt1c0h5dHN6dWRB?=
 =?utf-8?B?V1Z0ci85RnZLK1I4aWpmZUg2WXFJdXhCYWdZNDZidFVmVGlsOGJJbSsrUURK?=
 =?utf-8?B?bUVaQ2haNDZXL3h3d2d6QjB3T3doQ1AyOXFXNUFSdjRTejJiMVkxL1YxTklz?=
 =?utf-8?B?SXQvT0l1VVBYb09nTFlheXUzeFpyWXRDdHlWbWxHcjhicGlGTFh5QnJIV1Fy?=
 =?utf-8?B?VzRlcEhqZVVXL21pUzRnbXNKODZ4YmtWYnQ4ZC9RR2JUd1M5YWdhNkd3L3cv?=
 =?utf-8?B?aGpPNi9BTHVFeDBPZ3NHeUJLMTFUZVVhYVNtRnE3VW1YYldUaDVvSnBGY0J1?=
 =?utf-8?B?anZLcGFHRHd5NWZ6NlJITkZTYzNaOUs0c3JtaWRHdnNnWkdpa0hCSmUrdVov?=
 =?utf-8?B?REMwV2N4YllVRENtaWlxdGI2YlBWSVdGVGFra0hkZHZBK3NiOG11cWxETXRK?=
 =?utf-8?B?NDBRVGcvdXdiYm5LdHVkbEZsMUd0S0tRcUVRV0JvbCtQZlRERVNFVVFjbUdR?=
 =?utf-8?B?Nlg0K1MwVkVNc2FDdTlwTkNrRTFLQXdpWXZBZVVZSXlmSytlMDhZNkFtREo5?=
 =?utf-8?B?eFJ2LzFXS3VNaE95WkF0eE44YitFclB3Z3oyL0plaUdzQ0M0VFArSDhWMTlU?=
 =?utf-8?B?eVdzS0Q0RDVXMzBEc0RSS3hsL1U4WjVHZjFaTGhsS2VzOXdGTnMxZklYdEl2?=
 =?utf-8?B?T25pNnVVb3d2dVYwVThtajQyUDFFcCtjRytVaW4wOE1GaWxqZXBLSk5KRU54?=
 =?utf-8?B?bnoyKzY0Smk5Z2VvV01kem0xRGZvampReE85TWpTcEcwOCtqREJRK00vQmtz?=
 =?utf-8?B?WWhsOW5WZER2WEpaSDU5Z0Q5VXZWa240ckJHeno3cFBuYmwrMW1hSWZMTTFJ?=
 =?utf-8?B?L2tlSTg2WEVqMTNMOUNWeVNiMG9jaUl4VUlZOU9xRW5CNkZjS3RLOGQyUnh5?=
 =?utf-8?B?UjNlalhtcUphTExNQWZuNkxqckdyK3lTNEJIWWdRV0JRaERsNU41ZEgxWDJH?=
 =?utf-8?B?M3hwbGkrZ3dhdXBxRVZ0MFpNbzFyRGF3bkZqT1pobWVlSFVnY1ZaOTJjVHdz?=
 =?utf-8?B?Z0llUnR1cUNQSCtvREVhUFlGY0E4VFZqeit0dEN1ZGhlOFBqN3kveU9tNnNE?=
 =?utf-8?B?dGYvTE5nT0J1UjRQTWFOOFNkWXZ2eTRSaEh0UVBMRXdpRzZqTlc1aytMWFhV?=
 =?utf-8?B?MWltaXQrZzNyb1hxbFJsZC82RXR6bElzRklaY2haSXlzMUNUVWNBaGVQTEpq?=
 =?utf-8?B?KzF5d3F1SGlKb2FCOUtGN3AyTGRmYlJBUFhhc0Q2YzNpaVJ3YW9Yb09JL3dk?=
 =?utf-8?B?K05BbWtqekZGSUpaUEpSOUVXUmQ1SnlVQlJxdEI2c1VqK210R1VCVDVWclh1?=
 =?utf-8?B?SUltSWpxeVladnBkb2tiZGc5MnpIOUF3Q3UvN1pXWklDUnVyZlprYlAwa3Ry?=
 =?utf-8?B?L0E3RHd5MHlqOW9NaXlHckIrbUdvRVlJaXRTM0RMM3Q2V1pHN3JkRXNVbnpk?=
 =?utf-8?B?K2lBRHZRUkVPWkRuMGdSOHdUcXltKzBveWFjTzVmSzNyQ1JjU3ZGRkdEOVpG?=
 =?utf-8?B?eE05VzRYaTllSFgrQ3dJMHRJYjloeWNjQVJ1d2RzKzc2VllNNG1hR2FBWVR4?=
 =?utf-8?B?RHlrTlZpeGltekhBNzc5NWVOY0UxUVZFTWN4eGNlWERWS2I2b0xxRk5CVEow?=
 =?utf-8?B?aXR4U2xEYm1JSHYyWHl1YlIrcmIzMnhVZjh6Y0NYUFFDTVRKWGs2d0tkc2Ro?=
 =?utf-8?B?b3BWd0xMRGdoM0dtT3NzY0w3YmJuSk9GeGFQL0dWQWYrYk5IdFdWb3RSeVFr?=
 =?utf-8?B?QkFYK2x6Q25VdnVUVzY1ZWJRMUR3eFlReHFoNmlUbDhvSEdDL3JhNjRFTjVP?=
 =?utf-8?B?bFFEclZOaHU5bFdWSlBjUEJBSkNVblljRHphbTdiQUtUdWhkY1NjVndRQngv?=
 =?utf-8?B?Y0hDeE9wdVdkU1EzNE83bUg2TGRIUVZWYXhwdGVYbW5nODJiVU9xaGlQLzlQ?=
 =?utf-8?B?V3ZiUWZNcUtra0M2NzFTL0JaK0N1K3ZSa0Qyd05qVE51S2Q3c3F2QlhtYVhi?=
 =?utf-8?B?T05rcU5EMllvK1l5em8xYTA0YVlYQmxkejgreW1vczJTVXpiYldIdkRzN3Jv?=
 =?utf-8?B?S1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <64FE0219A66EB047A84273A91BFC0662@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: EGb4rO5BRC2FsC7GwXOvX0UvR1VmAbqcVsizfXOf6nUS40fFbXc0O7w6KpAY08xkunI+D8BpFLPDHlB9vnXxHnMMYzKaxoJdQS2hjmUueUK4Y15qgMKiugpXt4Qx9VN2Un4tEcVd2YnSPrz1l6ghc1PxzQ5LRnHeanZjhCA2Krx9Q2amd4U/r7DyVqYq7N6Klo63RN8bLWpkwPFISswkpr/yQaHcSAiO47dZZoTpa794aRc0ea9MEDpp2TbnUbRaODkrJFN9yy6A8bITW/taAg6LP7BtyXzadwzGE5eFepou4S6pAbG2cJIaKI6IK2b4PjHcJetX+A0FmNTxCdskC9aRnCYmYuenjMnX73XAxYC0wuX9o6tNRYBMrdJz6D+SHQyKqcH14E/hJWt59rujgxmq3hgMf0LZIh9m0oln2NaYXLy+pvLvsn3rvIQWq84WfKuM5FUHbIFIFEbRk+iB/pXHSPffOoDauBftBbtXxXx80v9cNI8Rtge5J1bo49cTLb1UicjQgCK/yWfYnQlicKUZYvUqEPGQjDDU7k7mq8sR2S83zX5BMth6f1lMLn1Tl+/KbxYlzMwSdJRUt4StlqbWoPmh+kQyD79yX8aBYzTDW8jF6RCHGxFedb7+PQ59mr69AIQmhB41Lj+qu5IMLMciXVjXIbBKJ33i4L91NWM5BCqbAWWIHTJxJnVxQrVTAUd8Yndd7idrXnH+FtsBXOXnptaJ+AQLTydO1n5qSe33q+jAnqVyQXwH6SEhMsFo/rv7vVN6CaRjAkOSU/pE6BvxZJGNWwQi5LNoeF1HwymlCvNJGOBRcOpcBvTmAQndAoC6rQZGRPFsSgsofocB/XoIT3nM9fb49/YTkl12PXfdcykK/KFoqr1J5EAwyLV51IryZqY7uBdonxIZ121Dk4sgEcwwaqZOJRzpZ5aBov4=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cd57151-9ab9-47e8-afb9-08db21bb00d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2023 22:58:45.9037
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zTz3LtWmgkTDDCM90UvP7XbHliNfOs9Q+F/PoSN0Zhj7YBLYWoc8eqMW7gb37W9y9m+jA0C2ijTy50Nk0f08Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6466
X-Proofpoint-ORIG-GUID: 56PvHszauPW4M3UPz004OYBUqEdtEY38
X-Proofpoint-GUID: 56PvHszauPW4M3UPz004OYBUqEdtEY38
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-10_10,2023-03-10_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 mlxscore=0 spamscore=0
 mlxlogscore=884 bulkscore=0 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303100183
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gRnJpLCBNYXIgMTAsIDIwMjMsIEpvYWtpbSBUamVybmx1bmQgd3JvdGU6DQo+IE9uIFRodSwg
MjAyMy0wMy0wOSBhdCAyMTowOSArMDAwMCwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+IE9uIFRo
dSwgTWFyIDA5LCAyMDIzLCBKb2FraW0gVGplcm5sdW5kIHdyb3RlOg0KPiA+ID4gT24gVGh1LCAy
MDIzLTAzLTA5IGF0IDE5OjU2ICswMDAwLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4gPiA+IE9u
IFRodSwgTWFyIDA5LCAyMDIzLCBKb2FraW0gVGplcm5sdW5kIHdyb3RlOg0KPiA+ID4gPiA+IE9u
IFRodSwgMjAyMy0wMy0wOSBhdCAxNzozMiArMDEwMCwgSm9ha2ltIFRqZXJubHVuZCB3cm90ZToN
Cj4gPiA+ID4gPiA+IE9uIFdlZCwgMjAyMy0wMy0wOCBhdCAyMjoyNiArMDEwMCwgSm9ha2ltIFRq
ZXJubHVuZCB3cm90ZToNCj4gPiA+ID4gPiA+ID4gT24gV2VkLCAyMDIzLTAzLTA4IGF0IDE5OjU4
ICswMTAwLCBncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZyB3cm90ZToNCj4gPiA+ID4gPiA+ID4g
PiBPbiBXZWQsIE1hciAwOCwgMjAyMyBhdCAwNjoxMjo1MVBNICswMDAwLCBKb2FraW0gVGplcm5s
dW5kIHdyb3RlOg0KPiA+ID4gPiA+ID4gPiA+ID4gT24gV2VkLCAyMDIzLTAzLTA4IGF0IDE4OjI1
ICswMTAwLCBHcmVnIEtIIHdyb3RlOg0KPiA+ID4gPiA+ID4gPiA+ID4gPiBPbiBXZWQsIE1hciAw
OCwgMjAyMyBhdCAwNToxMDoxN1BNICswMDAwLCBKb2FraW0gVGplcm5sdW5kIHdyb3RlOg0KPiA+
ID4gPiA+ID4gPiA+ID4gPiA+IHdlIGFyZSB1c2luZyBmc2wtbHMxMDQzYS1yZGIgYmFzZWQgZGVz
aWduIGJ1dCB3aXRoIGEgbHMxMDIzYSBTT0MgYW5kDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gdXNl
IFVTQjAgaW4gZ2FkZ2V0IG1vZGUgcnVubmluZyBlaXRoZXIgTkNNIG9yIFJORElTIGV0aGVybmV0
IG9uIHRvcC4NCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiBX
aGVuIHdlIGNvbm5lY3QgdGhlIGdhZGdldCB0byBhIFBDKExpbnV4IG9mIFdpbmRvd3MpIG92ZXIg
YW4gVVNCMiBodWIsDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gbmV0d29ya2luZyhOQ00gb3IgUk5E
SVMpIHdvcmtzIHdlbGwuDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+ID4g
PiA+ID4gSG93ZXZlciwgd2hlbiB3ZSBjb25uZWN0IHRoZSBnYWRnZXQgZGlyZWN0bHkgdG8gdGhl
IFBDL2xhcHRvcCB3aGljaCB1c2VzIFVTQjMNCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiB3ZSBzZWUg
c29tZXRoaW5nIG9kZDoNCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiAgIFBpbmcgZnJvbSBQQyB0byBn
YWRnZXQgd29ya3MuDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gICBQaW5nIGZyb20gZ2FkZ2V0IHRv
IGxhcHRvcCBkb2VzIG5vdC4gSG93ZXZlciBpZiB3ZSBhbHNvIHBpbmcgZnJvbSBQQyBhdCB0aGUg
c2FtZSB0aW1lIHdlDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gICBzZWUgZ2FkZ2V0IHRvIFBDIHN0
YXJ0IHdvcmtpbmcuDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gU2VlbXMgbGlrZSBwaW5nIGZyb20g
dGhlIFBDIHRpZ2dlcnMgdGhlIGdhZGdldCB0byBzZWUgaW5jb21pbmcgcGtncyBzb21laG93Lg0K
PiA+ID4gPiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+IEFueSBpZGVhIHdo
YXQgbWlnaHQgYmUgd3Jvbmcgb3IgaG93IHRvIGRlYnVnIHRoaXM/DQo+ID4gPiA+ID4gPiA+ID4g
PiA+ID4gS2VybmVsIDUuMTUuODcNCj4gPiA+ID4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+
ID4gPiA+IDUuMTUueSBpcyB2ZXJ5IG9sZCwgZG9lcyB0aGlzIGFsc28gaGFwcGVuIG9uIDYuMj8N
Cj4gPiA+ID4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4g
PiA+IEkganVzdCB0cmllZCA2LjEuMTUgYW5kIHRoZSBwcm9ibGVtIHJlbWFpbnMsIEkgaG9wZSB0
aGF0IGlzIGNsb3NlIGVub3VnaCA/DQo+ID4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+ID4g
SXQncyBnb29kIGVub3VnaCA6KQ0KPiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+IEhh
dmUgYW55IGxvZ3MgYXQgYWxsIHRoYXQgc2hvdyBhbnkgcHJvYmxlbXM/DQo+ID4gPiA+ID4gPiA+
ID4gDQo+ID4gPiA+ID4gPiA+IE5vLCBkb24ndCBrbm93IHdoZXJlIHRvIHN0YXJ0LiBUaGVyZSBh
cmUgbm8gZXJyb3JzIGxvZ2dlZC4NCj4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+ID4gICBB
bHNvLCB5b3UgbWlnaHQgd2FudCB0bw0KPiA+ID4gPiA+ID4gPiA+ICBjYzogIHRoZSBkd2MzIG1h
aW50YWluZXIuLi4NCj4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+IEkgdGhvdWdodCBJIGRp
ZCBidXQgdGhhdCBsb29rIGxpa2Ugb2xkIGluZm8sIGFkZGVkIFRoaW5oIE5ndXllbiBub3csIHRo
YW5rcw0KPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gIEpvY2tlDQo+ID4gPiA+ID4gPiA+
IA0KPiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+ICB0aGFua3MsDQo+ID4gPiA+ID4g
PiA+ID4gDQo+ID4gPiA+ID4gPiA+ID4gIGdyZWcgay1oag0KPiA+ID4gPiA+ID4gPiANCj4gPiA+
ID4gPiA+IA0KPiA+ID4gPiA+ID4gRm91bmQgYW5kIFVTQkMgRG9jayBhbmQgY29ubmVjdGVkIHRo
YXQgYmV0d2VlbiBnYWRnZXQgYW4gUEMgYW5kIHRoaXMgYWxzbyB3b3JrcyB3ZWxsLg0KPiA+ID4g
PiA+ID4gU2VlbXMgbGlrZSBhIGh1YiwgcmVnYXJkbGVzcyBvZiBVU0IyL1VTQjMsIG1ha2UgdGhl
IHVzYiBuZXR3b3JrIGZ1bmN0aW9uIGluIGJvdGggZGlyZWN0aW9ucy4NCj4gPiA+ID4gPiA+IA0K
PiA+ID4gPiA+ID4gRm91bmQgb3V0IHNvbWV0aGluZyBpbnRlcmVzdGluZywgb24gUEM6DQo+ID4g
PiA+ID4gPiBjZCAvc3lzL2RldmljZXMvcGNpMDAwMDowMC8wMDAwOjAwOjE0LjAvdXNiMS8xLTEv
cG93ZXIgICMgV2hlcmUgbXkgZ2FkZ2V0IGlzIGNvbm5lY3RlZA0KPiA+ID4gPiA+ID4gZWNobyAw
ID4gdXNiMl9oYXJkd2FyZV9scG0NCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gTm93IHBpbmcg
d29ya3Mgbm9ybWFsbHkuDQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+IFNvIExQTSBkb2VzIG5v
dCBzZWVtIHRvIHdvcmsgcHJvcGVybHkgb24gZ2FkZ2V0LiBDYW4gSSBkaXNhYmxlIExQTSBzb21l
aG93DQo+ID4gPiA+ID4gPiBvbiBnYWRnZXQgc2lkZT8gDQo+ID4gPiA+ID4gPiANCj4gPiA+ID4g
DQo+ID4gPiA+IFRoZXJlJ3Mgbm8gb3B0aW9uIGluIGdhZGdldCBjb25maWdmcyB0byBhbGxvdyB5
b3UgdG8gZG8gdGhhdCBhdCB0aGUNCj4gPiA+ID4gbW9tZW50LiBZb3UgY2FuIGRpc2FibGUgTFBN
IGluIGR3YzMgY29udHJvbGxlciBpbiB0aGUgZGV2aWNldHJlZSB3aXRoDQo+ID4gPiA+ICJzbnBz
LGRpc19lbmJsc2xwbV9xdWlyayIgaW5zdGVhZC4NCj4gPiA+IA0KPiA+ID4gWWVzLCBJIGZvdW5k
IHRoYXQuIFRoYW5rcy4NCj4gPiANCj4gPiBBbHNvIG5vdGUgdGhhdCBMUE0gaXMgZm9yIGRldmlj
ZSBvcGVyYXRpbmcgaW4gdXNiMiBzcGVlZC4gSWYgaXQncyB1c2IzDQo+ID4gc3BlZWRzLCB0aGVu
IHlvdSBuZWVkIHRvIGRpc2FibGUgVTMgc3VzcGVuZC4NCg0KQWN0dWFsbHksIHlvdSBjYW4ndCBk
aXNhYmxlIFUzLiBUaGUgZGV2aWNlIGhhcyB0byBvYmV5IHRoZSBob3N0IGlmIGl0DQpyZXF1ZXN0
cyBmb3IgVTMgZW50cnkuDQoNCj4gDQo+IEFUTSBJIGhhdmU6DQo+IAlzbnBzLGRpc19lbmJsc2xw
bV9xdWlyazsNCj4gCXNucHMsZGlzX3UyX3N1c3BoeV9xdWlyazsNCj4gCXNucHMsZGlzX3UzX3N1
c3BoeV9xdWlyazsNCj4gCXNucHMsdXNiMi1nYWRnZXQtbHBtLWRpc2FibGU7DQo+IA0KPiBUaGF0
IGZpeGVzIGl0LCBJIGhhdmUgbm8gbmVlZCBmb3IgYW55IExQTS9zdXNwZW5kDQoNCk5vdGUgdGhh
dCBhZGRpbmcgdGhlc2UgMiB3b24ndCBoZWxwIGlmIHRoZSBob3N0IHNlbmQgVTMgcmVxdWVzdC4N
CglzbnBzLGRpc191Ml9zdXNwaHlfcXVpcms7DQoJc25wcyxkaXNfdTNfc3VzcGh5X3F1aXJrOw0K
DQpUaGF0J3MganVzdCBkaXNhYmxpbmcgdGhlIHBoeSBmcm9tIGdvaW5nIGludG8gbG93ZXIgcG93
ZXIgc3RhdGUuIFlvdQ0KbmVlZCB0byBwcmV2ZW50IHRoZSBob3N0IGZyb20gYXV0b3N1c3BlbmRp
bmcgYW5kIHB1dCB0aGUgZGV2aWNlIGluIFUzLg0KDQpGb3IgdXNiMiBzcGVlZCwgeW91IG9ubHkg
bmVlZCAic25wcyx1c2IyLWdhZGdldC1scG0tZGlzYWJsZSIuDQoNCg0KPiANCj4gPiANCj4gPiA+
IA0KPiA+ID4gPiANCj4gPiA+ID4gSWYgdGhlIGhvc3QgcHV0cyB0aGUgZ2FkZ2V0IGluIHN1c3Bl
bmQsIHRoZSBnYWRnZXQgd29uJ3QgYmUgYWJsZSB0bw0KPiA+ID4gPiBjb21tdW5pY2F0ZSB3aXRo
IHRoZSBob3N0IHVudGlsIHRoZSBob3N0IHdha2VzIHRoZSBnYWRnZXQgdXAgYW5kIHN0YXJ0cw0K
PiA+ID4gPiB0YWxraW5nIHRvIHRoZSBnYWRnZXQgYWdhaW4uIFRoZSBnYWRnZXQgbWF5IGJlIGFi
bGUgdG8gc2lnbmFsIHRoZSBob3N0DQo+ID4gPiA+IHRvIHdha2V1cCB2aWEgcmVtb3RlIHdha2V1
cC4gRGlkIHlvdSBjaGVjayBpZiB0aGUgZGV2aWNlIGlzIGluIHN1c3BlbmQ/DQo+ID4gPiA+IElm
IGl0J3MgaW4gc3VzcGVuZCwgaXMgdGhlIGdhZGdldCBlbmFibGVkIHdpdGggcmVtb3RlIHdha2V1
cD8gRGlkIHRoZQ0KPiA+ID4gPiBOQ00gZHJpdmVyIHNlbnQgYSByZW1vdGUgd2FrZXVwIHNpZ25h
bCB0byB0aGUgaG9zdD8gSSBkaWRuJ3QgdmVyaWZ5LCBidXQNCj4gPiA+ID4gSSBzdXNwZWN0IHRo
ZSBOQ00gZ2FkZ2V0IGRyaXZlciBpc24ndCBjb25maWd1cmVkL2ltcGxlbWVudGVkIHdpdGggcmVt
b3RlDQo+ID4gPiA+IHdha2V1cC4NCj4gPiA+IA0KPiA+ID4gVGhlbiBtYXliZSBOQ00vUk5ESVMg
c2hvdWxkIGluZm9ybS9kaXNhYmxlIExQTSBpbiB0aGUgZGV2aWNlIGRyaXZlcj8NCj4gPiA+IE9u
ZSBjYW5ub3QgaGF2ZSBoYWxmIGFuIGltcGwuIG9mIHRoaXMgZmVhdHVyZS4NCj4gPiANCj4gPiBN
b3N0IGRyaXZlcnMgZG9uJ3QgZnVsbHkgc3VwcG9ydCBldmVyeSBmZWF0dXJlLiBUaGV5IGFyZSBp
bXBsZW1lbnRlZCBhcw0KPiA+IG5lZWRlZC4gSSdtIG5vdCBmYW1pbGlhciB3aXRoIE5DTS9STkRJ
UyBkcml2ZXIuIFBlcmhhcHMgeW91IGNhbiBwaW5nIGl0cw0KPiA+IG1haW50YWluZXIgdG8gc2Vl
IGl0cyBjdXJyZW50IHN0YXR1cyB0byBzZWUgaWYgaXQgbmVlZHMgdG8gYmUgdXBkYXRlZC4NCj4g
PiBVbmxlc3MgdGhlcmUncyBhIHF1aXJrIGZyb20gdGhlIGhvc3QvZGV2aWNlLCB3ZSBzaG91bGRu
J3QgaGF2ZSB0bw0KPiA+IGRpc2FibGUgTFBNLg0KPiA+IA0KPiBSaWdodCBidXQgaXNuJ3QgTFBN
IHNvbWV0aGluZyBlbHNlPyBPbmUgY2FuIHJlYWQgaW4gRG9jdW1lbnRhdGlvbi9BQkkvdGVzdGlu
Zy9zeXNmcy1idXMtdXNiOg0KPiBXaGF0OgkJL3N5cy9idXMvdXNiL2RldmljZXMvLi4uL3Bvd2Vy
L3VzYjJfaGFyZHdhcmVfbHBtDQo+IERhdGU6CQlTZXB0ZW1iZXIgMjAxMQ0KPiBDb250YWN0OglB
bmRpcnkgWHUgPGFuZGlyeS54dUBhbWQuY29tPg0KPiBEZXNjcmlwdGlvbjoNCj4gCQlJZiBDT05G
SUdfUE0gaXMgc2V0IGFuZCBhIFVTQiAyLjAgbHBtLWNhcGFibGUgZGV2aWNlIGlzIHBsdWdnZWQN
Cj4gCQlpbiB0byBhIHhIQ0kgaG9zdCB3aGljaCBzdXBwb3J0IGxpbmsgUE0sIGl0IHdpbGwgcGVy
Zm9ybSBhIExQTQ0KPiAJCXRlc3Q7IGlmIHRoZSB0ZXN0IGlzIHBhc3NlZCBhbmQgaG9zdCBzdXBw
b3J0cyBVU0IyIGhhcmR3YXJlIExQTQ0KPiAJCSh4SENJIDEuMCBmZWF0dXJlKSwgVVNCMiBoYXJk
d2FyZSBMUE0gd2lsbCBiZSBlbmFibGVkIGZvciB0aGUNCj4gCQlkZXZpY2UgYW5kIHRoZSBVU0Ig
ZGV2aWNlIGRpcmVjdG9yeSB3aWxsIGNvbnRhaW4gYSBmaWxlIG5hbWVkDQo+IAkJcG93ZXIvdXNi
Ml9oYXJkd2FyZV9scG0uICBUaGUgZmlsZSBob2xkcyBhIHN0cmluZyB2YWx1ZSAoZW5hYmxlDQo+
IAkJb3IgZGlzYWJsZSkgaW5kaWNhdGluZyB3aGV0aGVyIG9yIG5vdCBVU0IyIGhhcmR3YXJlIExQ
TSBpcw0KPiAJCWVuYWJsZWQgZm9yIHRoZSBkZXZpY2UuIERldmVsb3BlciBjYW4gd3JpdGUgeS9Z
LzEgb3Igbi9OLzAgdG8NCj4gCQl0aGUgZmlsZSB0byBlbmFibGUvZGlzYWJsZSB0aGUgZmVhdHVy
ZS4NCj4gDQo+IFdoYXQ6CQkvc3lzL2J1cy91c2IvZGV2aWNlcy8uLi4vcG93ZXIvdXNiM19oYXJk
d2FyZV9scG1fdTENCj4gCQkvc3lzL2J1cy91c2IvZGV2aWNlcy8uLi4vcG93ZXIvdXNiM19oYXJk
d2FyZV9scG1fdTINCj4gRGF0ZToJCU5vdmVtYmVyIDIwMTUNCj4gQ29udGFjdDoJS2V2aW4gU3Ry
YXNzZXIgPGtldmluLnN0cmFzc2VyQGxpbnV4LmludGVsLmNvbT4NCj4gCQlMdSBCYW9sdSA8YmFv
bHUubHVAbGludXguaW50ZWwuY29tPg0KPiBEZXNjcmlwdGlvbjoNCj4gCQlJZiBDT05GSUdfUE0g
aXMgc2V0IGFuZCBhIFVTQiAzLjAgbHBtLWNhcGFibGUgZGV2aWNlIGlzIHBsdWdnZWQNCj4gCQlp
biB0byBhIHhIQ0kgaG9zdCB3aGljaCBzdXBwb3J0cyBsaW5rIFBNLCBpdCB3aWxsIGNoZWNrIGlm
IFUxDQo+IAkJYW5kIFUyIGV4aXQgbGF0ZW5jaWVzIGhhdmUgYmVlbiBzZXQgaW4gdGhlIEJPUyBk
ZXNjcmlwdG9yOyBpZg0KPiAJCXRoZSBjaGVjayBpcyBwYXNzZWQgYW5kIHRoZSBob3N0IHN1cHBv
cnRzIFVTQjMgaGFyZHdhcmUgTFBNLA0KPiAJCVVTQjMgaGFyZHdhcmUgTFBNIHdpbGwgYmUgZW5h
YmxlZCBmb3IgdGhlIGRldmljZSBhbmQgdGhlIFVTQg0KPiAJCWRldmljZSBkaXJlY3Rvcnkgd2ls
bCBjb250YWluIHR3byBmaWxlcyBuYW1lZA0KPiAJCXBvd2VyL3VzYjNfaGFyZHdhcmVfbHBtX3Ux
IGFuZCBwb3dlci91c2IzX2hhcmR3YXJlX2xwbV91Mi4gVGhlc2UNCj4gCQlmaWxlcyBob2xkIGEg
c3RyaW5nIHZhbHVlIChlbmFibGUgb3IgZGlzYWJsZSkgaW5kaWNhdGluZyB3aGV0aGVyDQo+IAkJ
b3Igbm90IFVTQjMgaGFyZHdhcmUgTFBNIFUxIG9yIFUyIGlzIGVuYWJsZWQgZm9yIHRoZSBkZXZp
Y2UuDQo+IA0KPiBUaGlzIHNlZW1zIHRvIGluZGljYXRlIHRoYXQgTFBNIGlzIG9uIGRldmljZSBk
cml2ZXIvY29udHJvbGxlciBsZXZlbCByYXRoZXIgdGhhbg0KPiBvbiBoaWdoZXIgbGV2ZWxzIGxp
a2UgUk5ESVMvTkNNID8NCg0KVGhlIGNvbnRyb2xsZXIgd2lsbCBoYW5kbGUgdGhlIExQTS4gSG93
ZXZlciwgdGhlIFVEQyBkcml2ZXIgd2lsbCBhIGdldA0Kbm90aWZpY2F0aW9uIGZyb20gdGhlIGNv
bnRyb2xsZXIgaWYgaXQgZ29lcyBpbiB0byBzdXNwZW5kIChMMikuIEl0IHdpbGwNCmluIHR1cm4g
aW52b2tlIHRoZSBzdXNwZW5kL3Jlc3VtZSBnYWRnZXQgZHJpdmVyJ3MgY2FsbGJhY2sgZnJvbSB0
aGUNClJORElTL05DTSBkcml2ZXIncyBvcHMuIFNvLCB0aGUgUk5ESVMvTkNNIGNhbiBrZWVwIHRy
YWNrIG9mIHdoZXRoZXIgdGhlDQpnYWRnZXQgaXMgaW4gc3VzcGVuZCB0byBpbml0aWF0ZSByZW1v
dGUgd2FrZXVwLg0KDQo+IA0KPiANCj4gV2hpbGUgSSByZW1lbWJlciwgSSB0cmllZCB0byBjcmVh
dGUgYm90aCBhIE5DTSBhbmQgYSB0dHlBQ00gb24gdG9wIG9mIG15IGR3YzMgZ2FkZ2V0DQo+IGJ1
dCB0aGVuIEkgZ290IHNvbSBiaW5kIGVycm9yIHdoZW4gYWN0aXZhdGluZyB0aGUgVURDLiBJcyB0
aGF0IGV4cGVjdGVkID8NCj4gSSBmaWd1cmVkIGJvdGggY291bGQgbGl2ZSBvbiB0aGUgc2FtZSBk
ZXZpY2UgYW5kIHdvdWxkIGp1c3QgbXV4IHRoZSB0d28gcHJvdG9jb2xzLg0KPiANCg0KSSdtIG5v
dCBjbGVhciB3aGF0IHlvdSBtZWFudCBoZXJlLiBUaGUgZ2FkZ2V0IGRyaXZlciBhbmQgdGhlIFVE
QyBkcml2ZXINCnNob3VsZCBiZSBzZXBhcmF0ZWQgYW5kIGFic3RyYWN0ZWQgZnJvbSBlYWNoIG90
aGVyLg0KDQpBbHNvLCBwbGVhc2Ugbm90ZSB0aGF0IGFsbCB0aGlzIHRhbGtpbmcgcG9pbnRzIGFy
ZSBiYXNlZCBvbiB0aGUNCmFzc3VtcHRpb24gdGhhdCB0aGUgaXNzdWUgaXMgZHVlIHRvIHRoZSBo
b3N0IHB1dHRpbmcgdGhlIGRldmljZSBpbg0Kc3VzcGVuZCBiYXNlIG9uIHlvdXIgZXhwZXJpbWVu
dC4gV2UgZGlkbid0IHJldmlldyB0aGUgbG9ncy4NCg0KSU1PLCB0aGUgYmVzdCBvcHRpb24gc2hv
dWxkIGJlIHRvIHByZXZlbnQgc3VzcGVuZCBmcm9tIHRoZSBob3N0IHNpZGUgYXMNCml0IGxvb2tz
IGxpa2UgeW91ciBkZXZpY2UgbWF5IG9wZXJhdGUgaW4gdXNiMyBzcGVlZCBhbHNvPw0KDQpCUiwN
ClRoaW5o
