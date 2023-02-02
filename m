Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 693E16887F6
	for <lists+linux-usb@lfdr.de>; Thu,  2 Feb 2023 21:02:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230502AbjBBUCW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Feb 2023 15:02:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231866AbjBBUCU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Feb 2023 15:02:20 -0500
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47B987B437
        for <linux-usb@vger.kernel.org>; Thu,  2 Feb 2023 12:02:19 -0800 (PST)
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 312HoWDo010120;
        Thu, 2 Feb 2023 12:02:05 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=TNrrxS1y9oadqfmb0MWc9xv5pgnqWd5dGhL8wUfekrI=;
 b=c2r2EYvblXWtoAtdSevoH4rJwF1Hz5qQ1OWwv1L0uIMWtqvqYoYJd+toRsw7zFob0su1
 b/fytIdtprnUDVFRimi0Uih/vtC+ndQpPW40l8kKzW8Tngb3AICQ1MPwMNJt/rAK2iXT
 /Sx8F4uQMP89nWBpiKRU/yHKxa+YfkeOmXUvBe3MuyTqgIxzMxaGOHSri6AwEBPZaHji
 DcLxRVNn+tNUetFMbyFxnZ8IMwYgN81mTpbYG1tIHbkE1WNDOqZBHuV+wB0dVfe2xKbc
 GRdPZK83h2kIpsJHWdb6wC1DBf+YELaqGIoekrpkFGmpEwu+quohPDZ8MAx61h3JgTpz NQ== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3nfp8kgjes-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 02 Feb 2023 12:02:04 -0800
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id CB6C8C0ADB;
        Thu,  2 Feb 2023 20:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1675368124; bh=TNrrxS1y9oadqfmb0MWc9xv5pgnqWd5dGhL8wUfekrI=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=fwE1sSz1me1mobqDJCIcQl4cryEqXq5Blxj2wOYuV97H079vhS0R6dFNU8MBX0Cn1
         ixmHQaHiM/KN21cUaXUXJfsXbLmcD5BSrBC9EuSN3TZPML5VdYRPvb4xBJbZDe2y95
         dvSWQlh4DJPKYoaZvMH3alxBzSbhCRmxqKh7Nru00sIQxP1eAkyaW+rDPI3h3/1I6C
         Dysq84H2OWljHPsp+qEbwrUDi7hspgt8cRCQaAC1hw8er7Lyg5b6JX7rqraOeidb+f
         FLrMRycn8TmvmHFnZwYoo18Hg2H05NR77OEHYJWo+xt+I7c7tGi9wruPz3Gc3zmz5A
         +b74VDoxAWgxw==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id D33D6A006D;
        Thu,  2 Feb 2023 20:02:02 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2105.outbound.protection.outlook.com [104.47.58.105])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id CFA9C800C4;
        Thu,  2 Feb 2023 20:02:01 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="uqrq7Mub";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RMQ6ioAHT7X/YRqL8V124E2kt4Qk0ZhD1/W7r4riIfN5/wr7+8MKZurVT8cS401V0ikLSGMoGvylCmMEdu/28LFf8eloNse7oJlqTVIYKmkygO2JVUhxa3BtYQJoc0BSJEy3Oce4UPjH8K2e4fiTuSPoZtwQsPlTovrOa9KBCUZhHcR37QaxdcZUnCg3yqHr9YbEqBzI1Q30oHz0CvGK7Mo+pt/b3hPyeGUBLirZbaeEOGZjOvqHNQT9Xxa9KENuKNg3I/pB9siUquEZ6dR+fXB2FM4feZ2LbwrQmfJC3XTs7t5UR7+1JEKW3DSYKmVbbbpc9rhKq8cvRpeenjcT7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TNrrxS1y9oadqfmb0MWc9xv5pgnqWd5dGhL8wUfekrI=;
 b=IlqAdNDRBi3JhMEyQjWEfL0u2zmKPiopDahDbiQszwOLf3aIqWS5hoDOJlseMNyV4QiR5IxpO2BbHhE2oPa1TMBiYH41nD2waq3uy99LUspZARWV/NijK5XFvgbYwa9awjSXFhFx61Lmj9YpAu/eUHDOVHDM4f22/NSp0Utt6UjqkyZ8Ibl5VEFRZvVckg1fCJRKVg6R236u4xe1HeY6T4vdH9hpsXbSYwfuuA0RxKva0NkALSA34aapWRaSPEob68xIn/GGvC+Pdiq2FVvVZ+eK9ksGIEGN5/GiYRVfhNbt70FhA3NoFAT1p9aC1R7E2J5zCRePnqOC+LxyZD7U6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TNrrxS1y9oadqfmb0MWc9xv5pgnqWd5dGhL8wUfekrI=;
 b=uqrq7MubSPROvKguK9tjao/rGzwTJUTfiyFoJcgxmzVLKmAdf4HtWJsLX/gqDNqJ+8IxcBxFJNkCHrB5PN+1VKQanU97n294NNWTZFRI2LBSYsK4Aa5FrNe6rqjR6SXcX9HM15e2MfC1x+2VTwzcdKcWNy7bOo+iKl840NmpW6s=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by SA3PR12MB7808.namprd12.prod.outlook.com (2603:10b6:806:31b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Thu, 2 Feb
 2023 20:01:58 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::6f3c:bd8e:8461:c28c]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::6f3c:bd8e:8461:c28c%7]) with mapi id 15.20.6043.038; Thu, 2 Feb 2023
 20:01:58 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Dan Scally <dan.scally@ideasonboard.com>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "rogerq@kernel.org" <rogerq@kernel.org>
