Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68201754505
	for <lists+linux-usb@lfdr.de>; Sat, 15 Jul 2023 00:38:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229991AbjGNWiz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Jul 2023 18:38:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjGNWiy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 14 Jul 2023 18:38:54 -0400
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67B2E30DB
        for <linux-usb@vger.kernel.org>; Fri, 14 Jul 2023 15:38:53 -0700 (PDT)
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
        by mx0b-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36EGip0s011270;
        Fri, 14 Jul 2023 15:38:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : content-type : content-id :
 content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=FxqiPjgmfDZSZPkn1KDfV/VgQ+ebeYO8gVIgdMOqxMo=;
 b=dercSL1U1OIPHSJsnmRITCHOvz+EM6tzMVMHBM1Z+M7eDFgbc/rkKHFWYpAk4ivHEY5n
 /xJbjjT4mMD7/czIVyhbWDfKOFdr9zQBBOMuERvz2mAIphNi09p+7WwY5VPo0ZFrEF8H
 DACViFKbavOAS2yPXnyFymcne+jseyMLmv/wFUSkAga1fhUKGVh2IwCEnfWA4Pscv1IQ
 Bm2hGskUJkFrih0LHGpxLIVhcnhEM8YlNINiEQPT4quAVZvubo0RwrURFUuByyXTkrgN
 /QgSwFzEVGxsJ0Yr5jGPzpKcjP76JtC4gJq4BMsiM1vgq/X3ab1AI8NWv11uEH5JCe07 ww== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3rtqq8dxme-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 14 Jul 2023 15:38:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1689374330; bh=FxqiPjgmfDZSZPkn1KDfV/VgQ+ebeYO8gVIgdMOqxMo=;
        h=From:To:CC:Subject:Date:From;
        b=ZlhrTXnnMcRM3AnU4aqFvvL+dRrrv+yONPnsTxQ9khZNpuV8cOYAnhwnIyvuwALtK
         WmysvZZF7U+xZxEFHaMHew/jnxPgpMCNmde/+9weeYGEKnbZkdlmv7/lwbapAK7UHD
         /7/L3G1PZChu7RFPOVwld9eQPlePvJAZNKbKjIwOeFi2beUksuUFemAlAGGYjHvJlx
         HLM4Kt4W0yScVrdEw/vusQhsCtkdDGD4SAQT+1JujyTZFSZ2v+hpT//sMPLR7zSYUX
         dlPSdBeaI1gZ9hzgYgvDrSLaVUU3CNY9CBWbIlmwGFhStHEjVRtpuzMCHLsg4O1tUJ
         3YL1vMoAEhx9g==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9CBAF401D0;
        Fri, 14 Jul 2023 22:38:50 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 73A0EA008D;
        Fri, 14 Jul 2023 22:38:49 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=ISlr0hET;
        dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 6A6C0401CF;
        Fri, 14 Jul 2023 22:38:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IoW9ZFlLde9/f66ZKqHPcMbLLuucJpz7IZOJx1JzVhhtcrRpE/Ig5ab1FuoGFSlaZo3GvBwh1g5oweiI0WY/fBGeSe2Hgcz+nL+XUTllgAG5GLMvw1vvx7M2AmvtGGTlNga0/dxQSGHM75n1wqFvbghX+qzQFdCdSg2+DwZct2AK9iGA9PcGE/7RjteXi3OvPSOr8fLFBivC1Tz0B7g+JWUziGTj8HasdMnN6U04mbmy+KVRoAg8cdNeyqR/sunxz7EOa64mZ9/KvIW406HSDITGoH9pwwn2u9TL0TnTemTckdslAB3F9ZTNT/0iH13hVyL1BVau6eD7mkMy4i7V9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FxqiPjgmfDZSZPkn1KDfV/VgQ+ebeYO8gVIgdMOqxMo=;
 b=Hc3IS7pWKqn5YySMZrk9Bsq6VNZaXxHKblK5FCQOBCP9TWNx5aN50j5RWGtTF2225cGfe3Bo+pg4lHwo8V6EixZ+Ptx6mQgjnsg4CwCk5cz2Ikq5LswWU96QkxdHMHh96ejPMqJU4zL4kcqYi/2VjXjOxMOC8tL86BfYmTc2RfWckqX9Gwo3kYcJSoC0xdxHGwVl4OiClfZnsPXbZz3W/aECNYzr29B+XhoxQm/4oV/CBJMhcIsgYg3EkhMoJuybk98Uxj8BzT3UMP1MfmDvve1PP2q8enPj2f3KCmoR67HbXoMm1AfxDAFpUwiVh4nJOr4qGiHo1o9yBo+aJrXjqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FxqiPjgmfDZSZPkn1KDfV/VgQ+ebeYO8gVIgdMOqxMo=;
 b=ISlr0hETHLjIel4bxv5t3pQ0Ft/pmpSOonjZm1X8l771JkdM+YNqV7gRLKgQAWOR0F1lY/gKX3roefxF7cvciXiAP8VQoDJUPiEZUYQqBg6TZAR80VS4vkvAxAvKvZ5GRUoljJFGhrcIILSHxcJHib/Z5Z0kh0lk5oMbAxagJdc=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.28; Fri, 14 Jul
 2023 22:38:45 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::adba:1075:fd90:fe1d]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::adba:1075:fd90:fe1d%3]) with mapi id 15.20.6588.028; Fri, 14 Jul 2023
 22:38:45 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     USB list <linux-usb@vger.kernel.org>
