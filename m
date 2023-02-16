Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90836699FAE
	for <lists+linux-usb@lfdr.de>; Thu, 16 Feb 2023 23:24:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230002AbjBPWYF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Feb 2023 17:24:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229961AbjBPWYD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Feb 2023 17:24:03 -0500
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADD6A42BEE
        for <linux-usb@vger.kernel.org>; Thu, 16 Feb 2023 14:23:42 -0800 (PST)
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31GMGcEJ004319;
        Thu, 16 Feb 2023 14:23:18 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=ZDThJ7pHSpFyNX7nqiNxAVS7tz07VRSihO6JY7ZU/os=;
 b=k8SQsSiSji4CQnQsq76A3lUPIOSp9BozgAYa2Tdr3CKsAT5Fmpo5LDV0/ClYJiXQ3zax
 Yu0foGb8npDHYnS2lGd+daMjKer+icSunL5eWAQLhUS+LETGonk5jR4yoj8pixt8ePi/
 bwVYGiSpo+25Kx6FaStXczpuHaVHh3JVq5dWb2TQXokzOnA6hHtP4xfdRtoESDY++5R2
 5BVDU27jqs64rs4TaLUm8ygZzLlU11FFyGu9I/yzv6bOAJkFGlJQJxeiuxhHrhvHUHCL
 t29r16Et4V108rkg/NpdKoo7IYiisKIn0viLMkhcmt/DswnO9q6W1AKA4JKXkoTw6eiV YQ== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3npau0fp9n-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 16 Feb 2023 14:23:17 -0800
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id CB5F1400AF;
        Thu, 16 Feb 2023 22:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1676586197; bh=ZDThJ7pHSpFyNX7nqiNxAVS7tz07VRSihO6JY7ZU/os=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=kSSPU1bR4U1iO7Yxhkd3MdHQh/E2mZDANKSEjEju+qDjinQgLH9TEnIij7eHAl10b
         n+wlJj+wiwIgFFVQOz6u89GUVCH/Z3B5t3z/6EyFxyV2IAUy8a6zto7pR9jo7cGv67
         jwvm4G0649HJCAdgvHGf3iZHIT0UJby13FF8kgCjAVm3MwcvQZXxMYiqutIwp/TuGn
         +kR1pNLmv5uE57qqYoZV1xIDbscGHAyZ6fi1/0D/xoQNy00IZtHXuwCSmfkKz2/jnu
         Pau6ObI97MClUTaWMcZ3LG91FfqKI1QqQjXAsXMl4C5uwrGqlB4cW+DZzr6dQptk2f
         shXyDz85DTfBg==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 7C3B0A005E;
        Thu, 16 Feb 2023 22:23:16 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2103.outbound.protection.outlook.com [104.47.70.103])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 48D8180083;
        Thu, 16 Feb 2023 22:23:14 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="i9unPCwl";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dwTwFPPa8Cif5xLKctUjE92BlFOykqVoXoZed+sfCdRb6xHjValmphkvowlf7wq/SObOGZ2gy75eUBGER7LdcKWX5gfs5LrxLHjmYI6gTjGrml/iPeKcpyse1HZylES406E+MoNKg0iyLPl2mlMN3Nbj5Qmoo88pu/RGfDe/yFu5np+Nroa9QZa3jpGrOq2cBsEPdpOa8GhoLD1pYaczBaz7yOSyEp8WnCupY0zObDMMjeeiyLM0FMYAVzMC4rHcVP57jexvDXg7wlqg9n7KLbkxC19xUGG2bCjtChpekEJQ5rUgM22gjDy7sEqmgfeKbxWbhC09Nr18hCuYkch8dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZDThJ7pHSpFyNX7nqiNxAVS7tz07VRSihO6JY7ZU/os=;
 b=oL+3E/fjSYFIvXsp9prnsiCeC0F6zvAsNixhewH2SJqRj1Kz5UNWLvYuBJS/cFkGEBEaMfyvVoD5RKbBpVefWE1FMihiIQaGpoFJ0QBNg8cPafJe9ApUPRxmT4tZTCyw5IHXVUsXpChqE9EWyjBxXaKi596rB8EYYTT22ojkUEu5lLGGFJG9EXR8wkBp6UwUv0ZvAifpkbI6HsgKzigUrwHalyHWwWaREPwpa8yUhfwnd8nLp1mgR1bsmHLGtYGl3Txfm/FXXdofsP95N1d4O+w3ZbtSP4l6oQtAXWnmNisoPiXmOh1eH5CnL1yGsssnLrp6sTzMu/LDHyutLLTTNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZDThJ7pHSpFyNX7nqiNxAVS7tz07VRSihO6JY7ZU/os=;
 b=i9unPCwle/y8lMMy9kUdWNvJTk/rGFlXbKzM+erOITbcZQkEKHSd3TKa+feC/An78yTCBJMIecKhXmdq+mv/FGmWXHulNz1tLLC8DjC8HAdmaNuwjEmkMe9VgUCIh7yqjFEQ1MU+aEBHdDFME0xye7L3xpAHf5NxgCrmhatlr/8=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by IA1PR12MB8359.namprd12.prod.outlook.com (2603:10b6:208:3fc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Thu, 16 Feb
 2023 22:23:09 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::6f3c:bd8e:8461:c28c]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::6f3c:bd8e:8461:c28c%7]) with mapi id 15.20.6086.021; Thu, 16 Feb 2023
 22:23:09 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Roger Quadros <rogerq@kernel.org>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: dwc3: gadget suspend/resume vs system suspend/resume