Subject: Re: Explicit status phase for DWC3
Thread-Topic: Explicit status phase for DWC3
Thread-Index: AQHZL//6d6BOk0ADk0qR28S95Y3SOq6v1++AgACqcgCAAJc0gIAAENSAgAA5XgCAChoCgIAApJqA
Date:   Thu, 2 Feb 2023 20:01:58 +0000
Message-ID: <20230202200153.32s5jovndhj2t5fz@synopsys.com>
References: <9ce226b4-90c6-94c4-a5ad-bd623409bc51@ideasonboard.com>
 <20230126002017.tbxc3j6xdgplncfs@synopsys.com>
 <dda24f8e-8d74-c6c1-ae7c-e423bc50a143@ideasonboard.com>
 <20230126193131.ifaj7arsrrgesjh5@synopsys.com>
 <Y9LjMcO/7/VUNld3@rowland.harvard.edu>
 <20230126235704.62d32y7y4sa4mmry@synopsys.com>
 <43b077ad-c8cd-bb49-134d-1bd66bed0b84@ideasonboard.com>
In-Reply-To: <43b077ad-c8cd-bb49-134d-1bd66bed0b84@ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|SA3PR12MB7808:EE_
x-ms-office365-filtering-correlation-id: db107b16-b099-4355-d80b-08db0558574a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lGhakG+ql6XH7MpeOSKeavaI9XF+dvLZaF8DOIiDLQdup4VJoeyYEnRYxkUWmdVOCo2BDVqrlE/1haLNL6QgRvsYTzIEOEheYY9ytNjzowOCCXpPiAKqYC9+8ra4UutQHQP/KjL5nG+GeFYJj3hkJ7hFlhPKbDUje1sy1VqGztDEAAaQ1wCF7LLWbPpl62pNiQJhwFK/ya70kabUtvns8iNBo4mQ6ovSorV6IH55wHM2OS3O7a3pD4pwHJ8AcfH9roydWSuO0LLKlp9L2uAZsBpoLp6+xrXn9UXXwVvCtt2m/2qDAMHuK3YOGin9htWDk3UNs3v1JdyORutC4WZO37/KNGF9MaMKO7GCYYw5mI+0sLKpoS6M9ZDzhvaAMnMlglaJUFIjDbfeZgEFX11E71OL35Ew2IX80syBg4C0K+fsUz2OKUMNrozQ5ebp3dBhxwH0xOzc+Z2uNuItA4QJh/EHTXWpO02unoArVuFlP/Of1ZTiFwLNx8PB7Cc/kdB19gcj9GmYzGUsLAdUqpgsDp0m3rl7XndpauIrG82lLWL/PG083cGoyYVoBDMuNAvxdrxDzkpE6LV+ER41A83z0HqtSScKzwq21UK7pVCFg0bHyUdCSNFhcoaKrZ6axhvGYQsi0eHKFErnzzo+Q6P9OS4jVAZEcJbSJVY/2PBLruIRQKIkGHrMMGrSMPsD7+sktNQesUOxoG0X4qvINMZRilb+nrVRIyEUi4daysQ/eaY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(346002)(136003)(39860400002)(376002)(396003)(451199018)(64756008)(66446008)(41300700001)(8676002)(83380400001)(6916009)(4326008)(76116006)(66476007)(66946007)(66556008)(316002)(8936002)(36756003)(186003)(6512007)(2906002)(5660300002)(478600001)(54906003)(71200400001)(53546011)(38100700002)(6506007)(1076003)(122000001)(26005)(6486002)(966005)(86362001)(38070700005)(2616005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RXluSTJnSlNsUDhvZHhhRWo5OVhNTjJ5eFhzVmFDeXM2Z2E0d1o0ZHlJNGdV?=
 =?utf-8?B?K0R1Qk95d1V5cnVlZkduQ2JWUkNZWUN2TVlzcjQxdS8rWjV3RHhXb1V6T3pR?=
 =?utf-8?B?WkNuaGlWYXJtcXFiOWh6NFBVVDNTRmpyNnNHYkN3YWN6VEE4Y2dPNThkUVIw?=
 =?utf-8?B?MlRnaFVRSFFHUGR1ODBHdXhEMUh6WWFwZnFOL0VPT3hCY0JTelJkQmRFVm9R?=
 =?utf-8?B?R0R4SFZRb3RiRlVudU5JKzVYSTR6UkhIVk45SlQ4K204Sm8yem1EcVM0NTdB?=
 =?utf-8?B?VTJrVjhtN29mZjlYd2tob0NjK2RTQ3VZWDl5NDNmcVBxdjd1VnBwL0QvNzAx?=
 =?utf-8?B?VkhoNWl1Q2hpbXpJYUhzL1ZYSlY3WDlHc3pxL3pjVmRPbTBBT0R5Q21RWXBU?=
 =?utf-8?B?ZGh1N2M4QXkwTzBpQWUyc3FxV0RpcXM0STV1WTRhS1oyUW9kRTU2WWNTaU5Q?=
 =?utf-8?B?YXZ3WS9JTU1wME5sT2pObURuaXFycUJLcEpZODFnYVNFQzFaREladUdreTBz?=
 =?utf-8?B?U2EzOXgzMDJETy9OMitxaWxHSjA2SFkvb2VpQmw1ZmlickRjYTdtQ3ZvMmVj?=
 =?utf-8?B?OTBseGVnYWlCOXBDWWt6L2l6U2NpMHl5RTQ3TVl1M3lBY2tnSTF2bDJscUxS?=
 =?utf-8?B?K2pTNXhJWENnYWRLZXREUXB6UHY4OFUrMzR2dk5Lbm9VbVRuV1hTWTBqTmt4?=
 =?utf-8?B?bld1QkRyWFlOSWNOZ1dLdk5YZzBVb0hHWkdBUnE0VVNVK3VsNEdaN2RoNmt6?=
 =?utf-8?B?a2JLbzdNTDlZazVESWZuMzBzMFkySXFPYjN5NVBNTUhZSXJ5VkwrQ1U0VENU?=
 =?utf-8?B?bDhLUUw1Z1N5aW10QWlNRm03UzIyTVZXc1pDWGJ0b2pFbnh4UmtJcHpYN0lV?=
 =?utf-8?B?MS9LaFF5cHBFeGhrV2R1dHRQelM0WkZ1NlpDNy85RCsrbzNKNDQwK09VUHlz?=
 =?utf-8?B?VHJyYVd1bFZpeTBmR09zM0Fxd2pFQTlqQkdPWWpVaHZxbmRqWW9UdStRalNv?=
 =?utf-8?B?WnU2aEFwbzYyWnFZOHVCSXRaMHNta1VoSy9yVXRCNTZ3a1QvNU5yRnpySmNh?=
 =?utf-8?B?OEtmSXphVXlmSVVxR3ZZV3p3Mms5WjVvOU5GSy9aOWQ2NVlDNlEzdGliVDRK?=
 =?utf-8?B?VmNrU0YrTE9XVG0vR1hXTmkrajBvTEdqV1l1NEc2SlNyV1ZtSWQralFHblRp?=
 =?utf-8?B?eEU1Rk5NWHBodlJ1QnIxYmI5eVc0MjczUWdEUmNHYURkdndUVDRpRExPdTVT?=
 =?utf-8?B?Y3E1bXVaQUNMczl1aGdLVkwrTVJPNDRRRkF2bEZvcnZSM0krRXBGUkhLTjZk?=
 =?utf-8?B?Y0tPZzdLZVpnb29ldTFYSVM0RWM0M29wb1F3RmpYNWtwQW11eHdaQTJ4RHRq?=
 =?utf-8?B?bGlQVnRQWHRjclk4Q0NBMU4rcDJydXJEaEVXdENCZndvYmdBTmhWNVpacWZF?=
 =?utf-8?B?UGJkQTZoRUNOZ1JWMVRPVjE4YWFKZ2lnK2RPazZFV3hOWW1VU24zNDJ2NVNZ?=
 =?utf-8?B?ZHM3TmcveVhCTmI5VmtzNVluQnVuNTZJa3VSbmcxaXh5VW5MVCtqcDhWV242?=
 =?utf-8?B?aHNJejRnTjlWbHVaSnVyUkwvYm1CZGZIejRJUUZnUkxUU3BoYUIyRCsvV25v?=
 =?utf-8?B?OWZpWHJUUVhoMC81cDE3cmZEWUdhQVVuSm9GUGg4WUtZOFFHODlNSi8rOHU0?=
 =?utf-8?B?ay9OVFZZcnFnaXlBQzF2cjNtMVlGN1hiRXJnanlxWnN4VUlGR2xzZVp5M3VJ?=
 =?utf-8?B?TC9zYSt6S1BFYWt2cjVXYXBnOWV0c1ZHSzB2dmp5dDJUL0w3dHlEL2loalFz?=
 =?utf-8?B?aFlzbXBqaHBuUW1UVnN4MGI3aFpYeVVMamtYV2JBQ3lsb1liREdUVENIY05p?=
 =?utf-8?B?bDdqT3hxcW5NZG5KbWl5SU1mOUxCbWhuUVk3N2VCbEZmanFtUEFWbHFwcjZD?=
 =?utf-8?B?ak9yajdsSi81bzZubUpzTm05VWxuR0JqanRBQTczOXc3ZFFQb3krNXVHYldh?=
 =?utf-8?B?Ri84YVRkTzFiWlFBbGRaMnVtMHR0MTdZcWcrNW5IRlJocm96OVFNbU5NLzFx?=
 =?utf-8?B?UlZueXJIVjRKN24rVnhQZGRNeW5VK29hSXNic0lyS3ZES055eVZEZmRsSStB?=
 =?utf-8?B?NGZkenQvZzVFKytKczVMWkFtTXR2RGdLNjNzQUkrcytxUXpjOEpRd2g5dFNI?=
 =?utf-8?B?aXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <68E53BA24E91C74BAE1D28C72E5F0E7D@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: /BLDO7tpM6wHVTRO43en74ayojXfSldWD6tfz/sXmmAw32rc0PS65POmzK05wa2vH+wPc53c20HbAqd0k1KdVBpROWz+MbfmoPp4yi8P8DhSv/ui+eJayxxycAjRkxknV8TrsD+gc6Yy2RosD6FWI4xCbykSDo/YDDZ2VlpdcWOh9PGt/LlxcXcdTYJfIk6ui1QeS7q0858ypEy26qdSmMmp7ZZqqLWSAMmHifNwhKqNYTAZeemn627q987LGnga7y+gGvv0baHd6oE9aIb+7o+G5Zlm+BJ+RBSMzQBwo1kNYOc3n/RfK8QxEUdJv4o27U8DXFMeccXrZpNglWoDWwY3t2v5jPYnmfFQvS1rtumj5yKNaPXKlgh5dJkOTogb9jJzBfpnMt8KEB0rcCLJ+M6u+SvZIs+6A9C+AvO7juD+DOv1Hcy0ZeygB9EEkKE0RaYJFgOjQv0qGmn+9zoyMjQYJrbUxt7wsr+QOxBLmxOP2UzB4WVcG7TkcV8kqpnyKp9TCrMb57ZmSxeH872BC9sJrmGXSxtD8Abl0AJcHL/clsnutLUOWPnuUNjfDaql6RWL7rPjknnxgV+O6oqYf+vreAb1lOjcCt2luO83Q7hH8m139VxA0ksoBkdU4jFcMLdcM3Ap3BKyt7D1fYwvuQJPDCBl2YOdmtZAuj4opt5SdqRArOOTHOU3fgVjbepUQnkr8xSGMdXEZItM0a3wEX28Rv3PmDz21dyC8kLYbkp25KTWUY4PokfXDDpndTwYFPZmrOp18atxFOKDcukIv4BOR27j4shhncPP8VWxP/5r0rR3OVhD6AU83OdmkJJJ7MLNAqXWhYUX69B2ziM46+0duQfQzJG3jIab54TTlcGWQBvK4BlYXXJ2D/ybHI/3wXklo25qCM8f7GJaeGni8+jWD7rcpzmQAcolx9wUHFA=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db107b16-b099-4355-d80b-08db0558574a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2023 20:01:58.2528
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T6pIAm5IKFpbPGsiWkMtHb0c5R91cMC/6Nx6V/LmTtCJyK89qnbAbxAr+Hb+nSur4XgtkOObh1auIK71cn5baA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7808
X-Proofpoint-ORIG-GUID: SPDxe86xUuQjWfvSlAPqunzrO0rYJzA9
X-Proofpoint-GUID: SPDxe86xUuQjWfvSlAPqunzrO0rYJzA9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-02_14,2023-02-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 phishscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302020179
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVGh1LCBGZWIgMDIsIDIwMjMsIERhbiBTY2FsbHkgd3JvdGU6DQo+ICgrQ0Mgcm9nZXIgYXMg
dGhlIGF1dGhvciBvZiB0aGUgVVNCX0dBREdFVF9ERUxBWUVEX1NUQVRVUyBtZWNoYW5pc20pDQo+
IA0KPiBPbiAyNi8wMS8yMDIzIDIzOjU3LCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4gT24gVGh1
LCBKYW4gMjYsIDIwMjMsIEFsYW4gU3Rlcm4gd3JvdGU6DQo+ID4gPiBPbiBUaHUsIEphbiAyNiwg
MjAyMyBhdCAwNzozMTozNFBNICswMDAwLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4gPiA+IE9u
IFRodSwgSmFuIDI2LCAyMDIzLCBEYW4gU2NhbGx5IHdyb3RlOg0KPiA+ID4gPiA+IEhpIFRoaW5o
DQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gT24gMjYvMDEvMjAyMyAwMDoyMCwgVGhpbmggTmd1eWVu
IHdyb3RlOg0KPiA+ID4gPiA+ID4gT24gVHVlLCBKYW4gMjQsIDIwMjMsIERhbiBTY2FsbHkgd3Jv
dGU6DQo+ID4gPiA+ID4gPiA+IEhpIFRoaW5oDQo+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4g
PiANCj4gPiA+ID4gPiA+ID4gSSdtIHRyeWluZyB0byB1cGRhdGUgdGhlIERXQzMgZHJpdmVyIHRv
IGFsbG93IHRoZSBzdGF0dXMgcGhhc2Ugb2YgYQ0KPiA+ID4gPiA+ID4gPiB0cmFuc2FjdGlvbiB0
byBiZSBleHBsaWNpdDsgbWVhbmluZyB0aGUgZ2FkZ2V0IGRyaXZlciBoYXMgdGhlIGNob2ljZSB0
bw0KPiA+ID4gPiA+ID4gPiBlaXRoZXIgQWNrIG9yIFN0YWxsIF9hZnRlcl8gdGhlIGRhdGEgcGhh
c2Ugc28gdGhhdCB0aGUgY29udGVudHMgb2YgdGhlIGRhdGENCj4gPiA+ID4gPiA+ID4gcGhhc2Ug
Y2FuIGJlIHZhbGlkYXRlZC4gSSB0aG91Z2h0IHRoYXQgSSBzaG91bGQgYmUgYWJsZSB0byBhY2hp
ZXZlIHRoaXMgYnkNCj4gPiA+ID4gPiA+ID4gcHJldmVudGluZyBkd2MzX2VwMF94ZmVybm90cmVh
ZHkoKSBmcm9tIGNhbGxpbmcgZHdjM19lcDBfZG9fY29udHJvbF9zdGF0dXMoKQ0KPiA+ID4gPiA+
ID4gPiAocmVseWluZyBvbiBhbiAiZXhwbGljaXRfc3RhdHVzIiBmbGFnIGFkZGVkIHRvIHRoZSB1
c2JfcmVxdWVzdCB0byBkZWNpZGUNCj4gPiA+ID4gPiA+ID4gd2hldGhlciBvciBub3QgdG8gZG8g
c28pIGFuZCB0aGVuIGNhbGxpbmcgaXQgbWFudWFsbHkgbGF0ZXIgb25jZSB0aGUgZGF0YQ0KPiA+
ID4gPiA+ID4gPiBwaGFzZSB3YXMgdmFsaWRhdGVkIGJ5IHRoZSBnYWRnZXQgZHJpdmVyIChvciBp
bmRlZWQgdXNlcnNwYWNlKS4gQSB2ZXJ5DQo+ID4gPiA+ID4gPiA+IGJhcmVib25lcyB2ZXJzaW9u
IG9mIG15IGF0dGVtcHQgdG8gZG8gdGhhdCBsb29rcyBsaWtlIHRoaXM6DQo+ID4gPiA+ID4gPiA+
IA0KPiA+ID4gPiA+ID4gV2Ugc2hvdWxkbid0IGRvIHRoaXMuIEF0IHRoZSBwcm90b2NvbCBsZXZl
bCwgdGhlcmUgbXVzdCBiZSBiZXR0ZXIgd2F5cw0KPiA+ID4gPiA+ID4gdG8gZG8gaGFuZHNoYWtl
IHRoYW4gcmVseWluZyBvbiBwcm90b2NvbCBTVEFMTCBfYWZ0ZXJfIHRoZSBkYXRhIHN0YWdlLg0K
PiA+ID4gPiA+ID4gTm90ZSB0aGF0IG5vdCBhbGwgY29udHJvbGxlcnMgc3VwcG9ydCB0aGlzLg0K
PiA+ID4gPiA+IA0KPiA+ID4gPiA+IE1heWJlIEknbSBtaXN1bmRlcnN0YW5kaW5nLCBidXQgaXNu
J3QgdGhpcyBob3cgdGhlIFVTQiBzcGVjIGV4cGVjdHMgaXQgdG8NCj4gPiA+ID4gPiB3b3JrPyBS
ZWFkaW5nICJSZXBvcnRpbmcgU3RhdHVzIFJlc3VsdHMgKDguNS4zLjEpIiBpbiB0aGUgVVNCIDIu
MCBzcGVjIGZvcg0KPiA+ID4gPiA+IHRoZSBzdGF0dXMgc3RhZ2UgaW4gYSBjb250cm9sIHdyaXRl
IGl0IHNheXMgIlRoZSBmdW5jdGlvbiByZXNwb25kcyB3aXRoDQo+ID4gPiA+ID4gZWl0aGVyIGEg
aGFuZHNoYWtlIG9yIGEgemVyby1sZW5ndGggZGF0YSBwYWNrZXQgdG8gaW5kaWNhdGUgaXRzIGN1
cnJlbnQNCj4gPiA+ID4gPiBzdGF0dXMiLCBhbmQgdGhlIGhhbmRzaGFrZSBjYW4gYmUgZWl0aGVy
IFNUQUxMIG9yIE5BSy4gSWYgd2UgY2FuJ3QgZG8gdGhpcywNCj4gPiA+ID4gPiBob3cgZWxzZSBj
YW4gd2UgaW5kaWNhdGUgdG8gdGhlIGhvc3QgdGhhdCB0aGUgZGF0YSBzZW50IGR1cmluZyBhIGNv
bnRyb2wgb3V0DQo+ID4gPiA+ID4gdHJhbnNmZXIgaXMgaW4gc29tZSB3YXkgaW52YWxpZD8NCj4g
PiA+ID4gPiANCj4gPiA+ID4gTXkgY29uY2VybiBpcyBmcm9tIHRoZSBkb2N1bWVudGF0aW9uIG5v
dGVbKl0gYWRkZWQgZnJvbSB0aGlzIGNvbW1pdDoNCj4gPiA+ID4gNTc5YzJiNDZmNzQgKCJVU0Ig
R2FkZ2V0OiBkb2N1bWVudGF0aW9uIHVwZGF0ZSIpDQo+ID4gPiBXaGVuIHRoZSBnYWRnZXQgc3Vi
c3lzdGVtIHdhcyBvcmlnaW5hbGx5IGRlc2lnbmVkLCBpdCBtYWRlIG5vIGFsbG93YW5jZQ0KPiA+
ID4gZm9yIHNlbmRpbmcgYSBTVEFMTCBpbiB0aGUgc3RhdHVzIHN0YWdlLiAgVGhlIFVEQyBkcml2
ZXJzIGV4aXN0aW5nIGF0DQo+ID4gPiB0aGF0IHRpbWUgd291bGQgYXV0b21hdGljYWxseSBzZW5k
IHRoZWlyIG93biB6ZXJvLWxlbmd0aCBzdGF0dXMgcGFja2V0DQo+ID4gPiB3aGVuIHRoZSBjb250
cm9sIGRhdGEgd2FzIHJlY2VpdmVkLg0KPiA+ID4gDQo+ID4gPiBEcml2ZXJzIHdyaXR0ZW4gc2lu
Y2UgdGhlbiBoYXZlIGNvcGllZCB0aGF0IGFwcHJvYWNoLiAgVGhleSBoYWQgdG8sIGlmDQo+ID4g
PiB0aGV5IHdhbnRlZCB0byB3b3JrIHdpdGggdGhlIGV4aXN0aW5nIGdhZGdldCBkcml2ZXJzLiAg
U28gdGhlIGVuZCByZXN1bHQNCj4gPiA+IGlzIHRoYXQgZnVsbHkgc3VwcG9ydGluZyBzdGF0dXMg
c3RhbGxzIHdpbGwgcmVxdWlyZSBjaGFuZ2luZyBwcmV0dHkgbXVjaA0KPiA+ID4gZXZlcnkgVURD
IGRyaXZlci4NCj4gPiA+IA0KPiA+ID4gQXMgZm9yIHdoZXRoZXIgdGhlIFVEQyBoYXJkd2FyZSBo
YXMgc3VwcG9ydC4uLiAgSSBkb24ndCBrbm93LiAgU29tZSBvZg0KPiA+ID4gdGhlIGVhcmxpZXIg
ZGV2aWNlcyBtaWdodCBub3QsIGJ1dCBJIGV4cGVjdCB0aGF0IHRoZSBtb3JlIHBvcHVsYXIgcmVj
ZW50DQo+ID4gPiBkZXNpZ25zIHdvdWxkIHByb3ZpZGUgYSB3YXkgdG8gZG8gaXQuDQo+ID4gPiAN
Cj4gPiBSaWdodCwgaXQncyBqdXN0IGEgYml0IGNvbmNlcm5pbmcgd2hlbiB0aGUgZG9jdW1lbnQg
YWxzbyBub3RlZCB0aGlzOg0KPiA+ICJOb3RlIHRoYXQgc29tZSBVU0IgZGV2aWNlIGNvbnRyb2xs
ZXJzIGRpc2FsbG93IHByb3RvY29sIHN0YWxsIHJlc3BvbnNlcw0KPiA+IGluIHNvbWUgY2FzZXMu
Ig0KPiA+IA0KPiA+IEl0IGNvdWxkIGJlIGp1c3QgZm9yIG9sZGVyIGNvbnRyb2xsZXJzIGFzIHlv
dSBtZW50aW9uZWQuDQo+ID4gDQo+ID4gDQo+ID4gSGkgRGFuLA0KPiA+IA0KPiA+IFdlIHNob3Vs
ZCBhbHJlYWR5IGhhdmUgdGhpcyBtZWNoYW5pc20gaW4gcGxhY2UgdG8gZG8gcHJvdG9jb2wgU1RB
TEwuDQo+ID4gUGxlYXNlIGxvb2sgaW50byBkZWxheWVkX3N0YXR1cyBhbmQgc2V0IGhhbHQuDQo+
IA0KPiANCj4gVGhhbmtzOyBJIHRyaWVkIHRoaXMgYnkgcmV0dXJuaW5nIFVTQl9HQURHRVRfREVM
QVlFRF9TVEFUVVMgZnJvbSB0aGUNCj4gZnVuY3Rpb24ncyAuc2V0dXAoKSBjYWxsYmFjayBhbmQg
bGF0ZXIgKGFmdGVyIHVzZXJzcGFjZSBjaGVja3MgdGhlIGRhdGENCj4gcGFja2V0KSBlaXRoZXIg
Y2FsbGluZyB1c2JfZXBfcXVldWUoKSBvciB1c2JfZXBfc2V0X2hhbHQoKSBhbmQgaXQgZG9lcyBz
ZWVtDQo+IHRvIGJlIHdvcmtpbmcuIFRoaXMgc3VycHJpc2VzIG1lLCBhcyBteSB1bmRlcnN0YW5k
aW5nIHdhcyB0aGF0IHRoZSBwdXJwb3NlDQo+IG9mIFVTQl9HQURHRVRfREVMQVlFRF9TVEFUVVPC
oCBpcyB0byBwYXVzZSBhbGwgY29udHJvbCB0cmFuc2ZlcnMgaW5jbHVkaW5nDQo+IHRoZSBkYXRh
IHBoYXNlIHRvIGdpdmUgdGhlIGZ1bmN0aW9uIGRyaXZlciBlbm91Z2ggdGltZSB0byBxdWV1ZSBh
IHJlcXVlc3QNCj4gKGFuZCBwb3NzaWJseSBvbmx5IGZvciBzcGVjaWZpYyByZXF1ZXN0cykuIFJl
Z2FyZGxlc3MgdGhvdWdoIEkgdGhpbmsgdGhlDQo+IGNvbmNsdXNpb24gZnJvbSBwcmV2aW91cyBk
aXNjdXNzaW9ucyBvbiB0aGlzIHRvcGljIChzZWUgWzFdIGZvciBleGFtcGxlKSB3YXMNCj4gdGhh
dCB3ZSBkb24ndCB3YW50IHRvIHJlbHkgb24gVVNCX0dBREdFVF9ERUxBWUVEX1NUQVRVUyB0byBk
byB0aGlzIHdoaWNoIGlzDQoNCk15IGNvbW1lbnQgaW5pdGlhbGx5IHdhcyBtb3JlIGZvciBoYW5k
bGluZyBmcm9tIHRoZSBob3N0IGFuZCBob3cgaXQNCnNob3VsZCBiZWhhdmUuIElmIHRoZSBVVkMg
c3BlYyByZXF1aXJlcyB0aGlzLCB0aGVuIHdlIHNob3VsZCBpbXBsZW1lbnQNCml0LiBTaW5jZSB5
b3Ugb25seSBoYW5kbGUgdGhlIGRldmljZSBzaWRlLCB3ZSBoYXZlIG5vIGNvbnRyb2wgaG93IHRo
ZQ0KaG9zdCB3b3VsZCBiZWhhdmUuDQoNCkkgcHJvYmFibHkgc2hvdWxkbid0IGhhdmUgYnJvdWdo
dCBpdCB1cCBhdCBhbGwgYXMgaXQgbWF5IGNhdXNlIG1vcmUNCmNvbmZ1c2lvbi4NCg0KVGhhbmtz
LA0KVGhpbmgNCg0KPiB3aHkgSSBoYWQgYXZvaWRlZCBpdCBpbiB0aGUgZmlyc3QgcGxhY2UuIEEg
Y29sbGVhZ3VlIG1hZGUgYSBzZXJpZXMgWzJdIHNvbWUNCj4gdGltZSBhZ28gdGhhdCBhZGRzIGEg
ZmxhZyB0byB1c2JfcmVxdWVzdCB3aGljaCBmdW5jdGlvbiBkcml2ZXJzIGNhbiBzZXQgd2hlbg0K
PiBxdWV1aW5nIHRoZSBkYXRhIHBoYXNlIHJlcXVlc3QuIFVEQyBkcml2ZXJzIHRoZW4gcmVhZCB0
aGF0IGZsYWcgdG8gZGVjaWRlDQo+IHdoZXRoZXIgdG8gZGVsYXkgdGhlIHN0YXR1cyBwaGFzZSB1
bnRpbCBhZnRlciBhbm90aGVyIHVzYl9lcF9xdWV1ZSgpLCBhbmQNCj4gdGhhdCdzIHdoYXQgSSdt
IHRyeWluZyB0byBpbXBsZW1lbnQgaGVyZS4NCj4gDQo+IA0KPiBbMV0gaHR0cHM6Ly91cmxkZWZl
bnNlLmNvbS92My9fX2h0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE4LzEwLzEwLzEzOF9fOyEhQTRG
MlI5R19wZyFaU2wzc25iRzUzWUt1NHRTYTJnSHUzZ3N4RWpZVzQzUXlHWG0xWUlSM29SZkJxZVB1
MU54azNhUy1jZWN3b1Z0NGJDcU5VNnkzWlVFYnJIMkJTY2ZTY2tfeHE3XyQNCj4gDQo+IFsyXSBo
dHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9w
cm9qZWN0L2xpbnV4LXVzYi9wYXRjaC8yMDE5MDEyNDAzMDIyOC4xOTg0MC01LXBhdWwuZWxkZXJA
aWRlYXNvbmJvYXJkLmNvbS9fXzshIUE0RjJSOUdfcGchWlNsM3NuYkc1M1lLdTR0U2EyZ0h1M2dz
eEVqWVc0M1F5R1htMVlJUjNvUmZCcWVQdTFOeGszYVMtY2Vjd29WdDRiQ3FOVTZ5M1pVRWJySDJC
U2NmU2Fjc21QT2okDQo+IA0KPiA+IA0KPiA+IFJlZ2FyZGluZyB0aGlzIHF1ZXN0aW9uOg0KPiA+
IAlIb3cgZWxzZSBjYW4gd2UgaW5kaWNhdGUgdG8gdGhlIGhvc3QgdGhhdCB0aGUgZGF0YSBzZW50
IGR1cmluZyBhDQo+ID4gCWNvbnRyb2wgb3V0IHRyYW5zZmVyIGlzIGluIHNvbWUgd2F5IGludmFs
aWQ/DQo+ID4gDQo+ID4gVHlwaWNhbGx5IHRoZXJlIHNob3VsZCBiZSBhbm90aGVyIHJlcXVlc3Qg
Y2hlY2tpbmcgZm9yIHRoZSBjb21tYW5kDQo+ID4gc3RhdHVzLiBJIHN1cHBvc2UgaWYgd2UgdXNl
IHByb3RvY29sIFNUQUxMLCB5b3Ugb25seSBuZWVkIHRvIHNlbmQgc3RhdHVzDQo+ID4gcmVxdWVz
dCBjaGVjayBvbiBlcnJvciBjYXNlcy4NCj4gPiANCj4gPiBUaGFua3MsDQo+ID4gVGhpbmg=
