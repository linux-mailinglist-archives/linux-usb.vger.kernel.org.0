Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 094186DCF3A
	for <lists+linux-usb@lfdr.de>; Tue, 11 Apr 2023 03:27:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbjDKB1h (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Apr 2023 21:27:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229618AbjDKB1g (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Apr 2023 21:27:36 -0400
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CE85DA
        for <linux-usb@vger.kernel.org>; Mon, 10 Apr 2023 18:27:35 -0700 (PDT)
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
        by mx0b-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33AJ5i2P022290;
        Mon, 10 Apr 2023 18:27:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=g0XvpvfwkJAg9cY/SrmCN51Z22vDs70LDj/OWwW5v44=;
 b=Tmvnyj+IWCFPKe6rjl2ftZWnDRNJm7pLhRJruInPb4PaJ0yN0uZGoaxxrz9OLUxUeUY2
 9mTIYbF8wmdPYZVPEL2484/nPEZ2h+bn51ZX4ptG2Db2/QEa8GNoAqa2KtaCNoaJ9knv
 Yh71AeBljWrqpMk8ULDtHPS0uPsZdnTm4hb84AiQO0wKW0JRCfwZNeJrRyFmabNpMFyh
 VohtFr7SmM7jfaWe0Wmrt5tb47vrvgAPtHR/Z0xACW6xa1bAUET2bkiuo80l7DMY3cUW
 cxpa9bKnUVj17hTO57lizsA263D8uu/KkKFlQjBW0/l2veK7MA6Q/lg7X6h+KhA1qs6e jg== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3pu6wjb8u7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 10 Apr 2023 18:27:30 -0700
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E205B40095;
        Tue, 11 Apr 2023 01:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1681176449; bh=g0XvpvfwkJAg9cY/SrmCN51Z22vDs70LDj/OWwW5v44=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=KvLBdqltx/ul0bjYn9KSlmHcf7SA+wdALiRDmWMyuy9TpvvaB4nwJjgsduCucuo15
         ha6hwhpG4E+R3ylCxDIYzKcHXIKlW1YRRO8ScjVWqDtHjuo0Xi+mYHZ4LbJBLRPMDH
         se6Yw2IYpbI5XY3iZQzZ6UgV5XK2MwVxE6pu6v46FVOifRQ3enR41M4rtNMWnHfUoG
         fu+OoaiBlqMe3F9C0eErXYvDHkLUuIUTzuFu2Bu/djOkZBBMTji/dOLfkFIDWh7HC8
         HJSYRe6+X4SAJRdpTkmWNKt10oSz0wJ1JKB10yUk+9h6P/pwGFHr2udkjx4OUunAJe
         BJ1ypf5PR+Wsg==
Received: from o365relayqa-in.synopsys.com (unknown [10.202.1.141])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relayqa-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 52B38A0080;
        Tue, 11 Apr 2023 01:27:27 +0000 (UTC)
Authentication-Results: o365relayqa-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relayqa-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relayqa-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=Vnup4BGi;
        dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2109.outbound.protection.outlook.com [104.47.58.109])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relayqa-in.synopsys.com (Postfix) with ESMTPS id 6D8352279C2;
        Tue, 11 Apr 2023 01:27:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S5qF/R6FCbB7q96L3hbJDiolzKsMGqG99nQGMsNrxl1J6eJRvBDn2x4xFlZV6HIaGaNQITWB4x4lWjvoUqVSQ8lZYb0jIzmPpyHKxnKZoSq358Go5vVNWX++2AMsoPDzFn+aQz+hGoHBF1RLkCLxOX5YlEANr/DEon/v0Mvz84N+gSrLaYnjPSIXUgZcengqa8XMXHkSbKHG5eJPIfQWM+DQVenRV+T0YOTSyufkjjwuNX7dO7iJoe1opAmNBO2s5/gQ7jGVUrPGfwI0jJe6xwawlWAFh8cE+aVgGmwZGmU8YjmQ7LvydGgw6lJgcZtrSpEa9Lmf6lovoA5jt6BQ8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g0XvpvfwkJAg9cY/SrmCN51Z22vDs70LDj/OWwW5v44=;
 b=a0PCvaej8n39hAjrESjyjtnLWrwoyOHPMXwc08TBpBU9kqLzxBYMImDeqv8NlrYQcEiq3f1VVAvdbTszT15qWd4bBIO09Zd8byKAJENTsXOQFyyohirNbgK3hNxG6wYMzyfmeNsAHd/2ddiPyREg3yXM4HZD1aCuXNA+glQqjCS32sS30WsG/PNa9t3pJ5dl7P1oNdaMkb2LpuIdLS61MhVBDoDR3d8gTDwks7hW4/nAV9jktKasqZe2P+IY75kuBcoTSD37ddgobbHb4lvm4hBOHMWQpMf10mNjO6uTvUHwebdlgHqX0TRn5POafuQwOeh9uH6YROpWAt6M9pI2gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g0XvpvfwkJAg9cY/SrmCN51Z22vDs70LDj/OWwW5v44=;
 b=Vnup4BGiVM9pjXTQvA1mnAGKJH6LOduqgF4gQQWAQTR2/rMvXDjtntN/JOjOIbGWkwEheUZEUOVd0Yy28b044pRKU0uurOmWRoIPdpNPGuZipFsrMu6sCA6NSXv9LTTVCjZn98neaoKU2pMPv9r6MH5aeS8ehJ2t6j8F3a62IFk=
Received: from BN8PR12MB4787.namprd12.prod.outlook.com (2603:10b6:408:a1::11)
 by MN2PR12MB4549.namprd12.prod.outlook.com (2603:10b6:208:268::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Tue, 11 Apr
 2023 01:27:24 +0000
Received: from BN8PR12MB4787.namprd12.prod.outlook.com
 ([fe80::a6ef:a9e2:ad28:f5cf]) by BN8PR12MB4787.namprd12.prod.outlook.com
 ([fe80::a6ef:a9e2:ad28:f5cf%6]) with mapi id 15.20.6277.034; Tue, 11 Apr 2023
 01:27:24 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     =?utf-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= 
        <stanley_chang@realtek.com>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v1 1/2] usb: dwc3: core: add support for remapping global
 register start address
Thread-Topic: [PATCH v1 1/2] usb: dwc3: core: add support for remapping global
 register start address
Thread-Index: AQHZaRcy64Ak1IW6YkuqLSHQPwUUKK8gq+QAgANDlaCAAWfegA==
Date:   Tue, 11 Apr 2023 01:27:24 +0000
Message-ID: <20230411012721.b63dx3oodojby6lf@synopsys.com>
References: <20230407060703.19469-1-stanley_chang@realtek.com>
 <20230408020840.344xuicuqb4abtow@synopsys.com>
 <2e26b5005a4e4efa946cb04898779f08@realtek.com>
In-Reply-To: <2e26b5005a4e4efa946cb04898779f08@realtek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN8PR12MB4787:EE_|MN2PR12MB4549:EE_
x-ms-office365-filtering-correlation-id: 4df89eb9-d038-48e2-8819-08db3a2be7a0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wdNqnKCjDT7BECB5mkUu9lDkwJStuJRCUFtAQ61yXquq6NiJ4+ErduZGGwPyIYX3yH7bGKWRCXkvyL9A1dX247lDD2ik+bnJzI3XkrdNqvOW+vc/+dGW4S6rkvHTZOiLTcyDsTCUbDovLwwG064pOkoQWyAkVc1RRrkwVh6yeRJzmV+8fC/jU6eou5J5AmWfJOJ4iucjkCwqG4sNS7VvegoGy9I0imInq/s3mJW6ZNAvyJGyJ4Ov14xuauiRrcEGX70Yi3O3WoPJc3PytVf0IY7H6bgGv1ir5KkYvagff9jJNRfONu1/vslOtj4y7+rg6ylJHRikPom9Z/9LZMzzHz/ZJVajC41hxRQAgfxIZT89mC3RjmllIJeWrIwCmaFJ0//+zf67YAkRV+YdkCPXLAxudTSyrNxa6K95n9wujRB9EFIBPHWlk6XErSCrubEE8I5q3jh7lVUw2vLf6MLFC5ZaZ6ud8rG7cZ/DO0615nlRrkj9P/LbHeBbNMaHOtON01+ypU3DUrIF4jsr8RcbAFq1kmzygf1PlPh2/BXfoVSkfdp2vLA2gF3MuAhUMksl7NHpmukxYIZuVfocYOlk+Gski/rmINsnMJLMnc0Q6gWlQ1y0CyhtLbbUTkQfC8FJ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR12MB4787.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(376002)(366004)(39860400002)(136003)(451199021)(71200400001)(478600001)(1076003)(6512007)(316002)(26005)(6506007)(186003)(54906003)(6486002)(91956017)(2906002)(5660300002)(4326008)(66946007)(76116006)(66446008)(41300700001)(8676002)(6916009)(66476007)(64756008)(8936002)(66556008)(38100700002)(38070700005)(122000001)(86362001)(83380400001)(36756003)(2616005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WndkTlNhVmhIemZudmNmODlweExKYVpqN1ZZTkxKbGdtSTVJVGkvMVZ0NXBi?=
 =?utf-8?B?aThoWWw0OStjVnRPb3JYcGRaMGtyQVVQRnR1Nk9mYmFKL2tVMWhrenNOZXlW?=
 =?utf-8?B?cm8xaFI5MzIwRzJFb1M2OXFKem43ODJhMjZ4a3UrRittQU5VR0ZNTXJ2Y3VW?=
 =?utf-8?B?KzBwUm5hQlZ5OTJNV0d6SG9BWGE4NFR4RHFZYm9kdURwWDBsTHZaZDkrL1lp?=
 =?utf-8?B?cXhMM2hQUlJpcWJ6K1B5ekJWcVMyL1pKUEJ4RkR4Z2ZOR1ZMUkhwZGNuNkxz?=
 =?utf-8?B?UDQvM09PZkU2NVdrcE9HK3VndWtCcDVpNE83U0QzRE9NSkgwaStnRXhUd2d2?=
 =?utf-8?B?UkF4OURnVmk1bXA2V3AxbFpnNHRMZzluUjZFWEtGSWNRUGtVSjFJQnd6Zk9K?=
 =?utf-8?B?WUFZTVBQMEZLb2pnOGwvQ2FmZ295MEZ4WXV2TVZoc2xRK0I3aVhqaWszRGJN?=
 =?utf-8?B?R2lUUThUU1VPcnkwRDlUeHlkNldqVG5xeFVjT2xXQWw0MGV0MkFFdytuL2dB?=
 =?utf-8?B?akRrNFZub2haOTJFbjVmYVZPWmtLbEFKMWVPNkRSbU4vVVQrUmZqbVNhZml1?=
 =?utf-8?B?eDZTa1BOS2JTa0s2ektLVlFMNzJ6dnc3cGFRLzJ0NW1QaG5DTFVxRjRlWW1q?=
 =?utf-8?B?R1I5dTA1M090N1oxSVFieHVsYm9aQlVzSmNLbmlXdUlNSS9ISnpjZXI5Zk0r?=
 =?utf-8?B?a1dWUVM0SkRtVFpYYVBKRnFvSm9Pby9xMjZaQnA2UFl1bDRENFR5NC93SWxH?=
 =?utf-8?B?RTFTWWhUVXBsaEVNNGVmanZCczdVNEprbDEyeU85cXNYZUdtTjZ5TjZtcnNp?=
 =?utf-8?B?TnA1RjE2RlowVjQ5a2EzZ2krTUN2WjFYakkxdkY5dHBSYnVVcFdqMGw5N1JE?=
 =?utf-8?B?cHJLbFc4ejNNS3NudHN5bGJ2akFONENnYkpvMzRObmgrVnd4QUp3ZkllRy9V?=
 =?utf-8?B?em4rZ004WHlxazg3cE42NUJtdUxvenNTVFp4OXV2VnkvKzlhb0M4dHpZS0Zh?=
 =?utf-8?B?UW0xNFVKRnRZMDFjUGpzMjVjWmJuSElJaFBpb2g2Mk5lZHpES0k3VW5tNGUw?=
 =?utf-8?B?b1NhUFdweEVoQ3RROWNrR0ZoYmx5c2xPMUgzZENDNmFwelN0Yk5ET09mYnhi?=
 =?utf-8?B?R1hsUThvejJ3cHlCN0E3eHd3WFdGWm9BcUxQbEI5QjVQL2VVSUQwVmNqVlZl?=
 =?utf-8?B?WHZiQlRRdXFhcDZvb3RwMXplVVlJclpMc3E1NXd4bjU4eVd6WjVNbVVNdkNQ?=
 =?utf-8?B?OVJLaElKSEYyZ2NxSitWUXd0UEpWZVhwSllodU10VUNHZEkwMGkwUVJMREU3?=
 =?utf-8?B?a0RpWGRHdS9PMGNwYkJISFpMYi9uYjI0TnVMY0svbHJEU1FpdVZvWTdsOWJn?=
 =?utf-8?B?NWk1UjlhRnBkNmNmeEd4RmhUcWRpVkRXcytwVmgrUTZxelE0ZzJBT1NrZER6?=
 =?utf-8?B?WkJZMDZMRVZ4cXh2WmZOVXNPWHpac1dyeGFMNHJhMUVLMExzUVJwYjdwRnZQ?=
 =?utf-8?B?SGtuUnhmdkljTk42U01rNm84RXo4T09SZUJ4ejRZRk1MUWY0YVNpLzdvbmJR?=
 =?utf-8?B?SlVlbGtHbk54b3c0ekVEcnZmdWxmQmRBeDBHdVFsdFBmL05nM1dGcFZVMmJ6?=
 =?utf-8?B?SjA2bWhCUldCdHpHcFpNNzFUSk4vZTkzd2V3SHRhRGQxRmpZT21RdDlSbmlh?=
 =?utf-8?B?MXVWYThPTUNhcGNUaXNMRkNXaTBSL1F5Vlc4dmNvOUxPVXRwaE1LdXowQVAw?=
 =?utf-8?B?eXZScTAzWHVTMysyTXF2THdyVDd5WklneUdvcDEvTTUwVnE3VURHSjZLdGJq?=
 =?utf-8?B?VzhIajlwNjhIdEU1ZkRXMzg3Ky9lUGdxSUgvandhWE04V3BYUUVOWWNFY2V4?=
 =?utf-8?B?bmRtdTMyMGNWTGdjeUFyNEhCNDFPMTVVemlLZ1Z4UHIrcU8yRXFlVUxuQXZk?=
 =?utf-8?B?YWxaeDRFb0lJL1dRQUtVOXFueTg2cXhtQ2ZKUGNZWXdXaERRSU9XVFFpK01H?=
 =?utf-8?B?UXhLU2dyODRueGZwN24rQUEyei96T1E3SERNNTlBUjVnV1ZoWEpNcWxwVXFY?=
 =?utf-8?B?L2pMOWZ2VXE3ZktPQzU4b08yQkpGQkR1SzFOdGZLemtVVXM0STh3MWFLY0Nh?=
 =?utf-8?B?K3ROcjlKK1RqQlFNN3RYT2Y1aFFsL0pqOEprZVV1Sjd2M0VqUHdNc0hzbXVu?=
 =?utf-8?B?Wnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6525C6A68D53EB4285DCADEB2B31CDFE@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: FNI8AOgQ9kO2DkYIr0p7r0TI5e1SfECQXjK0w5Yo+ULN4B9MNOevryfDjjCkqnK3jmDaMcYbnmjGkq5WNK4Dtdx63F7A13jxkzzONlqmHGT2q2meDMg56ZlebaXDgVe17qxG9KjqwehDIZDxqoCPVWcXeBmSZSSiyc3dLVpTdzpbQPyWemTb0FxJmCLR9FEHvntx0ehpfjJMyNXi2O4aVecQgJHa3HwbrNByO9kXb9yXDdVfR46DYMxR+leJFcABhJEH3zceuBj/OctHeLbelmgR+hwwKtS4F79LBUX9WPZJezkc0njLeDsf5GB4c0C0+q3yDN/S2iOPNCf3nEWwdP0IzSvmOI62e6ukVs+47SeVGwXJ0kZCuqmFazshPZvuQPU6GTNAq2eTBl/GW20wWsqfmL42NBHTZipzMIblRXKJtwt0fAkKbrGkREJWE3z0UvrU+bDGB65Vhtn/7wRRemBW7BKP6uU7vy1tHZAt1vhMJbEt652N6Mgri4mPGvFvEzEHRIXqqtPK1MTPJgWh4WRzIXBUXPpWkHez7DSNnjC9SwYeBMCw/N4tzsB1GTCs0GLg5U8awgce9lwBxgmVodKfI9ASBEAOrGJJdQiXwfxjFWnZ9twjCKpbASZNoXNVR1rFLtSavJg1jfHOmqPv62EFoLKEVDK9WA+Lo34Lzq9864GJei/9+LPlqvnkqB7l+Lm2R2JTeupTBIBVPs2Jn+i5rElw8pfQpXdcMFCe9K90Lf6Gh5RuRLerpLnlBrSSbpDwbImvM82yMvnVVLONJ8hdU42FGeYiQMk7NwIrsn4256koTdYgynHb2gFIxpGmR4DeIep/LYWU3BHpDUrDMQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB4787.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4df89eb9-d038-48e2-8819-08db3a2be7a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2023 01:27:24.6948
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FnjyL1M28krSkggo748dM1UNWKZpGzVVAwp/cx/qbv4riMB5pjnOCdVSOsVwFmDFyXE9UlfUi3dODbd/BAN4XA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4549
X-Proofpoint-ORIG-GUID: 5kBbRNcB5JujD1olgz3tc2uxWgEI5m6E
X-Proofpoint-GUID: 5kBbRNcB5JujD1olgz3tc2uxWgEI5m6E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-10_18,2023-04-06_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 bulkscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=999 malwarescore=0 phishscore=0 clxscore=1015
 suspectscore=0 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2304110011
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gTW9uLCBBcHIgMTAsIDIwMjMsIFN0YW5sZXkgQ2hhbmdb5piM6IKy5b63XSB3cm90ZToNCj4g
DQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMgYi9kcml2ZXJzL3Vz
Yi9kd2MzL2NvcmUuYyBpbmRleA0KPiA+ID4gNDc2YjYzNjE4NTExLi43NzFiMzU0NDkzNzYgMTAw
NjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYw0KPiA+ID4gKysrIGIvZHJp
dmVycy91c2IvZHdjMy9jb3JlLmMNCj4gPiA+IEBAIC0xNzg1LDYgKzE3ODUsMjMgQEAgc3RhdGlj
IGludCBkd2MzX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UNCj4gPiAqcGRldikNCj4gPiA+
ICAgICAgIGR3Y19yZXMgPSAqcmVzOw0KPiA+ID4gICAgICAgZHdjX3Jlcy5zdGFydCArPSBEV0Mz
X0dMT0JBTFNfUkVHU19TVEFSVDsNCj4gPiA+DQo+ID4gPiArICAgICAvKiBGb3Igc29tZSBkd2Mz
IGNvbnRyb2xsZXIsIHRoZSBkd2MzIGdsb2JhbCByZWdpc3RlciBzdGFydCBhZGRyZXNzIGlzDQo+
ID4gPiArICAgICAgKiBub3QgYXQgRFdDM19HTE9CQUxTX1JFR1NfU1RBUlQgKDB4YzEwMCkuDQo+
ID4gPiArICAgICAgKi8NCj4gPiANCj4gPiBQbGVhc2UgdXNlIHRoaXMgY29tbWVudCBzdHlsZSBi
bG9jazoNCj4gPiAgLyoNCj4gPiAgICogYSBiIGMNCj4gPiAgICogZCBlIGYNCj4gPiAgICovDQo+
ID4gDQo+IA0KPiBJIHdpbGwgZm9sbG93IHRoaXMgcnVsZS4NCj4gDQo+ID4gPiArICAgICBpZiAo
ZGV2KSB7DQo+ID4gDQo+ID4gV2h5IGRvIHdlIG5lZWQgdGhpcyBpZiAoZGV2KSBjaGVjaz8gV2hl
biB3b3VsZCB0aGlzIG5vdCBiZSB0aGUgY2FzZT8NCj4gDQo+IEkgd2FudCB0aGUgdmFyaWFibGUg
ImZpeGVkX2R3YzNfZ2xvYmFsc19yZWdzX3N0YXJ0IiB0byBiZSBhIGxvY2FsIHZhcmlhYmxlLiAN
Cj4gU28gSSBhZGRlZCBhbiBpZiBzdGF0ZW1lbnQuDQo+IEkgY2FuIG1vZGlmeSBpdCB0byAiaWYg
KGRldi0+b2Zfbm9kZSkiIHdoaWNoIGxvb2tzIG1vcmUgbWFrZSBzZW5zZS4NCg0KV2h5PyBJZiBp
dCdzIHdpdGhpbiB0aGlzIGZ1bmN0aW9uLCBpdCdzIGEgbG9jYWwgdmFyaWFibGUuIERvbid0IGNy
ZWF0ZQ0KYXJiaXRyYXJ5IGNvbmRpdGlvbiBqdXN0IHRvIGxpbWl0IHRoZSBzY29wZSBvZiB0aGUg
dmFyaWFibGUuDQoNClRoYW5rcywNClRoaW5oDQoNCj4gDQo+ID4gDQo+ID4gPiArICAgICAgICAg
ICAgIGludCBmaXhlZF9kd2MzX2dsb2JhbHNfcmVnc19zdGFydDsNCj4gPiANCj4gPiBOZWVkIHRv
IGluaXRpYWxpemUgdGhpcyBpbiBjYXNlIHlvdSBnZXQgYm9ndXMgdmFsdWUgd2hlbiB0aGUgcHJv
cGVydHkgaXMgbm90DQo+ID4gZGVmaW5lZC4NCj4gDQo+IFRoYW5rcy4gSSB3aWxsIGFkZCB0aGUg
aW5pdGlhbCB2YWx1ZS4NCj4gDQo+ID4gDQo+ID4gPiArDQo+ID4gPiArICAgICAgICAgICAgIGRl
dmljZV9wcm9wZXJ0eV9yZWFkX3UzMihkZXYsDQo+ID4gPiArICJzbnBzLGZpeGVkX2R3YzNfZ2xv
YmFsc19yZWdzX3N0YXJ0IiwNCj4gPiANCj4gPiBQcm9wZXJ0eSBuYW1lIHNob3VsZCBiZSB1c2lu
ZyAiLSIgaW5zdGVhZCBvZiAiXyIuIEFsc28gY2FuIHdlIHJlbmFtZSBpdCB0bw0KPiA+ICJzbnBz
LGdsb2JhbC1yZWdzLXN0YXJ0aW5nLW9mZnNldCINCj4gPiANCj4gPiBUaGFua3MsDQo+ID4gVGhp
bmgNCj4gPiANCj4gDQo+IEkgd2lsbCByZW5hbWUgYXMgInNucHMsZ2xvYmFsLXJlZ3Mtc3RhcnRp
bmctb2Zmc2V0IiBpbiBuZXh0IHZlcnNpb24uDQo+IA0KPiBUaGFua3MgYSBsb3Qgb2YuDQo+IFN0
YW5sZXk=
