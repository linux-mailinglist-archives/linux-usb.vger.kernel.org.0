Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EF966FE9BE
	for <lists+linux-usb@lfdr.de>; Thu, 11 May 2023 04:10:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231797AbjEKCK5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 May 2023 22:10:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbjEKCK4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 May 2023 22:10:56 -0400
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB856DE
        for <linux-usb@vger.kernel.org>; Wed, 10 May 2023 19:10:54 -0700 (PDT)
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34ANYlmQ016098;
        Wed, 10 May 2023 19:10:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=lyxjxFjB0jqmLpngNc4lO28pAqrf0Cqoqn8ymRYjcyU=;
 b=f0wWtnm572RKMzBJAlG3GB4N11dgcWtmDiNgYOB9rfqyJcq1K5Yu5aWx5jbSbbcGaOyj
 btgGkJnibOm98K3SzUziPFkdZ5huKoG9x1rvK73/ai2eLSwFy5B4iNKX7DT5sIcyoypD
 NRCuik/SacAALXG/63u6s7/DWIF2t1B+3iRzE7nU31YCiZp4+oF/Q49JO6Rnsby3nu5v
 /wgv+ORK98V4IAhNBC9FF6JCFPJWbJQkbElvheiMWcFvg1/A1ja9gIl9xdevqcn+ASRw
 EWORJWhmYF0qW+4LsFk5EVTMkUDnpCU4ooTeEgU1P0dQU61wYxic5dVnSbJ/ci0wUKV4 rw== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3qf772c3cn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 10 May 2023 19:10:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1683771052; bh=lyxjxFjB0jqmLpngNc4lO28pAqrf0Cqoqn8ymRYjcyU=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=A7js7pOmoX37lZjfPhNG1NMwveVv39mnlDlDdn0o37MpuhDUN/6rlU5559vhKj7Ht
         vNUecZZmyqPES/O/KQU9thfJ52o9OcxTzl3wSbYFQsnR+P4YiA3bn9YaKw203YjQrE
         AZHRUhvg5YSAbH5N72oYAm7TyDI5CSBsAVEV2vOaxcdoSDNpifzASAqEzmdtljuJTg
         QB9ngABgDtyJfWhMMQUOvuoFjQYkhOJzCHQH0BId6nmmPsp8CToT6w10zMXdiOwvK4
         qARY+IAavK0lWEPrSyOJO1l2Y0umWyNIZFYrGUzIXY1p9b/ad1MmMfb+fyEAMz3WvW
         +xy5OHMpdA3QQ==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E938540524;
        Thu, 11 May 2023 02:10:51 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id A692EA0092;
        Thu, 11 May 2023 02:10:51 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=XyJI7Dg2;
        dkim-atps=neutral
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2047.outbound.protection.outlook.com [104.47.73.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id CA3BE40520;
        Thu, 11 May 2023 02:10:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UWb7OQUp79v0onsNGdDi0KzyF5hI85Uvff/C6mDp6/pLtzAbVsAFGHikpRNWKA8GOxgpxQQs3m/gJFfbM9V2wqjvFvW1O8ff/idRuoxYQZt8C/bZNuXejvWUvPjcAbvyJ59G1+UYSZI2eOyiPHJRG4WmKLDIFtvyBMyqZkNve7QQREa5pC1qIjgAWGSr8ScQ5vwLrCKKCQY3sAJBJJ/AJlgnSJTnSb7VnK20G6iieg9eFFUf8OPyPPTxK50Fn3OdZZhToASvqg7KTqWVi/54jNjDeNGKTAIdEIJwXviCksy61KSVX8+bqsX5GmlicbhJqsHLskIHTGmDfrFfm2cUVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lyxjxFjB0jqmLpngNc4lO28pAqrf0Cqoqn8ymRYjcyU=;
 b=SIKWP8QCgp31+8yxCNmaffZfteaPd/ak1xxsv40IHBG7cP3ALjJKQGMAUFTP3aQJ/3KFrZmwmJi1H4ei5d47AV6etQmdOBfnqSU8zC4LTdeUsI5OV7A4zH2Z+dHwSr5ti3fox/dG1GvFs+64m6qYjQN/YQ3yB7UP9CUdx8IfI7Ag92e22FC4zCXjjR1RZSDYCehsyBIx3eXB2i2F7X1L1Yih0tnRv1YAsaFry3tjOsD4oqdK0Y9ysJ3Rmw2Bb2aV6AvvILUU8f3AdJvfPh/7EapwjLhqW6MqI+fLCBrbtjymo2tFP5MvvnQLYhDQhexK2V3q54NUFSu08UBBmiC5vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lyxjxFjB0jqmLpngNc4lO28pAqrf0Cqoqn8ymRYjcyU=;
 b=XyJI7Dg2g7Cq8r9C5RGHgCnz57XwohnLyD4hTtAseqZxSBozkL+PABhdw+BmJA0G+a/ug4VIHdqiSkl7uD+Y9e9WN3qDDns2kvboxq+nBNRD5jLnKVlxVIBVGO5tKVh1qp+EvgWUnI0xxVRX5WMNgeHlg/+UJe29m+JmD10C8FM=
Received: from BN8PR12MB4787.namprd12.prod.outlook.com (2603:10b6:408:a1::11)
 by PH0PR12MB8152.namprd12.prod.outlook.com (2603:10b6:510:292::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Thu, 11 May
 2023 02:10:38 +0000
Received: from BN8PR12MB4787.namprd12.prod.outlook.com
 ([fe80::d13e:1438:9692:eba6]) by BN8PR12MB4787.namprd12.prod.outlook.com
 ([fe80::d13e:1438:9692:eba6%7]) with mapi id 15.20.6363.033; Thu, 11 May 2023
 02:10:38 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Setting LLUCTL force gen1 bit if max speed is SS for Gen2
 controller
Thread-Topic: Setting LLUCTL force gen1 bit if max speed is SS for Gen2
 controller
Thread-Index: AQHZg2pub4txYYMDE02M/COcGpMSMq9UBfeAgABDIACAAAWigIAABMoAgAABEAA=
Date:   Thu, 11 May 2023 02:10:38 +0000
Message-ID: <20230511021006.y5zjon5t2xnwnd2j@synopsys.com>
References: <e465c69c-3a9d-cbdb-d44e-96b99cfa1a92@quicinc.com>
 <20230510212845.ymxudl4r3f54erkq@synopsys.com>
 <55aeb1ac-a90a-8b2e-7de2-114bfcf7dcb9@quicinc.com>
 <20230511014909.s6hdfidc5vdalhga@synopsys.com>
 <c534fd19-2868-818e-9bda-2caa519b2ee1@quicinc.com>
In-Reply-To: <c534fd19-2868-818e-9bda-2caa519b2ee1@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN8PR12MB4787:EE_|PH0PR12MB8152:EE_
x-ms-office365-filtering-correlation-id: 25318a1b-7a74-4e11-ea68-08db51c4ea02
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: N5/kzfmO+pqpoXQkuehfS9Q4+WI7g07yWZXE2TWTfdlsHzisSYOV/MO54yjl8wNLK+bklLRvdG1rAz23LVz9FhlKNCovpSV2UULL5Hrh/x5pgIxABiZMkbkEj4c+2LLprENLr9Ijqa7oWNKg6x/beBfbimToB3KE5LK0RSOvMQPYzd+TVVsil/Suj+zzyYIIWY6Y/OxgcsbYmOttQCrAxy9TpcMUi7XU/ALmeADMUJPH+mdSbc61R/G4+Jq3VMbwydf2bRL5dRtWe2kP/KtcAFziIfRR/I/dyjGRn9/ZddHn7NnadEGCRUm0tmkpumFwDxcoLZACJvE8oeWZy+jFmT25XYpiyU4vEAEO9Z/inLniNx8Jm3HfJcfHymTpsy07Z4v42bWHVVAb+pKLYENU42/2ZWXrZDkQg7E2XWc7Qj2Fz0d7MRdhilWwVuPtRD7rOwGtHmvX6PtENNNiuDHdttLEIStm0Yu+SDB3n9GcL+uv+Q6Y8NZfLmO4YjyxnT9Uozj8wmDVABWdPsQ2dLuk0nCF5agRe+yopFD7BbR9KB0b/PC8vED6j7eM/DdhCygvZMwNtXvYROixicClGXG9COcVEJbw37ALoE9/I81qVhgyOSsyG8nUSqJ7lOo7MAv4
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR12MB4787.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(136003)(346002)(396003)(39860400002)(451199021)(5660300002)(54906003)(8936002)(8676002)(6486002)(41300700001)(71200400001)(316002)(26005)(53546011)(478600001)(64756008)(66556008)(1076003)(6916009)(76116006)(6512007)(66946007)(6506007)(4326008)(66446008)(91956017)(66476007)(2906002)(83380400001)(2616005)(186003)(122000001)(36756003)(86362001)(38070700005)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OFJ2TzF6QVBKamQySVlyclY2QjVjNnBNd0w2bk9ockFRbmdVU1lReHpJM20v?=
 =?utf-8?B?WWVqUUoveEtBRjlRdnlHQXFMYi90dVF1RmVxeFZJc0JueWhPNXJRaVRFdFo1?=
 =?utf-8?B?UHBxaTZaSkJYZFpIdFFhUVljeDU4ditSOC92UFl6cnRRUmlHNm9WbzAwcE0z?=
 =?utf-8?B?cDg2MTRBRVE1UzhiS1FoQTFMZnU5aFduUXVGL2s0ZWxkRnVtb09ZejV1Rk92?=
 =?utf-8?B?Z2VrWG90MGpwS0gvbThLZ2RHLzdVNmJhWWFpMk4yQzUyVmZoUXBnc3VLRGNQ?=
 =?utf-8?B?TVF3VGVuWG9ZeUl3VnhER2JLS2N6akpkcm5NYjZNV3I2blhXWW82VHMrQmJx?=
 =?utf-8?B?TUR4UjNvTmJubERXR2hrTmhUTU1kQmRzU1pkUlJtM1EwM014RDlnV3IxbVZY?=
 =?utf-8?B?c0xuK2J2MzV0ejRUb2dmNzRta0hBam0rK2g2TkN5MTBaUGZoMkhGSnJmY25X?=
 =?utf-8?B?VXZyaFpZcjczd0VZbGhVNWRKazdlRWZxWUlJSTM2c1J2L0drSHorTGRzOWI3?=
 =?utf-8?B?aktRNGRKODdObU55aFR2clUyREJsaGhYbHdsNndQWkFBNXJoNVlxSEVWc3Vl?=
 =?utf-8?B?OVNoVnprL2VPQUpKYkRtN20rSEZxRmYvcnFYMHk4dFlFbmdMWGJCcmJkVS91?=
 =?utf-8?B?NHFOVmR3ajMwK3dkU0VIWnJPWG5yQ2FVa1NVOHExR0lIeTdpdkR6RWJCVTdI?=
 =?utf-8?B?dHczM0Zza1Ztb2Z3aWd1TWNWQmNmb0RMQVgzNjdMR1VnZHZwajkyUDZ1MnpE?=
 =?utf-8?B?SnF5MkJTVDAvWFRUakpiVDdqOUFOeTRIUm9MZktxaS9Pa3pHYUpaOWk2amY0?=
 =?utf-8?B?RklnN2NQSWs3ZXpmVWdYdVVibVpsVHU3KzZGVzlTRDhNZ1lIbUN3ZUxSR0tP?=
 =?utf-8?B?Y0QxTXFVQ09xRTFMSlp6NGNBbDJzbERmcnNmczlXTXB4MTQ0d2l5TURyV1c5?=
 =?utf-8?B?U0NaRWYyWWp1cnZTTWp5b3ZSM2txMHdvNDdXbjhhMVN6YlpxNExaSHo4VUxK?=
 =?utf-8?B?ajZ5aTl3WUFNdmpIVUxUWGV4bVNpU21sWXBMNHdVS2ZWaGxKS2ZJSEdyd1Yw?=
 =?utf-8?B?ZUxEYXEwLzBzRTBXSm5rWjJDemxEd3ZMY1FkS0tRakRVUUUwRTdQdkxtUjBP?=
 =?utf-8?B?c0J4aDVWNHNjMk53c1FGWE15R1dSbUJ0bThPUE9kUDdTcjJ4QkNKQjh2cCtm?=
 =?utf-8?B?QnQrcG5ZVGx2d0UvTEo1a1FzUWp6Snp4MmlsY3pLNmd3TXNJYXRUcUFEaXdo?=
 =?utf-8?B?RFYwNEZLeUhwNHVXTnd2dGZJamQ3ZnNYNXBLYVVLWXY3ZmdHMkYwUmlRWUJW?=
 =?utf-8?B?VDRaQ3QvbnMvb202Y05kWHlKbnVCTmR6NnBhL0ExT0I0bHlPTUtMcTBKS3dL?=
 =?utf-8?B?cFVRbjQ5WXpBTEdWT2FVWURZWmRBUXhCdFVjWTc3TXZ5azlkam1EdzJpYXlw?=
 =?utf-8?B?VDdVY2dFVnpLMTg4N2Rod3cvSnA2Qit3MEdwdjBhcFN5UDl0ZmZGZk9hZ0tG?=
 =?utf-8?B?SVQyWFB1RTZyR284bmx5Vmd4U0syWUdrTktFanBqOUpnQjVHampOU2FjNXFW?=
 =?utf-8?B?TWExN2FJWk5jNEpuYUlNbVJOS0Rac2V3U01GbUgzczB6ZzN0NzdFQTZMZHNv?=
 =?utf-8?B?a21NZXhLanVxTjk1NXdNTlNTVjNvRVRNeWcvQnB6aFlJU2VORU1CVzlQUWpN?=
 =?utf-8?B?UitZQlB3alBxZ3Ixb0ZhV1I3b2F3VzNBb0gvK2dQSGorV09yUnJIR0ZaSEZl?=
 =?utf-8?B?ZHptNkRONGlSVGdXanNSSWxldkZJK2xIRUgwa205STFjVmR0a25qMVQ1c09p?=
 =?utf-8?B?ZlAzdnBLWUZHbWFodnFOdk8yOW40ZUZIOXJNZUpiRERKUDdaWDdQQk9TRkYz?=
 =?utf-8?B?bnFSQnhsVzlZSkplZ2J3alUySWxOMjBjVUpQZ2hnODhueHZmWGJjYlh4Z3F5?=
 =?utf-8?B?SmZjY1A4VHc3UVdLNnN5NHNLUDZIajlMSFN1RFFTQU94TkZicXpzTUdWeEMr?=
 =?utf-8?B?c1N2bHhDR3lMcDl5Nit3MHM1Ym42djgxYW1mSldyWllid0RlZ3o0QUE2NjM5?=
 =?utf-8?B?TVpUU2U5SVc0Z3c0WlZJY3NXN0ZtVkwxNGlyNUUyay9aYmJwR01yemZnRVFl?=
 =?utf-8?Q?v3m0EaEroO/Ta5BwrmRcpuoaY?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7853EE2B70212949BD4BD6791E89F85E@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: Ip5t7u2K5tCec/y3+Zd9bhqbB7fSAUUp297gvIYrH4FwcsT0DHYwE9jKWGvE52wv1P72Wnwqg40AMYT0yTCdONvEiNkaGNV5nOh7xsDRZmmJWHju688u5Eu0YciuJJngNp8RMb6wigcDvQQekxZxRkp2GEvPkmy2pkp0gZ3dIrQMl4/SIxJrz8hmLQpdPPIv7P81GZEMziZCkRbNQCk42xPc4HbAWDOB1Wlwx6BBPbWjSHEq7svAQxqAGfgP7lVF8+BqTRTAQEDDt0Mgk3hZUN0t6rGBbTH2VQmGnyjVq8UguxidJ8Mo1ZD3Y+n3q8/bTqiX1gDtpR988boUfEsr41H81qPpOsCLiPhpZ3X3+8lQQmwPdYRSZhqF/rKsS69GrzL1YHQho51dSbvx+p7SYr5vNV5bjL/M6eWjgpsHhfRLvmvm8jjyR7/pOpZC5TqvYBjYVSB2Ow/O8UKVH6vHk4gi7bU/PdAbV1B/cqdhBzeJArYDh3yr/wcwZGRBi/VPXihV3rCWfiJXnHhdxKZ7d35oyU+20d78xD7ZX1FFmIjE1uGz/65DQrs3mGExnvYA1HuxLYeVN08Ax8tuVr6x/F9EoUJi8MUgwxKVmzWvlozYqGMyA2ddmLDRnUoE+FZg/UO9iMnZPzxwxdocZuxCaNh3cv1Pcv6Ey5/LcdOjjOPZ1R5ylZBAQhiTqL3JRmxfs503E5Z3ohc/lSS4lqxS0r9C+yaa2/P4IIgPz6yym/ey/htoOGhnZMlB5+eksaGV7UJlPIBzoJ/j+dNBFIgMUSi2WwA10nD0A1wYmHszstIf/yrXX8KVASm9z5vo82CzoGaVagMK4PzkVHWayrwsZQWH5aw6zvSRqX6blAYXmkMuSjxBaUttRXY0mjMiSO0Rk6u1X2jpwuhZgAPupA+w3A==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB4787.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25318a1b-7a74-4e11-ea68-08db51c4ea02
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2023 02:10:38.4052
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BRrCAj+ug3+XDdzitU4Qv/apbGws+srJBd/YVOl7wMJVc+8aGO6z21JA6aU5ervxLT56Nt3+M7n1nVrn46hriw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8152
X-Proofpoint-GUID: 4SCJTtGQ_D96JkzWj1sVElVPg-tozyqk
X-Proofpoint-ORIG-GUID: 4SCJTtGQ_D96JkzWj1sVElVPg-tozyqk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-10_04,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=999 phishscore=0
 adultscore=0 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501
 mlxscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305110017
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVGh1LCBNYXkgMTEsIDIwMjMsIEtyaXNobmEgS3VyYXBhdGkgUFNTTlYgd3JvdGU6DQo+IA0K
PiANCj4gT24gNS8xMS8yMDIzIDc6MTkgQU0sIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gPiBPbiBU
aHUsIE1heSAxMSwgMjAyMywgS3Jpc2huYSBLdXJhcGF0aSBQU1NOViB3cm90ZToNCj4gPiA+IA0K
PiA+ID4gDQo+ID4gPiBPbiA1LzExLzIwMjMgMjo1OSBBTSwgVGhpbmggTmd1eWVuIHdyb3RlOg0K
PiA+ID4gPiBIaSwNCj4gPiA+ID4gDQo+ID4gPiA+IE9uIFdlZCwgTWF5IDEwLCAyMDIzLCBLcmlz
aG5hIEt1cmFwYXRpIFBTU05WIHdyb3RlOg0KPiA+ID4gPiA+IEhpIFRlYW0sDQo+ID4gPiA+ID4g
DQo+ID4gPiA+ID4gICAgSWYgd2Ugc2V0IG1heGltdW0gc3BlZWQgdG8gInN1cGVyLXNwZWVkIiBm
b3IgYSBTU1AgY2FwYWJsZSBjb250cm9sbGVyLCBJDQo+ID4gPiA+ID4gc2VlIGRldmljZSBtb2Rl
IHdvcmtpbmcgaW4gU1MgYnV0IGhvc3QgbW9kZSBzdGlsbCB3b3JrcyBpbiBTU1AuIEZyb20gdGhl
DQo+ID4gPiA+ID4geWFtbCBkb2N1bWVudGF0aW9uIG9mIG1heC1zcGVlZCwgSSBzZWUgdGhlIGZv
bGxvd2luZzoNCj4gPiA+ID4gPiANCj4gPiA+ID4gPiAgIMKgbWF4aW11bS1zcGVlZDoNCj4gPiA+
ID4gPiAgIMKgIMKgZGVzY3JpcHRpb246DQo+ID4gPiA+ID4gICDCoCDCoCDCoFRlbGxzIFVTQiBj
b250cm9sbGVycyB3ZSB3YW50IHRvIHdvcmsgdXAgdG8gYSBjZXJ0YWluIHNwZWVkLiBJbmNhc2UN
Cj4gPiA+ID4gPiB0aGlzIGlzbid0IHBhc3NlZCB2aWEgRFQsIFVTQiBjb250cm9sbGVycyBzaG91
bGQgZGVmYXVsdCB0byB0aGVpciBtYXhpbXVtIEhXDQo+ID4gPiA+ID4gY2FwYWJpbGl0eS4NCj4g
PiA+ID4gPiANCj4gPiA+ID4gPiBTaG91bGRuJ3QgdGhpcyBtYXhpbXVtIHNwZWVkIGdldCBsaW1p
dGVkIHRvIGdlbjEgZXZlbiBmb3IgaG9zdCBtb2RlID8NCj4gPiA+ID4gDQo+ID4gPiA+IFRoZSBk
ZXNjcmlwdGlvbiBpcyBhbWJpZ3VvdXMgaGVyZS4gSG93ZXZlciwgd2Ugb25seSBldmVyIHVzZSB0
aGlzDQo+ID4gPiA+IHByb3BlcnR5IHRvIGxpbWl0IHRoZSBzcGVlZCBmb3IgZGV2aWNlIG1vZGUg
KGZyb20gd2hhdCBJIHNlZSBpbiB0aGUNCj4gPiA+ID4gb3RoZXIgZHJpdmVycyBvZiB0aGUga2Vy
bmVsKS4gU2hvdWxkIHdlIGV2ZXIgbmVlZCB0byBsaW1pdCB0aGlzIGZvciBob3N0DQo+ID4gPiA+
IG1vZGUsIElNSE8sIHdlIHNob3VsZCBpbnRyb2R1Y2UgYSBuZXcgcHJvcGVydHkgZm9yIHRoYXQg
YW5kIGNsYXJpZnkgdGhpcw0KPiA+ID4gPiBwcm9wZXJ0eS4NCj4gPiA+ID4gDQo+ID4gPiBIaSBU
aGluaCwNCj4gPiA+IA0KPiA+ID4gICAgU29ycnkgZm9yIG5vdCBiZWluZyBjbGVhci4gVGhlIGZv
bGxvd2luZyBpcyB0aGUgdmVyc2lvbiBhbmQgSUQgb2YgU004NTUwDQo+ID4gPiBjb250cm9sbGVy
OiAodXNiMzEgY29udHJvbGxlcikNCj4gPiA+IA0KPiA+ID4gVkVSX05VTTogMHgzMTM5MzAyQQ0K
PiA+ID4gVkVSX1RZUEU6IDB4Njc2MTJBMkENCj4gPiA+IFVTQjNfUFJJX1VTQjMxX0lQX05BTUUg
KDB4QTYwQzEyMCkgPSAweDMzMzEzMTMwDQo+ID4gPiANCj4gPiA+IFdlIG5lZWQgdG8gZm9yY2Ug
dGhpcyB0byBnZW4tMSB0byBmYWxsYmFjayB0byBTUyBldmVuIGZvciBob3N0IG1vZGUgdG9vIGFz
DQo+ID4gPiBjdXN0b21lcnMgYXJlIGZhY2luZyBjb21wbGlhbmNlIGlzc3VlcyBvbiBTU1AuDQo+
ID4gPiANCj4gPiANCj4gPiBJIG1lYW50IHRoZSBkb2N1bWVudGF0aW9uIGZvciBtYXhpbXVtLXNw
ZWVkIHByb3BlcnR5IGlzbid0IGNsZWFyIGZvcg0KPiA+IGNhc2VzIHN1Y2ggYXMgRFJEIHVzYiBj
b250cm9sbGVyIHdoZXJlIHRoZSBjb250cm9sbGVyIGNhbiBvcGVyYXRlIGluDQo+ID4gZGlmZmVy
ZW50IG1vZGVzLiBZb3VyIGRlc2NyaXB0aW9uIGlzIHByZXR0eSBjbGVhci4NCj4gPiANCj4gPiA+
ID4gPiANCj4gPiA+ID4gPiBJZiBzbywgY2FuIHdlIHNldCBMTFVDVEwgRm9yY2VfR2VuMSBiaXQg
aWYgKENvbnRyb2xsZXIgaXMgR2VuMiAgJiYgbWF4X3NwZWVkDQo+ID4gPiA+ID4gPSBTdXBlclNw
ZWVkKSBzb21ld2hlcmUgYWZ0ZXIgR0NUTCBjb3JlIHNvZnQgcmVzZXQgaXMgZG9uZSBpbiBzZXRf
bW9kZSA/DQo+ID4gPiA+IA0KPiA+ID4gPiBCVFcsIHRoYXQncyBmb3IgZHdjX3VzYjMxLiBGb3Ig
ZHdjX3VzYjMyLCB3ZSB1c2UgYSBkaWZmZXJlbnQgcmVnaXN0ZXIgdG8NCj4gPiA+ID4gbGltaXQg
ZGlmZmVyZW50IGVTUyBzcGVlZHMgYW5kIGxhbmVjb3VudC4NCj4gPiA+ID4gDQo+ID4gPiA+IFRv
IGxpbWl0IHRvIGhpZ2hzcGVlZCBmb3IgeGhjaSwgd2UgY2FuIGRpc2FibGUgdXNiMyBwb3J0cyAo
Y2xlYXIgdGhlDQo+ID4gPiA+IFBPUlRTQy5QUCkuIEkgZG9uJ3QgdGhpbmsgd2UgY2FuIGZvcmNl
IGxpbWl0IHRvIGZ1bGwgb3IgbG93IHNwZWVkIGZvcg0KPiA+ID4gPiBkd2MzIGhvc3QgbW9kZS4N
Cj4gPiA+ID4gDQo+ID4gPiANCj4gPiA+ICBGcm9tIHlvdXIgZXhwbGFuYXRpb24sIGNhbiBJIHNl
bmQgYSBwYXRjaCBmb3Igd2l0aCB0aGUgZm9sbG93aW5nOg0KPiA+ID4gDQo+ID4gPiAxLiBVcGRh
dGUgZGVzY3JpcHRpb24gZm9yIG1heCBzcGVlZA0KPiA+ID4gMi4gQWRkIGZvcmNlX2dlbjEgcHJv
cGVydHkgYW5kIGlmIGl0IGlzIHNldCwgY2hlY2sgdGhlIHZlcnNpb24gKHVzYjMxKSBhbmQNCj4g
PiA+IHNldCBMTFVDVEwuRm9yY2VfR2VuMSBiaXQuDQo+ID4gPiANCj4gPiA+IExhdGVyIGlmIHNv
bWVvbmUgd2FudHMgdG8gYWRkIGNvZGUgZm9yIHVzYjMyIGFzIHdlbGwsIHRoZXkgY2FuIHJldXNl
IHRoZQ0KPiA+ID4gc2FtZSBwcm9wZXJ0eSBhbmQgZXh0ZW5kIHRoZSBjb2RlIGZvciB0aGUgc2Ft
ZS4NCj4gPiA+IA0KPiA+ID4gTGV0IG1lIGtub3cgaWYgdGhpcyB3b3VsZCBiZSBhY2NlcHRhYmxl
Lg0KPiA+ID4gDQo+ID4gDQo+ID4gSSdtIHRoaW5raW5nIHRvIGludHJvZHVjZSBhIGdlbmVyaWMg
Imhvc3QtbWF4aW11bS1zcGVlZCIgcHJvcGVydHkNCj4gPiBpbnN0ZWFkIG9mIGEgImZvcmNlX2dl
bjEiIHRoYXQncyBzcGVjaWZpYyB0byBkd2MzIGNvbnRyb2xsZXIgb25seS4NCj4gPiANCj4gPiBT
byB0aGF0IHdlIGNhbiB1cGRhdGUgdGhlIGRvY3VtZW50YXRpb24gZm9yICJtYXhpbXVtLXNwZWVk
IiBhcyBmb2xsb3c6DQo+ID4gDQo+ID4gKiBUaGUgIm1heGltdW0tc3BlZWQiIGFwcGxpZXMgdG8g
Ym90aCBob3N0IGFuZCBkZXZpY2UgbW9kZXMuIElmDQo+ID4gICAgImhvc3QtbWF4aW11bS1zcGVl
ZCIgaXMgc3BlY2lmaWVkLCB0aGVuIHRoZSBob3N0IG1heSBoYXZlIGEgZGlmZmVyZW50DQo+ID4g
ICAgY29uc3RyYWludC4NCj4gPiANCj4gPiBPcg0KPiA+IA0KPiA+ICogVGhlICJtYXhpbXVtLXNw
ZWVkIiBvbmx5IGFwcGxpZXMgZm9yIGRldmljZSBtb2RlLiBUaGUNCj4gPiAgICAiaG9zdC1tYXhp
bXVtLXNwZWVkIiBpcyBmb3IgaG9zdCBtb2RlLg0KPiA+IA0KPiA+IFRoYW5rcywNCj4gPiBUaGlu
aA0KPiANCj4gSGkgVGhpbmgsDQo+IA0KPiAgIElmIHdlIGRvIHNvLCB3ZSBuZWVkIHRvIHVwZGF0
ZSB0aGUgY29kZSBmb3Igc3VwcG9ydGluZyBvdGhlciBzcGVlZHMgYXMNCj4gd2VsbCAoY2hhbmdl
cyBpbiB4aGNpIHdvdWxkIGJlIG5lZWRlZCBJIGJlbGlldmUpLiBXYW50ZWQgdG8gbGltaXQgdGhp
cyB0bw0KPiBkd2MzIG9ubHkgYW5kIHNvIHdhcyBzdWdnZXN0aW5nIHRvIGFkZCBmb3JjZV9nZW4x
IHByb3BlcnR5Lg0KPiANCg0KSSBhZ3JlZSB0aGF0IGl0IG1heSBnZXQgdW5uZWNlc3NhcmlseSBj
b21wbGljYXRlZC4gSG93IGFib3V0IGxldCdzDQphc3N1bWUgIm1heGltdW0tc3BlZWQiIGFwcGx5
IGZvciBib3RoIG1vZGVzLiBTaG91bGQgdGhlcmUgYmUgYSBjYXNlDQp3aGVyZSB3ZSBuZWVkIHRv
IHNwZWNpZnkgZGlmZmVyZW50IHNwZWVkcyBmb3IgZGlmZmVyZW50IG1vZGUsIHRoZW4gd2UNCmNh
biBpbnRyb2R1Y2UgYSBuZXcgcHJvcGVydHkuDQoNClRoYW5rcywNClRoaW5o