Thread-Topic: dwc3: gadget suspend/resume vs system suspend/resume
Thread-Index: AQHZQSGIQpZyBgHR1ESwyvCYdmUCwq7QJboAgAAeOwCAAA9MgIAASymAgACj5gCAAJ+fAIAAKpWAgAAbtAA=
Date:   Thu, 16 Feb 2023 22:23:08 +0000
Message-ID: <20230216222306.i3ijnt2ptvgqazbl@synopsys.com>
References: <7e28eb10-f27b-682a-dfb3-fec3e70b01f6@kernel.org>
 <Y+z9NK6AyhvTQMir@rowland.harvard.edu>
 <3b530a74-0fb9-432b-b1d9-606a9694ce1e@kernel.org>
 <Y+0jZScRX80mF8tS@rowland.harvard.edu>
 <20230215225337.wuzhpmikiqz5htqk@synopsys.com>
 <3b6f29e9-cc6b-d834-7c7e-7ae47b9fc44e@kernel.org>
 <20230216181132.k2jate2uwqadpqfh@synopsys.com>
 <00e5e799-6cf0-b6f1-4eb4-0bd0c57e91c8@kernel.org>
In-Reply-To: <00e5e799-6cf0-b6f1-4eb4-0bd0c57e91c8@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|IA1PR12MB8359:EE_
x-ms-office365-filtering-correlation-id: a80a3903-d609-4b3b-8574-08db106c61f1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tAHVZ57qZ/22Itbo9+iDDJ/A3i7M6JyEhm4v/yA9nToap5mg1YgjfsJ45YE9xuUd2yOCeCQQlZUSnT7JsBk0i1GTc3ZrbjcsK1UrmZBnmbz+uv3/c8FwcUvy+hDbYhRk+ozdTLmBg5YbbShyyFniQR8Wr3EA2hLcG7UQvvn7rh/7MlWtszNjsL/Tip1qapwpVbimiN/koltF7gwcW5/UybvOk2K4Y2pGsaLBEGP3G1fqS4SnGCseEd7/smSk5HlmYqAq8bBUq5wnbI/LKOa3N0jb/NLn8qmXi+xnavLDazjUL8yBbBzF12is/3LYIjV9TP6EIUdbjEiYXsMnMVRQ9+eyp7ucFth6gF06s3jERsORxLivBXIPGjiwGIdIY2Az/TFDuji+iIc3B3CGjfaYyIHdvmXTC+UxKFzir/zVH4T4bpanoQ+XQ+0HYjB27pRm3NkM4NLRoS3GYJT/ma6QqD5YWmlsFZW1hksZA4k4CDm0BGj7Giy6bstX4L7tz4rl7N6FOddeZrNrM5qr9Z9Vgcqb3vn1OCDxzkAcb3sCLghdhky9+UetU4PUL/B3Mh7qJ94R1jukxWbt44UPEqekquLGAbPY4MPA5wXOU9r8q7f26HgfapVHol+Pd2RaL650JFM25seXX7aMrZM4Wqgyfb3G8tXnpgdVUCmZ/Fy3od4zTlwJupMEHRnfh4PCuFptWrJ/oy9Enpqmg+z4+7aDBQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(136003)(346002)(396003)(366004)(376002)(451199018)(83380400001)(36756003)(316002)(15650500001)(54906003)(1076003)(53546011)(186003)(26005)(6506007)(2616005)(6512007)(38100700002)(8936002)(6486002)(5660300002)(71200400001)(2906002)(478600001)(122000001)(41300700001)(38070700005)(4326008)(66446008)(76116006)(64756008)(66476007)(66556008)(8676002)(86362001)(6916009)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dEU2dFlRblgyelN2NVdOb0kxOHVldmZZN3ZqZDl2THpRaEw5cnRmYTU5RUM0?=
 =?utf-8?B?azVySzlBTlF0ZVd2SWxpNktobHVqZFJRenRhN1BQM0ZFVnp3ZmgwMDRtZHB5?=
 =?utf-8?B?YmJoVWZSUjZjRWJvWktMeG5GeTNDSXcyVVAxVzJRRFB5MnNnckt4OW9VSzJt?=
 =?utf-8?B?YVZjS21idmRDajFZejNRRlRQbnFhSE9KNnBBRTk1T0FwMDUxYWRDbkNpS2Yy?=
 =?utf-8?B?SlRnRWxheEgraFpFTlRuVHVrbGwwNDJmR3VWVVFCdHZ3QVRrWnJJdkQ2aDNF?=
 =?utf-8?B?R2lSTis3Z3JUZlRDTWxLSlVJWVFXbmNkeEtkaHVJSUVCd3g2aXpLcEhPaHRn?=
 =?utf-8?B?dmFvaHFMQ0JYRW9yNFVQREQyY3FtdHFISzZkSHNoSkx1dzk0WGNVb3NLYko2?=
 =?utf-8?B?bjlXUDJsRHBTWnAzWHhkSGdTcVZYcW8yeVR5bmozTzY5cUQ2aHFUN0pCOU9I?=
 =?utf-8?B?Y2cyVkFMdUc0TTlIYjJlMXJuVVhtK282b0NiczNaZ1RWK3hQWi9VbkdKeXA0?=
 =?utf-8?B?ZFp0YTdTcDVsWnpIVXhrRTZCZWgwUU1HMFhZVllrNHNCWjhiM1p4V0ZFNFRH?=
 =?utf-8?B?aTMySWQ2V0tpOEVtb0N2V2YyNTBPSGtRYzRjVXQ4WERYMjAxZVNua0FNamIy?=
 =?utf-8?B?ZnM3S2NlSXJiVEtOemw2bHl3elFZazNjZW1iNmVhdy9KSXBXbU9LRDByVHpD?=
 =?utf-8?B?R2tBc09MNWVPaFRPK1dFTStFNEFoeGZNdWovdzhWSk93Y1JiNDZaTEp1WmJ2?=
 =?utf-8?B?eDVWWDB6UXYwUkVqTThNOEpZODBPQjV2ZXdKNGk4MjV1YWw4UXgzM3N0T09B?=
 =?utf-8?B?NHFrRDlrTXR1c09HMG9lOS8vVDNLZFk5UmFzMit5RE1ybEFaV1RzVzdmTnlh?=
 =?utf-8?B?SUllb0xWV0hWZVN3SXVwaDRHRHpDb3BzaHBPNUoxL0UvbHpiZkJpN1pxNjdh?=
 =?utf-8?B?RnlLQWwvV2o4dEI4cU5ndWo1RVF5NEdIRjlsYXVTdXFKL0FHdFdJb2FPcFRo?=
 =?utf-8?B?bFRwN1FheHYvdHVPQ3R5enBPbVJESWU5R0NSVE9HdTN2d2dZOU1kbUNTUGEy?=
 =?utf-8?B?T0JkRkV1WHpIWmhkai9PTklCU1ZtcjhnRWxLME1JTlpXU2x4Kzg4UzRwbVlV?=
 =?utf-8?B?SWw2QWU0Q2FCa2licWExb2tvMGRrS1NJNG9NWWVDU3RneVpDM1RHazZzUFFP?=
 =?utf-8?B?MldHRW5pczlOeDdwSGI3bk9BRVRjS0RIMDFKdzdMTllwNkRYeTVJcC9xaHRQ?=
 =?utf-8?B?a21CbkFJNXpQNEhYUjZWdkN6R2xKcUsyRHNjRDFPeGkxdkplQ0VQM0hQeDBB?=
 =?utf-8?B?aGlaZ1ErNnFmZUJxVXFBQ2x4dFpoc2VWM2pnQmVUMHlBVnNDT29uUWFpWTdt?=
 =?utf-8?B?YjQwRUxwVlRuc0tLV3NscE1RSTREaEk0OFAvdDArZktEZWROTTNpakU0QjZC?=
 =?utf-8?B?RmhqU3VkcGZwUkR0QjM1UnRKWkNZZjZyV2V5bVJlbGl5SDM3MkZzbEtpL3Ry?=
 =?utf-8?B?WkJZa3MzSzBEL0lSalk3M2hmMW9kLy9nd1F6cnJFNEhheFJFYlEzNFhxczlO?=
 =?utf-8?B?REp4Zk1QTlpwbWRtMklRajV1Y0lNUGVIWWZKbzZNenRza3ZMVExNc1E2QStG?=
 =?utf-8?B?czR6VzFhUUlTRnF1NmQyYmVTcTN5V1dNMjJEYU5nNXFjVXRsQ21FY2RaZzU4?=
 =?utf-8?B?bGxkaW9jYWVGbXJxZW43eEErOHgxV2Jsa2dSaG1tMTliQlpFVG1TQ0tzVUE5?=
 =?utf-8?B?LzA5MXRhSnM0ZS9RYWg5NlgzdWtDZERRUy9JR0pXQjNqVGllSWRxWHN3TVYv?=
 =?utf-8?B?T2hVaUd0WVd0LzNsQ1ZXYUI1RzNlMU1FeEJWZFUvMlRzTzBBKy84Tzd3eHR6?=
 =?utf-8?B?RVFLQ2VwMnB3b0FxNy9PR05OeE5ESzNwTXBJOGhqb3ZpdERJWVVsUnJPNGZB?=
 =?utf-8?B?TTNxZThITTBLeWFnVk1JWXVtWDRYdDdIQncyckp2Q2tKQUZwaWxGbklrYTR2?=
 =?utf-8?B?dTlKbTNHanNiZTVjSU9CNGFMQnNhUSt6ems0a0EvQzRZcDN6cndyWTgwWlNm?=
 =?utf-8?B?MXJRb1ZyQnRReDFLaE5oZDBJQnYydDF0NEt6Qy9MR2U2UmM1anlGMVRMdkxk?=
 =?utf-8?B?QldadG55RW5VL1MzU0dVZVZYemJLMCtZMVlmZEplTFZwUjYrWXNUYW1UK3JT?=
 =?utf-8?B?Ync9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <108B13CDA1390141B86BD69521D3CEF3@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: TbWydaBCrM1EAl/dXxVX9QE8KkpRFnIj+7UnaYVT0gFiuXQWHvrxdDTRbImAjQvrH64dq7gZO4TdLCTpCiOwTtMQ7moh9KTokdQ4eO4pdHGuGW3QpXcQmRso0WNqKK/kOiRZfQWIQwRIbA74wZEzS6ncn3lVV6ZkxMe7TfJ3fGebF2BUaBRTI0XuP/akqyOnqj7AIODDX43+gArYBTeGJf+lCiuIXSq7e9xSkvy87A5Yar3nZl0BwUgsQvuZcxQpLm7C/UqAdG7yxX2KuSqmRArLarTkt+MOGL9dWeYXI9Mg38qtKnlfyPZBW9qBgnb9IuQ6mCLaf2udLWbMFiCcnXtkMkkqIHYynnb+aZl/B2fBXLtFaVgioiaMAlGnrcFkzBbkPs4Nx8HSUKAxmoRSlG97P6moFewm816YQWxFSrjEAEJr6+AHK2OgGQJvr1RwxCM5sFQ52ORSzvK/xsqNP7hLRVecbHZhlfQGvl0n2cDqvjGDfoMxFVxnIOX/aO35zOi2rvdl6XBgWXepBKUHBOB4ej4M6C3QyOvvjmmELeA51Hkjhpt0TIblSAWlPYyHDTiuLh8yEZanwayBF/O3iVNF0qv08jokMulhlJmAVBab67ZLfTRmanPuhwZYwg0NAaJqPpfkmDx8CHIBqfjOcMnejYLGAJeUJNBLybMaLQOrLzxeye1Fi6dPb2OKyQtEqHKpMPEgI9BE1hxErQ3QSTcVuXPd8S5XQ3Jn/lhnvCvXRKgSewCZBM8+ABhTvgWh3CuSgLYxiflsBAzBw2A7Sbo5L8C8CxNc11rslQIU+qsm6ii9xc4KqpZy8hSMzgo8B1vhRxfg5D82GKgCk4O2qtx43j3j9ojPk8m8fWzdVJNphTEy8dVBH/dqbFbmAVggSLfpx4mx65lQdgjDzqGZpQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a80a3903-d609-4b3b-8574-08db106c61f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2023 22:23:08.8162
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I3m768L9O0wuCVIM+uDzmk/nMUAtyZNnaTx9BaQgQlrANm8qebYkJhyWw/FN6C9vqkzx9Bpoa6fyKTKdEjMRow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8359
X-Proofpoint-GUID: ZtwJCufF6iVY71eIwUMEGIgrvGDXm0HN
X-Proofpoint-ORIG-GUID: ZtwJCufF6iVY71eIwUMEGIgrvGDXm0HN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-16_16,2023-02-16_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 mlxlogscore=796 spamscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302160191
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVGh1LCBGZWIgMTYsIDIwMjMsIFJvZ2VyIFF1YWRyb3Mgd3JvdGU6DQo+IA0KPiANCj4gT24g
MTYvMDIvMjAyMyAyMDoxMSwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+IE9uIFRodSwgRmViIDE2
LCAyMDIzLCBSb2dlciBRdWFkcm9zIHdyb3RlOg0KPiA+Pg0KPiA+Pg0KPiA+PiBPbiAxNi8wMi8y
MDIzIDAwOjUzLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4+PiBPbiBXZWQsIEZlYiAxNSwgMjAy
MywgQWxhbiBTdGVybiB3cm90ZToNCj4gPj4+PiBPbiBXZWQsIEZlYiAxNSwgMjAyMyBhdCAwNzoy
OTo1MlBNICswMjAwLCBSb2dlciBRdWFkcm9zIHdyb3RlOg0KPiA+Pj4+PiBJIHdhcyBtb3JlIGlu
dGVyZXN0ZWQgaW4gdGhpcyBjYXNlIHdoZXJlIFVTQiBpcyBzdXNwZW5kZWQgYW5kIHRoZW4gc3lz
dGVtIHN1c3BlbmRzLg0KPiA+Pj4+PiBXYWtpbmcgdXAgdGhlIHN5c3RlbSBvbiBVU0IgYWN0aXZp
dHkgKHdoaWxlIHN1c3BlbmRlZCkgaXMgdGFrZW4gY2FyZSBvZiBieSBoYXJkd2FyZS4NCj4gPj4+
Pj4gQnV0IEknbSBub3Qgc3VyZSBpZiBnYWRnZXQgZHJpdmVyIHdpbGwgYmUgdXAgaW4gdGltZSB0
byByZXNwb25kIHRvIHRoZSByZXF1ZXN0DQo+ID4+Pj4+IHJlYXNvbmFibHkgcXVpY2tseS4gSXQg
d291bGQgdGFrZSBhIGNvdXBsZSBvZiBzZWNvbmRzIGFuZCBpcyBub3QgaGFyZCB0aW1lIGJvdW5k
Lg0KPiA+Pj4+PiBJcyB0aGlzIHRpbWUgbWFuZGF0ZWQgYnkgdGhlIFVTQiBTcGVjIG9yIGlzIGl0
IGhvc3QgaW1wbGVtZW50YXRpb24gc3BlY2lmaWM/DQo+ID4+Pj4NCj4gPj4+PiBUaGUgVVNCIHNw
ZWMgZG9lc24ndCBzYXkgdmVyeSBtdWNoIGFib3V0IGl0LiAgT25lIHBhcnQgb2YgdGhlIFVTQiAy
LjAgDQo+ID4+Pj4gc3BlYyBzZWVtcyByZWxldmFudDsgaXQgc2F5czoNCj4gPj4+Pg0KPiA+Pj4+
IAk5LjIuNi4yIFJlc2V0L1Jlc3VtZSBSZWNvdmVyeSBUaW1lDQo+ID4+Pj4NCj4gPj4+PiAJQWZ0
ZXIgYSBwb3J0IGlzIHJlc2V0IG9yIHJlc3VtZWQsIHRoZSBVU0IgU3lzdGVtIFNvZnR3YXJlIGlz
IA0KPiA+Pj4+IAlleHBlY3RlZCB0byBwcm92aWRlIGEg4oCccmVjb3ZlcnnigJ0gaW50ZXJ2YWwg
b2YgMTAgbXMgYmVmb3JlIHRoZSANCj4gPj4+PiAJZGV2aWNlIGF0dGFjaGVkIHRvIHRoZSBwb3J0
IGlzIGV4cGVjdGVkIHRvIHJlc3BvbmQgdG8gZGF0YSANCj4gPj4+PiAJdHJhbnNmZXJzLiBUaGUg
ZGV2aWNlIG1heSBpZ25vcmUgYW55IGRhdGEgdHJhbnNmZXJzIGR1cmluZyB0aGUgDQo+ID4+Pj4g
CXJlY292ZXJ5IGludGVydmFsLg0KPiA+Pj4+DQo+ID4+Pj4gCUFmdGVyIHRoZSBlbmQgb2YgdGhl
IHJlY292ZXJ5IGludGVydmFsIChtZWFzdXJlZCBmcm9tIHRoZSBlbmQgDQo+ID4+Pj4gCW9mIHRo
ZSByZXNldCBvciB0aGUgZW5kIG9mIHRoZSBFT1AgYXQgdGhlIGVuZCBvZiB0aGUgcmVzdW1lIA0K
PiA+Pj4+IAlzaWduYWxpbmcpLCB0aGUgZGV2aWNlIG11c3QgYWNjZXB0IGRhdGEgdHJhbnNmZXJz
IGF0IGFueSB0aW1lLg0KPiA+Pj4+DQo+ID4+Pj4gQWNjZXB0aW5nIGEgZGF0YSB0cmFuc2ZlciBk
b2Vzbid0IG5lY2Vzc2FyaWx5IG1lYW4gY29tcGxldGluZyBpdCwgDQo+ID4+Pj4gdGhvdWdoLiAg
VGhlIExpbnV4IFVTQiBjb3JlIGRvZXMgc2VuZCBhIHJlcXVlc3QgdG8gYSBkZXZpY2UgMTAgbXMg
DQo+ID4+Pj4gYWZ0ZXIgcmVzdW1pbmcgaXQsIGJ1dCB0aGUgdGltZW91dCBwZXJpb2Qgb24gdGhp
cyByZXF1ZXN0IGlzIDUgc2Vjb25kcy4gIA0KPiA+Pj4+IFRoaXMgZ2l2ZXMgeW91IHNvbWUgbGVl
d2F5Lg0KPiA+Pj4+DQo+ID4+Pg0KPiA+Pj4gRm9yIG1vc3Qgc3RhbmRhcmQgY29udHJvbCByZXF1
ZXN0cywgdGhlIHNwZWMgaW5kaWNhdGVzIHRoYXQgdGhlIGRldmljZQ0KPiA+Pj4gbXVzdCByZXNw
b25kIHdpdGhpbiA1MDBtcy4gQnV0IHRoYXQncyBub3QgdGhlIGNhc2UgZm9yIHNvbWUgcmVhbCBk
ZXZpY2VzDQo+ID4+DQo+ID4+IEkgY291bGQgbm90IGZpbmQgYW55IHJlZmVyZW5jZSB0byA1MDBt
cyB0aW1lIGxpbWl0IGZvciBzdXNwZW5kL3Jlc3VtZSBjYXNlLg0KPiA+PiBUaGUgb25seSBtZW50
aW9uIG9mIDUwMG1zIGluIFVTQjIuMCBzcGVjIGlzOg0KPiA+Pg0KPiA+PiAJOS4yLjYuNCBTdGFu
ZGFyZCBEZXZpY2UgUmVxdWVzdHMNCj4gPj4gCS4uLg0KPiA+PiAJRm9yIHN0YW5kYXJkIGRldmlj
ZSByZXF1ZXN0cyB0aGF0IHJlcXVpcmUgZGF0YSBzdGFnZSB0cmFuc2Zlcg0KPiA+PiAJdG8gdGhl
IGhvc3QsIHRoZSBkZXZpY2UgbXVzdCBiZSBhYmxlIHRvIHJldHVybiB0aGUgZmlyc3QgZGF0YQ0K
PiA+PiAJcGFja2V0IHRvIHRoZSBob3N0IHdpdGhpbiA1MDAgbXMgb2YgcmVjZWlwdCBvZiB0aGUg
cmVxdWVzdC4NCj4gPj4gCUZvciBzdWJzZXF1ZW50IGRhdGEgcGFja2V0cywgaWYgYW55LCB0aGUg
ZGV2aWNlIG11c3QgYmUgYWJsZSB0bw0KPiA+PiAJcmV0dXJuIHRoZW0gd2l0aGluIDUwMCBtcyBv
ZiBzdWNjZXNzZnVsIGNvbXBsZXRpb24gb2YgdGhlDQo+ID4+IAl0cmFuc21pc3Npb24gb2YgdGhl
IHByZXZpb3VzIHBhY2tldC4gVGhlIGRldmljZSBtdXN0IHRoZW4gYmUNCj4gPj4gCWFibGUgdG8g
c3VjY2Vzc2Z1bGx5IGNvbXBsZXRlIHRoZSBzdGF0dXMgc3RhZ2Ugd2l0aGluIDUwIG1zIGFmdGVy
DQo+ID4+IAlyZXR1cm5pbmcgdGhlIGxhc3QgZGF0YSBwYWNrZXQuDQo+ID4+DQo+ID4+IEkgZG9u
J3QgdGhpbmsgdGhpcyBhcHBsaWVzIHRvIHN1c3BlbmQvcmVzdW1lLg0KPiA+IA0KPiA+IEFyZSB5
b3UgcmVmZXJyaW5nIHRvIHRoZSBoYW5kc2hha2UgdGltZW91dCB3aGVuIHRoZSBob3N0IHRyaWVz
IHRvDQo+ID4gaW5pdGlhdGUgcmVzdW1lIGF0IHRoZSBsaW5rIGxheWVyPyBJdCdzIHJlbGF0aXZl
bHkgc2hvcnQgY29tcGFyZSB0byB0aGUNCj4gPiBzb2Z0d2FyZSB0aW1lb3V0IGFuZCB3aWxsIHZh
cnkgZGVwZW5kaW5nIG9uIGhvdyBtYW55IGh1YiB0aWVycyBpbiB0aGUNCj4gPiB0b3BvbG9neS4g
QWxzbywgdGhhdCdzIGhhbmRsZWQgYnkgdGhlIGhvc3QgYW5kIGRldmljZSBjb250cm9sbGVyLiBX
ZQ0KPiA+IHNob3VsZCBjYXJlIG1vcmUgYWJvdXQgdGhlIHNvZnR3YXJlIHRpbWVvdXQgYWZ0ZXIg
cmVzdW1lIGNvbXBsZXRlZC4gVGhlDQo+ID4gNTAwbXMgaGVyZSBhcHBsaWVzIGlmIHRoZSBkZXZp
Y2UgY291bGRuJ3QgcmVzdW1lIGZhc3QgZW5vdWdoIGZvciB0aGUNCj4gPiBkcml2ZXIgdG8gcHJl
cGFyZSBhIHRyYW5zZmVyIHJlc3BvbnNlIHRvIHRoZSBob3N0Lg0KPiA+IA0KPiA+Pg0KPiA+Pj4g
c28gd2UgaGF2ZSBhIDUgc2Vjb25kIHRpbWVvdXQgaW4gTGludXguIEZvciBvdGhlciByZXF1ZXN0
cywgaXQncyB1cCB0bw0KPiA+Pj4gdGhlIGNsYXNzIGRyaXZlcnMuIEZvciBtb3N0IGRyaXZlcnMg
b24gTGludXgsIGl0J3MgdHlwaWNhbGx5IDUgc2Vjb25kcw0KPiA+Pj4gYWxzby4NCj4gPj4NCj4g
Pj4gU28gaXQgbG9va3MgZG9hYmxlIHdpdGggTGludXggaG9zdC4gSSdsbCBoYXZlIHRvIGNoZWNr
IGhvdyBvdGhlcg0KPiA+PiBVU0IgaG9zdHMgYmVoYXZlLg0KPiA+Pg0KPiA+Pj4NCj4gPj4+IElN
TywgdGhlIHN5c3RlbSBzdXNwZW5kIG9uIHRoZSBnYWRnZXQgc2lkZSBzaG91bGQgdGFrZSBwcmVj
ZWRlbmNlLiBUaGF0DQo+ID4+PiBpcywgaXQgc2hvdWxkbid0IGRlcGVuZCBvbiB3aGV0aGVyIHRo
ZSB1c2IgZ2FkZ2V0IGlzIGluIHN1c3BlbmQgb3Igbm90DQo+ID4+PiB0byBnbyB0aHJvdWdoIHN5
c3RlbSBzdXNwZW5kLiBGb3IgdGhhdCB0byBoYXBwZW4sIHRoZSBnYWRnZXQgbXVzdA0KPiA+Pj4g
aW5pdGlhdGUgc29mdC1kaXNjb25uZWN0LiBPdGhlcndpc2UgSSBjYW4gc2VlIHdlIG1heSBydW4g
aW50bw0KPiA+Pj4gY29tcGxpY2F0aW9ucyBmcm9tIHRoZSBkZWxheSBmcm9tIHRoZSBzeXN0ZW0g
c3VzcGVuZC4gRm9yIGV4YW1wbGUsIHdoYXQNCj4gPj4+IGlmIHRoZSBob3N0IGluaXRpYXRlcyBy
ZXN1bWUgcmlnaHQgYWZ0ZXIgc3VzcGVuZCB3aGlsZSB0aGUgZ2FkZ2V0IHNpZGUNCj4gPj4+IGlz
IHN0aWxsIHN1c3BlbmRpbmc/DQo+ID4+DQo+ID4+IEluIHRoaXMgY2FzZSwgc3lzdGVtIHdpbGwg
Z28gYWxsIHRoZSB3YXkgdG8gc3VzcGVuZCBhbmQgdGhlbiB3YWtlIHVwLg0KPiA+PiBJdCB3aWxs
IHRha2UgYSBmZXcgc2Vjb25kcyBtb3JlIHRvIHJlc3BvbmQgdGhhbiBpZiBzeXN0ZW0gd2FzIGFs
cmVhZHkgc3VzcGVuZGVkLg0KPiA+IA0KPiA+IFllcywgbXkgY29uY2VybiBpcyB0aGUgc3VzcGVu
ZC9yZXN1bWUgaXMgbWVhc3VyZWQgaW4gc2Vjb25kcy4NCj4gPiANCj4gPj4NCj4gPj4+IFdoYXQg
aWYgdGhlcmUgYXJlIG90aGVyIGdhZGdldHMgb24gdGhlIHNldHVwIHRoYXQNCj4gPj4+IHdhbnQg
b3Igbm90IHdhbnQgdG8gZ28gdG8gc3VzcGVuZCBhbHNvPyBIb3cgY2FuIHRoZSBzeXN0ZW0gZGVj
aWRlIHdoZW4NCj4gPj4+IGl0IGNhbiBnbyBpbnRvIHN1c3BlbmQgdGhlbj8NCj4gPj4NCj4gPj4g
SSB0aGluayB0aGlzIGlzIGEgcG9saWN5IGRlY2lzaW9uIGFuZCB3ZSBjYW5ub3QgZm9yY2Ugb25l
IHdheSBvciB0aGUgb3RoZXINCj4gPj4gaW4gdGhlIGtlcm5lbCBidXQgYWxsb3cgdXNlciBzcGFj
ZSB0byBkZWNpZGUgd2hhdCBtdXN0IGJlIGRvbmUuDQo+ID4+IEl0IHdvdWxkIHJlYWxseSBkZXBl
bmQgb24gd2hhdCB0aGUgZW5kIGFwcGxpY2F0aW9uIG5lZWRzLg0KPiA+Pg0KPiA+PiBTbywgZG9l
cyBhIGdhZGdldCBzcGVjaWZpYyB1c2VyIHNldHRhYmxlIGZsYWcgc2VlbSByZWFzb25hYmxlIHRv
IGRlY2lkZQ0KPiA+PiBpZiBnYWRnZXQgZHJpdmVyIHNob3VsZDoNCj4gPj4gYSkgZGlzY29ubmVj
dCBvbiBzeXN0ZW0gc3VzcGVuZCByZWdhcmRsZXNzIG9mIFVTQiBzdGF0ZSAoY3VycmVudCBiZWhh
dmlvcikNCj4gPj4gYikgcHJldmVudCBhIHN5c3RlbSBzdXNwZW5kIGlmIGdhZGdldCBpcyBub3Qg
aW4gVVNCIHN1c3BlbmQuIEFsbG93IG90aGVyd2lzZS4NCj4gPj4NCj4gPj4gT3IgYW55IGJldHRl
ciBpZGVhcz8NCj4gPj4NCj4gPiANCj4gPiBXaGF0J3MgdGhlIHVzZSBjYXNlIGhlcmU/IEFyZSB5
b3UgdHJ5aW5nIHRvIGRyaXZlIHRoZSBnYWRnZXQgc3lzdGVtDQo+ID4gc3VzcGVuZCB2aWEgdGhl
IGhvc3Q/IFRoYXQgaXMsIGlmIHRoZSBob3N0IHJlc3VtZXMsIHRoZSBzeXN0ZW0gb24gdGhlDQo+
ID4gZ2FkZ2V0IHNpZGUgd291bGQgcmVzdW1lIGFsc28/IElmIHRoYXQncyB0aGUgY2FzZSwgdGhl
biBwZXJoYXBzIHRoYXQgY2FuDQo+ID4gYmUgdHJpZ2dlcmVkIGluIHRoZSBnYWRnZXQgZHJpdmVy
IHN1c3BlbmQgaW5zdGVhZD8NCj4gDQo+IFRoZSB1c2UgY2FzZSBpczoNCj4gVGhlIExpbnV4IFN5
c3RlbSBpcyBhIFVTQiBnYWRnZXQgd2hpY2gNCj4gMSkgSWYgcGx1Z2dlZCB0byBVU0IgaG9zdCBh
bmQgVVNCIGdhZGdldCBpcyBhY3RpdmUgdGhlIHN5c3RlbSB3aWxsIHJlbWFpbiBhY3RpdmUNCj4g
MikgSWYgcGx1Z2dlZCB0byBVU0IgaG9zdCBhbmQgVVNCIGdhZGdldCBpcyBzdXNwZW5kZWQsIGl0
IGNhbiB0cmFuc2l0aW9uIHRvIHN5c3RlbSBzdXNwZW5kDQo+IChidXQgbWF5IG5vdCBhbHdheXMp
ICh0aGlzIGNoZWNrIGFuZCB0cmlnZ2VyIHRvIHN5c3RlbSBzdXNwZW5kIGlzIHVzZXIgc3BhY2Ug
ZHJpdmVuKQ0KPiAzKSBJZiBzeXN0ZW0gaGFzIHN1c3BlbmRlZCwgYW55IFVTQiBhY3Rpdml0eSBz
aG91bGQgcmVzdW1lIHRoZSBzeXN0ZW0gYW5kIFVTQiBnYWRnZXQgc2hvdWxkDQo+IHJlc3VtZSAo
cHJlZmVyYWJseSB3aXRob3V0IGEgZGlzY29ubmVjdC9yZS1lbnVtZXJhdGlvbikNCj4gVGhlcmUg
Y2FuIGJlIGV4Y2VwdGlvbnMgaWYgd2UgZG9uJ3QgbWVldCBjZXJ0YWluIGhvc3Qgc29mdHdhcmUg
dGltZW91dCBjcml0ZXJpYSwNCj4gaW4gd2hpY2ggY2FzZSB3ZSBzaW1wbHkgcmUtZW51bWVyYXRl
Lg0KDQpJIHNlZS4NCg0KPiANCj4gPiANCj4gPiBPdGhlcndpc2UsIGl0IG1ha2VzIG1vcmUgc2Vu
c2UgdG8gbGV0IHRoZSB1c2VyIGNvbnRyb2wgd2hlbiBoZS9zaGUgd2FudHMNCj4gPiB0byByZXN1
bWUgaWYgdGhlIHVzZXIgaXMgdGhlIG9uZSB0aGF0IHRyaWdnZXJzIHRoZSBzeXN0ZW0gc3VzcGVu
ZC4gT24NCj4gPiByZXN1bWUsIHRoZSBjb25uZWN0aW9uIGNhbiBiZSByZWVzdGFibGlzaGVkLg0K
PiANCj4gVGhpcyBpcyBob3cgaXQgYWxyZWFkeSBpcyBub3cgbm8/DQoNClllcywgdGhhdCdzIHRo
ZSBjdXJyZW50IGJlaGF2aW9yLg0KDQpUaGFua3MgZm9yIHRoZSBjbGFyaWZpY2F0aW9uIG9uIHRo
ZSB1c2UgY2FzZS4gSSB0aGluayBpdCBtYWtlcyBzZW5zZSBpZg0KeW91IHdhbnQgdG8gY2hhbmdl
IHRoZSBjdXJyZW50IGJlaGF2aW9yIGZvciB0aGlzLiBIb3dldmVyIHRoaXMgcmVxdWlyZXMNCnNv
bWUgdGVzdGluZ3MuDQoNClRoYW5rcywNClRoaW5o