CC:     Greg KH <gregkh@linuxfoundation.org>
Subject: usb: dwc3: Init vacation mode
Thread-Topic: usb: dwc3: Init vacation mode
Thread-Index: AQHZtqPyS9ZlmkDNiE69NmvPjxwclg==
Date:   Fri, 14 Jul 2023 22:38:45 +0000
Message-ID: <20230714223841.nw3576sia4aw5ryf@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|SJ0PR12MB5673:EE_
x-ms-office365-filtering-correlation-id: 4831c0d2-3bf0-47d5-d18a-08db84bb1554
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ccEI3ARgS9JpKDP4xOaGt3gTN2AX0njeTYazOlHQxip+3iV0NULF2llRD8dBSoTkfpjTNtKf4uT8hE7us2AWSAmdZtGNPFkeiA5g3k5Vem5uvCnVy3dKOE8xqmDvTI4hZ058dnaj21xqR1RTjY81A1wRdNLjDkMtjkdxKf53bxIskqQTarpudyrpOP0b8KDA0lk1KJDwnwZGG+zryNPMm5xVjJEI8nrcOkM0aFdtVaFqH27besZKqH4Rox0WK63+zLCeZA/OWJHQDLBySrTXZuKdbIjxn/aucHqwZ4Sw6I4EM7p5Azmx5BugeajrdRxsJDjXLv1Ex9EKsVf3jdDvocjsaujXnTHShUFVF5eFUIMwB0j9WkhutWLPZMWSkdaayQgCpDX0pyf6uLRHuzu709dJQPauOTCTqX33U1oWm3Nj0hVPV4ufwCK9NSh6/bLRYLhUFdl2lrYFX49vTCbH2rgoPzjWUZiaCu2AO0eF3l6pVTV472CP31DW4Q+X1h73ViJHGIi9D5PPi7eR7t/h5S8fSWzbQ4WdBAob5hOPfpZshn03L/Tv0A5xyOJdSxVqd2e+KGkzRzgEc/inGrg1BciiYbaQgUye3xVaM3Yw4qE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(366004)(136003)(39860400002)(376002)(451199021)(2616005)(6486002)(186003)(36756003)(83380400001)(558084003)(26005)(1076003)(6506007)(6512007)(71200400001)(64756008)(66446008)(66946007)(66556008)(66476007)(4326008)(6916009)(76116006)(478600001)(122000001)(316002)(38070700005)(41300700001)(5660300002)(38100700002)(8936002)(8676002)(86362001)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MjZoeWJPN3hHZ0JUZ3dwZzFSOHJGYTBFSGh3WFRDbTJCbTQwLzhpL3RIN1dn?=
 =?utf-8?B?NGlleWNWZU5BNnNaMUhqaDg4dlgzTVlUQlQrVVhvVG9OMDI5ZnUyR0dwVDlS?=
 =?utf-8?B?cDFabit0M2I2dEMwaGhrSTVrR2JzajV4UUZ4WmYyQzM3bTNyckc1VFlaQ2I1?=
 =?utf-8?B?VTF2eS9wUk50aTZBNmh4UkltOWN4YzhZaWxGakp4L3RwcnNTVUpEU2xGQm5z?=
 =?utf-8?B?bm1wRitnSG5wWUFQbEtpblQwdW5NM0NQOFR2ckkyaFYzdXdCZElSNEFacERS?=
 =?utf-8?B?Z09ZaGUxbkxBZzd3TmwyZys0bThwWTFuVVkrV1pjVkFRTldSZXltcU52UW40?=
 =?utf-8?B?UlVpbmYvSWJpYWNVM2c2N3Bhc2dGeHlZOWRYamVoWFdNU0pFYnozbmZaNU8z?=
 =?utf-8?B?eU96WUcwdUhFSi9GeEQzNUVBNmlROFRBa1I0V2ZtTUUzZlNJVTJtWklnOXV0?=
 =?utf-8?B?cXVlaVNIK1dDMVJMRDZKRTFNUVVsZHM1cmNCc3R4aVV4eVowTVl0TVprbnhK?=
 =?utf-8?B?Zm5EZTRnV1pTVC9leW16bnU0WnZ5ZHJzQnZLeXpUbmFkaTFoMjdrQlBDeXVN?=
 =?utf-8?B?UGplYzc0N0VweVpLL25HdXlHK2M0N2EyeVU5bE1PVU1QRHZvVHllOC9lQUFN?=
 =?utf-8?B?emxoNmFmVllNeUpOMWdQVHZkOTRvaDA4Q3pUbDBhbi8yN0VMVHZyNFV6VDNv?=
 =?utf-8?B?RDRLazZ4Tkx2Zll1WFN5d1F1c3dQWURkOGxpTFYzQzJXZHBlT1FIUTQwRXBi?=
 =?utf-8?B?QWM2ZGZLNXJISjZJMld0SW8rK3UwRHZzMlgwN3kyZ3ZaejI2akR1Z2NvdU5O?=
 =?utf-8?B?SHZxVFdlbC9WbExna3VoM2h5U1FZTmRoSCtsZ2lKTjVPT1ZMd3JQdnBoUW1S?=
 =?utf-8?B?cG85UXhqbXpHR05aUnpGRHUwNHBmRXdvWlF6eGxtUDRYcFducTN1allTNm9C?=
 =?utf-8?B?WUk1c1Z6QUVmUi81MDBlcmYvbCs3QnpQaUVPekZrbkJNdldyL3RmaGRScmdu?=
 =?utf-8?B?MUJQNVVldUdhRE9BSWJIVmw4MVBkNG5GRExTNEorcHAyMzRGMXhSbXBjQkJ0?=
 =?utf-8?B?UkNyQ0FBQWZrTEM2VzhKdnJNWUpFVjYxUFhTT1pGeCtQbXZVWk5VT0JaZUlL?=
 =?utf-8?B?ZUZza1JTWEUrWE1FQVUySUxSMjJwRmV5ME10WmFpN1ZRUHliSVZnVG9iRWNH?=
 =?utf-8?B?RGs2OWlLUVJYNDRyLzlIM3c0aHVjdXFPOWhVKytaVm9qTVQ3Z1VINE9QTTJj?=
 =?utf-8?B?VldXZHlwcVdmWUFTbmNiQ0pZUzhjUU9yNkEyVTA0Mko4SVNqbGprQmE4ajUy?=
 =?utf-8?B?bWdqM3BuYUhGTTlzVFYzZ1RVbE1qeDN4bjVrQ3pGNDdwMmZ3Q01pTk9XWVdZ?=
 =?utf-8?B?ZGhMRzdCSTR0RXNKd28ycGZQV0dHM0hFZzRibnFtRFpsLzhjcFo1N0FLTjVk?=
 =?utf-8?B?SHhWZkNUSGV4ekZPQnoybzl0RUxlU0tBdDBPU2EyRHpJNjlqUXJyRlo2eG84?=
 =?utf-8?B?VkkvS3B1c1lhU0x2eEJUNmNzbk5JUmFCVmE4NlRvSnVCSmhWOWpZV2h4VE81?=
 =?utf-8?B?VytUUys5cmlNZml3NDZmWi9FYjlVN0FpTytFRFFXVysyK2JGRzZKRTV2MVpS?=
 =?utf-8?B?c0EremdPaDJLWCs0Qnd4djVGQ1JwOXN4V1RrNnVKWUZwUTBwTFhxaUpZVy9X?=
 =?utf-8?B?SkdWNWgzbUJpa2o5TTQ4d2F0ZXpPbEh6THZMNEVUR3VtSWp1ekVreXA3TEUx?=
 =?utf-8?B?RWxBY3NVd3VRb25MYkZSdkdVcTIvWnczdk43N1RJQzVwTVZTVUFUWTJkZS9u?=
 =?utf-8?B?NThFczM2ZWwyeVhBamJIeXJCT3lCaTQzcHBZbUt1RFhYTFE3YjY0WjdvTldr?=
 =?utf-8?B?Q05pd3FYK1c2cVFGdVFFVFREcS9rKzkzNVRpcUptUk5xaFhlWktmTFpJRXZu?=
 =?utf-8?B?ZTdiTTJXVlJHcXVpSWhnUGd2WHdFZ2I0SnZ2OEdjZDk4TW90UlBBSDFlU1ln?=
 =?utf-8?B?YUlOdExmRFZRcFBZcERycEYxS2FaS2dJWnJSam1IY1RhSUo1dmF1NUdBckk3?=
 =?utf-8?B?U1lwbkp3Y0QrUjVOcThmOVV6blNCUnlCanNTbkJIZGlYd2cwUXlrZXNZNGJK?=
 =?utf-8?B?R3JrQndnN05UK09vMjZYejM5b21wN1R2UEt6ZEdEaDU2c2h2OHlMQWtoWHFu?=
 =?utf-8?B?UEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <336567CE19D0E344B104FF6374738247@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: mpfzru/J67wu+BTVgSTQuZAM3iiXqm2cFa80UWQB6JtquY/iYQgIxdQeJybcLVJ1rzMeeifjONoNhMQU2nnsyLtF2lz8pXNe+aszxFt87TTXcRfGHUAqRAwRkjZohZ0uJTMoH4GZPs4Q0No1q50FA6wa+GGFSdFYGpXEETutL7ofgP2dXNWVGJIhJz8I7OIlilpMTtfgMfFp6NbjCk71p6BL01t0VdtqB1+7q9GsEvoIVgRHLNtnuFRli8uu3RRtE/FRQuSraKKtYuStpl++2vhqEg1Rfas2O7/1am3vhrnI6sqwzOx9DHtHsa8CN2PVG0Ue3ZxDXvgJvarJMinNaZUf9F9uVUdM0ciFBCUC8jY7nh9IliX5Vt3ZDgR94hXpxb/BP35Gi8nhA5POThAx7/BuFWwQXakYHLOYPvyVThS+jRD18JBWYUWnPLnAWUrYxw/4wt7VHBOk+0jD8f5TCe8G2kVK8qLWEJmqDpdnvbs8c3F9sZH9tsKMwOUqTRAdSygxibiwtwkfQXYQDbmu6PONMhx3lknZoP4c2Wj0hSd99YKNl/eYy3fclsYf46pvzoDD7k54TKCojDa3YDjQFwe8vWLqhMS5FAybGzIN2wJkyCpVsN7KDNp2Ksl/RFTrnNI2wxJziFNbwW5yMahtCHnA//2U72i8yo6JLJIyGonl95OTMN5IXgFgQGncWyDixv9at3J+eyYHb2/JnP7SONkR+bZN2G0sStJm9kX2tSj74G4Gmj4WIKKEB46/lhEgPyB89thDyzy1Bm1Lthv4xdu7pmsKp9sZqdkxhQ9RRlvuzSn46TJIQAmcuGGJWwIZRWuHCqJok1J0WR3p29qs69z1blOTdkv2f373beqJ/bw=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4831c0d2-3bf0-47d5-d18a-08db84bb1554
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2023 22:38:45.4416
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gsQ64FktFCr1JkOYgzKUyU0aywsGVMAo9hGDWQah9+1BTPdhsFNzRmhjRxF8L3feLdFxqyciwaWBo43xfB9W8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5673
X-Proofpoint-GUID: 4wpslO9kGmz-bHwGZ37HnMIO5qWtbO8l
X-Proofpoint-ORIG-GUID: 4wpslO9kGmz-bHwGZ37HnMIO5qWtbO8l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-14_10,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 mlxlogscore=381
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 spamscore=0 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2306200000 definitions=main-2307140207
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNCkknbGwgYmUgYmFjayB0b3dhcmQgdGhlIGVuZCBvZiBKdWx5LiBNeSByZXNwb25zZSBt
YXkgYmUgZGVsYXllZC4NCg0KVGhhbmtzLA0KVGhpbmg=
