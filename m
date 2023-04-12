Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E41F56E0082
	for <lists+linux-usb@lfdr.de>; Wed, 12 Apr 2023 23:09:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229760AbjDLVJ0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Apr 2023 17:09:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbjDLVJY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Apr 2023 17:09:24 -0400
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A9A459E2
        for <linux-usb@vger.kernel.org>; Wed, 12 Apr 2023 14:09:23 -0700 (PDT)
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
        by mx0b-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33CFwN6Y024827;
        Wed, 12 Apr 2023 14:09:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=sSgqJZj/x/yG+F/xrrFCeUD9XWTfFS3nynwiFLXnHJI=;
 b=SMOJY44GuuI8c2XIJKY94F+d/3shRSvX/ESOWXB9MTBx1dhX5fM9QA0OK4jZR2FD6CZz
 CPUdvtjXvKeMNyI7EonrXrqvMraESx2WZuvPvKawDBvA9HwGVcc5RlretUWPb83OCE1N
 V/ejaoIbpeAjbZmUt8ddyHXOpddKskUQS0K9TVqlUYR61Z+19BCNRRsN39HIvm5qMglY
 VRjqR98mAc5pKoX6T2fou+XjaWEAcYBKTxA2QaD4/cDwcvsZK+gTEHWp3Ro8t2ylciBE
 /RpKLNyhBoCnCIEJcWTZEd6tgw0gihtu7cAD0203hrd1y70oCZ7b2UA7akzth29hoHZx cQ== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3pu6wjrg3n-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 12 Apr 2023 14:09:09 -0700
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0776AC00F7;
        Wed, 12 Apr 2023 21:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1681333748; bh=sSgqJZj/x/yG+F/xrrFCeUD9XWTfFS3nynwiFLXnHJI=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=IbXZ7MTD2NNFDoZPWOemKbbPaxxcGAvh6zwubEVaKk4arfSIEludpIgTi0Q6pYqGF
         b/59yyCE7TTBOwnZOcT13G79/D/AoA7DHDptI8sgk+4W7KB94L66C8z6Nu4blLoWJy
         NGX3l5YvN3NxYcO+X+IV4mX4NEV8jD8+nxJ1ScQqKA2UNFBU9RB0//qsyFOXQkxH+Q
         q5XX3pi3m+S5BgsqSslNXHVx7puFysq88XuCWDSFwXh+7zXTwmARgyr9iqdUsRW7oX
         RTPK4bGL/Y1MWXQoxEcSfiFflYCeZspHy/6+uEpT92kMAEWvdCwaWLq3SGuRd1uDQz
         5YaPr269ru7LA==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 95A3CA00AA;
        Wed, 12 Apr 2023 21:09:07 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2103.outbound.protection.outlook.com [104.47.70.103])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id A11EC800C3;
        Wed, 12 Apr 2023 21:09:06 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="jPWKRKkI";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KGnSTScFFxOUmVmKPxGJi08pgoDk8Z3Ofq4z/EfeTuEiS37dszeBq3NNQT7EtRZr0IPau5vW/LVPWTsciOZK5VPHj1Z3bgY0jHJa9roZ/g2cylmvo2evzI8eRRUjcnP8Rf35TYNohc+ghqqWeXZslsowhRq+2zcJWjE/1fxTGcITIKLhza+Qs6cgHQ8FtTAQfgzVQI8rumrDxQ9/yeFLL9+qMfgONuEUTTx8wkD0immFes+wPUFgcaMHCgHugHd0vrdJRIWbOZNNJl+UhKxSPldvNMMB625zX6doWU1xUhTCs8ooZiaSGFycUVjymqRoiMtiZHIC++Pi6YCV7Z+EYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sSgqJZj/x/yG+F/xrrFCeUD9XWTfFS3nynwiFLXnHJI=;
 b=CRFZ4u8QgklzeJOynR+eWqTSbX6tj0B6NdWK/sgU5hMA56B2DGL6MpblDfOAsemhqJORJ72dnyQSH8SZJpKiD0SqXsZSfitzXbgwgtogh/8FC61IhqgKggh/P60FUZ42ObO2oPpFkaGrYJA27n+OYc1d1fC/g/DQVc6fb6wGAduH1HcIUA9iWyTw7x8mL9avN18WKYegPxj1qKFJkVnwNmusyG01XxTeU94nJ3Z2qSDt6RthaxELJrRuH9Xf1TNnQf7C4gJUIHVRmnRlOSr/Yi+n4jRSQVWkSjUCRIchX2bSYSjoMHZUnqODvSj8xzkRrRbgL3wiI9I7W4NhfWohWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sSgqJZj/x/yG+F/xrrFCeUD9XWTfFS3nynwiFLXnHJI=;
 b=jPWKRKkIWJXYv4022zMGmyW82AILShVXpam1plKk8deres/ceCMLL5chfBTUAsFDpu5hhBNfacsOif0cPOm8s1y0aru59v/LYpC6cMgjX+OZR7klDplREGDQaZ1Z4/H+XZ7OkGFGGMwcqBIkQNN0QSw5RBeq3WbkQoaOmUdtHrI=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by IA1PR12MB6529.namprd12.prod.outlook.com (2603:10b6:208:3a6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.34; Wed, 12 Apr
 2023 21:09:01 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::c22b:eb27:6df3:8d25]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::c22b:eb27:6df3:8d25%4]) with mapi id 15.20.6277.038; Wed, 12 Apr 2023
 21:09:01 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Stanley Chang <stanley_chang@realtek.com>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 1/2] usb: dwc3: core: add support for remapping global
 register start address
Thread-Topic: [PATCH v2 1/2] usb: dwc3: core: add support for remapping global
 register start address
Thread-Index: AQHZbO8cH9ZCWfll0katiOSqhSjtQq8oLB0A
Date:   Wed, 12 Apr 2023 21:09:00 +0000
Message-ID: <20230412210856.xcbp3crhbedjvnix@synopsys.com>
References: <20230412033006.10859-1-stanley_chang@realtek.com>
In-Reply-To: <20230412033006.10859-1-stanley_chang@realtek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|IA1PR12MB6529:EE_
x-ms-office365-filtering-correlation-id: 71b8e523-fc6e-4bd4-9391-08db3b9a235c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jLGMCO8E0EuEJSHC4IJGr4a54hWdqBEM15xcvSrJ6D3CJvuz1kgvsTZXRfujyQSMG97mdiNyLEje5uJAtGrDfl8W96S2suskOkjOtxtO+Bbu2LDM6P3JVp8Y777D9lhyg47dPUnQH2IH1sqmtUneiO4Er15pz/IJWN+4nKeYbtV0YWYr6TVn2sE/G9kJPgiFun8BGGxEmBJLr0AGNvUZhgCOulGryL37zCDvSg75A0jZoxPQiaSpOb9kYPL3YBOo7CSMp9FTh2kbuaj8jMEFmUrDHo9yhIGKNgApHnGZFsTfzJK4eSg+LT6Ywy1anhCHjKvgcCvqzm2lLVbOlhff1hqKF7155/XdJvD6xoH21kjaITr989fXTM7OxKHLXkfdfZjSb3eN6Fe/W7AP+C87sKFfCF3nzpCs1/T6gDDxzMqWtEi+dJ6+rg93iBZ0I4SqrTMc+hfsqGZLNtMp3HTZpJ9c+xLztnp4Wpv3PL9bFl4m0OetoJL9XVvo0omsdyF3NnVtJr0svVzA3OpXsVS16reOUy4ZuDwp32oaFwQE9AeP1ctupNm60OpHWfifenuPuZrklxrSBEvTr4jMkzT95fAfIoWB9grHk3/hzXnUDRNlwXfGpQ651nyWjpH1m74H
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(346002)(39860400002)(366004)(396003)(451199021)(38070700005)(478600001)(66446008)(64756008)(316002)(4326008)(66556008)(6486002)(8676002)(54906003)(66946007)(66476007)(71200400001)(6916009)(76116006)(41300700001)(86362001)(36756003)(2616005)(26005)(6512007)(1076003)(6506007)(5660300002)(2906002)(8936002)(122000001)(186003)(38100700002)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QnVNNjc1TWZsRlpxSHR4SDc3bCs1bnVjZEtNaEgvc0JSZ05ONTRQYUhsaER5?=
 =?utf-8?B?Tm5nRnl1WVk1ZUhQN004NXZUL1E4b2tDUkQ0U0UzVElSeWQwTDdvaHR6c0dD?=
 =?utf-8?B?L1VIbkRwYWFVR1hsV3o4ZFhOV2JDQzJOa3NLN01zZE9ORHd3ekwrQjFNY0JL?=
 =?utf-8?B?NFNtUWhKZ1ZiaTRJWTZXNG51TkJwU1hhV3BUeDRTcEcxTnlIWElrc3c5cEJU?=
 =?utf-8?B?T3FIWnk3MFZ4a1pQVFBtekx0S3JMUnpmUm45L0h6T1dHM0RSRFhlbFo0aE56?=
 =?utf-8?B?K2RVK2VZMXFvVmdreXFnTGR2UnBBbTNTaE1pbkdtWXpZOE1FMFRqZDhjelJj?=
 =?utf-8?B?RWFGQi9HOGtIbTJvWXd0R016V0tzcEpheTdCcUpYL2FtL0QzOGhYNm5xK0pr?=
 =?utf-8?B?RkdHSEJiMUwzVnlWYzk2ZVAwendPWXlZUzZOdnZRcVRuV3R1Zm1FTjE5OUR4?=
 =?utf-8?B?SkVlUDd3ZmtjWSt3OGYvWHRteHQwOGtEd28yVWdVUk9RWStCWC92Y2ZZaldZ?=
 =?utf-8?B?NXlyZXRPQjJHNHJ2b05PN2JFaWgvbHJEcUtjdGp1SnJXdGtIZHRhd0Vwb3ps?=
 =?utf-8?B?RmhLVU1QQ1l3dm04N1FpbUg5YmkwQXRYNGwvZDZoQmRHdEhvK2RueWdnQmxN?=
 =?utf-8?B?aVZlcFQ1VnVsd0U4UGtsUE9TWVZubU00b0dtSFNPbXFsbVo0RFVBRnlhR2J5?=
 =?utf-8?B?SDVPQXVKRWZzVFEweGUzemZOSldZdHlkcnppOHprSkx5bXQwZVhwMjU3TDJw?=
 =?utf-8?B?TkZGSUVoMm11WGJBTUpaSFZESDQrd0N2cHo1RzBVSm5VQ1RXNFVVWHV3UHUv?=
 =?utf-8?B?UFptaEZQcUdGUkZHcTZRdTB0NC93NGsrZzFtMXk0Qk4vRFBOZG1BL28yVWIy?=
 =?utf-8?B?RnJjTlluWTRFc0RZYlV2b2lXM0NLVVhMd3JaQ3EvWGpKMC9XZzQxOGFFRENh?=
 =?utf-8?B?SWl0UEVuRytXcUF0N0xPcTlxZ3VNc0g1bThoeDlraFZLM0N1OHk1SS9nbWdj?=
 =?utf-8?B?RjdlR25FbEJjNkxoaG5oMEUrYVJGZjJERU9WNkFsVk4xZy8rc2ptLzM0YWZP?=
 =?utf-8?B?YVQ4RGhZNE05dzlwaXdlUlZ3ZDR4UjZYTFNNSFRkcVF5ZmUySUF1ZTlkM3hQ?=
 =?utf-8?B?QitCT1Nwc3BvbktTM0dFUDhTKzhnd3hzN1FvUGxNblNGOE1BV1czdnNqR1Jo?=
 =?utf-8?B?NkNRaTB5RU1GSkN3WXVYSDJSSUtLa2hTbkRNaDFjOUpabWFJUmJJNzNNTVFJ?=
 =?utf-8?B?TWZ0SENERjE1NSt4c0Npc0JMRGhNY3V1YWRwYitLQ2dNNHdXMXZlYW5hb1pI?=
 =?utf-8?B?Z3pEZnFoSDcrU2pzbE1rVHVZMzJ6aHRYUE01bFFra2YzVDFjWDFkODlMQ1ZK?=
 =?utf-8?B?aGsxQUZjV3BOaENXUWtNTHJYQjFKbHdLb29QOUVHRURlSXlGWVhVRW5JREFk?=
 =?utf-8?B?YzVYc0RiN0tTT3dNOWZaNGZMZTUzNkRjbkZoMVNnRVFzZlBoOWJscFEvOXFo?=
 =?utf-8?B?WkM2aDRqSW1QcVVHYmpYdVpqZUJRdjNuZUJTV0lvVXdTWUR4Y1N2U1hlWmg1?=
 =?utf-8?B?TUkrYUFzUnk1azNZYm5XdkI4ZEt4ZmRCQUpJaytUdlRPSDRqWks1eFo3UmNU?=
 =?utf-8?B?aXM1UHNzVGlIMEFkV29VaVkwdjJDNmlnMVh3RGdpYkhlUExEZnAvYVFsOGxN?=
 =?utf-8?B?SG4wOVZkdmhpWE5TNWo1T1FjQm9ySXZHR3d6MkhoNExJcFNXMHJ2Q2liSlJP?=
 =?utf-8?B?Tnh5Rk5vWGJER2RnNmFFME81Sk16amVlbUN2TjVGZGpOTjh1cWpsZE55ZC9X?=
 =?utf-8?B?U2FmallHWFY0emVsUzlHQTBHSnRodVg3aUtubGppM01uRzBqaU16QXpxTWhE?=
 =?utf-8?B?SXRiT3U2aG5CdTdIWDFlcDRlOHhDRXFOTG9hZ0lDdXYvNllSYUZiTkpqN0ZW?=
 =?utf-8?B?alF6TUFma0tvb1ZTMnFRbkJ4VXVWbFF2WjhmbGYwbjJlVlJJVG9Yb0JiU2ty?=
 =?utf-8?B?TlZUS2crUG9mVWVCa29ZSGhEY1dzK0cyb1p0YkhMY29NL002dkVuMmZKRmlL?=
 =?utf-8?B?Q0pMbFJ2a1IwaG96d2xSYi84c3BpcnA5Y1Bybkg4NXM4RDhyVjZGTWJkaUYw?=
 =?utf-8?Q?hoco+tj8mKvjRq84VQbz/v/fs?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B2D1A94BDE619E4F9657EBB647DEA529@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: aKo2OiE5scQcVnhVZ+rwpr2ciPktwWsCOrwvCV6w+yhsxJX4ht2sWi1iCyL2PWUUVhOwGIbtiSP3sFgan10//yZQnlTl1hosGLcrAuVlLVZbbNR7+Qx8CWUKOlBTyjvEcIe1/FElUUxh5RYdrPbuE47kEjKDuq94Yvyiu/xXvOCIqmmm9/PtvfQq9Dj4GNtet8yrOR9rS2W7w8D13Vd5nNQOD1IdoUJMa2sNDXheXKADKpQEyuap5iFC1NauxtwkwgFDqlusn7aUyopX2dC+kGaIviTec0l9839ha3duAgrD59Tb6l3P0KcDpmbtRknkhoQeGobX77kHlBHi2DpMN/N9eJzmC835vSOx4fsu/bovQtEgilQUDlbzQZQVbuWbCQ+vWk9MTrICTMMqcDdBDYh9Yyu1iMAsKzcoKcJi8Id/wBimNW2r8BdD6dWQ/Jbsf9O32W/txV3XbIhJ+6WN2E5tuImz3rnsfuiXMTYH5zbhKYzBf3dQSkWwvKMa26MWw1JUmHnYNkqoNfATW6gqx8suR04ycYaQOqDoO5p30wDMLlWmDRo4Xee+1Q+YyiBVfFL5Z72Zn6oQ1/yqhjH3tIQP7r45Yk5Jtg8LLxSxKk367I/Rxbi+CpfjM5rs0DmW3/CPGzGoyXNZE3nvvTQjcKt0cbCeR9DeFeo8AL0pbHpHE81pZhOi90BjZFEUgxTyexUGJBvTg+lkDGVBszjBPk/Lo0ypPbilAWIH7K4R9OjQ8e3m68K/1GhI+NU4R3nJTJ+Bg4nKJO3hbQRZU70GuE/K2zvX30BDmj9Fak8b8ma+bPFoCRwGEdMiT+s12aja9sGpyXUbo6rFIo3Per+jLl4AWS7X7PBmHdrGx6f2OCQ=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71b8e523-fc6e-4bd4-9391-08db3b9a235c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2023 21:09:00.6855
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PBmNxSebaMX31EPJwNaN3kadsSGHUfCJvmIm5k77kUIBbeGWXcNz9pxaMG5YhTipC/fKqSwxY3y0CdQAzPp3EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6529
X-Proofpoint-ORIG-GUID: 72QwEMJwJqOL-8tI4ySiFgoLluG1X9oo
X-Proofpoint-GUID: 72QwEMJwJqOL-8tI4ySiFgoLluG1X9oo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-12_11,2023-04-12_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 bulkscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=999 malwarescore=0 phishscore=0 clxscore=1015
 suspectscore=0 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2304120179
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gV2VkLCBBcHIgMTIsIDIwMjMsIFN0YW5sZXkgQ2hhbmcgd3JvdGU6DQo+IFRoZSBSVEsgREhD
IFNvQ3Mgd2VyZSBkZXNpZ25lZCB0aGUgZ2xvYmFsIHJlZ2lzdGVyIGFkZHJlc3Mgb2Zmc2V0IGF0
DQo+IDB4ODEwMC4gVGhlIGRlZmF1bHQgYWRkcmVzcyBpcyBhdCBEV0MzX0dMT0JBTFNfUkVHU19T
VEFSVCAoMHhjMTAwKS4NCj4gVGhlcmVmb3JlLCBhZGQgdGhlIHByb3BlcnR5IG9mIGRldmljZS10
cmVlIHRvIGFkanVzdCB0aGlzIHN0YXJ0IGFkZHJlc3MuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBT
dGFubGV5IENoYW5nIDxzdGFubGV5X2NoYW5nQHJlYWx0ZWsuY29tPg0KPiAtLS0NCg0KUGxlYXNl
IG5vdGUgd2hhdCBjaGFuZ2VkIGluIHYyIGFmdGVyIHRoZSAtLS0gbGluZS4gQWxzbyB3aHkgZGlk
IHlvdQ0Kc3BsaXQgdGhlIHByZXZpb3VzIHNlcmllcyBpbiAyIG5vdz8gSXQnbGwgYmUgY29uZnVz
aW5nIGZvciB1cw0KbWFpbnRhaW5lcnMuDQoNCj4gIGRyaXZlcnMvdXNiL2R3YzMvY29yZS5jIHwg
MTggKysrKysrKysrKysrKysrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygr
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jIGIvZHJpdmVycy91
c2IvZHdjMy9jb3JlLmMNCj4gaW5kZXggNDc2YjYzNjE4NTExLi45NmQzZTYzNGViYmYgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3
YzMvY29yZS5jDQo+IEBAIC0xNzg1LDYgKzE3ODUsMjQgQEAgc3RhdGljIGludCBkd2MzX3Byb2Jl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICAJZHdjX3JlcyA9ICpyZXM7DQo+ICAJ
ZHdjX3Jlcy5zdGFydCArPSBEV0MzX0dMT0JBTFNfUkVHU19TVEFSVDsNCj4gIA0KPiArCS8qDQo+
ICsJICogRm9yIHNvbWUgZHdjMyBjb250cm9sbGVyLCB0aGUgZHdjMyBnbG9iYWwgcmVnaXN0ZXIg
c3RhcnQgYWRkcmVzcyBpcw0KPiArCSAqIG5vdCBhdCBEV0MzX0dMT0JBTFNfUkVHU19TVEFSVCAo
MHhjMTAwKS4NCj4gKwkgKi8NCj4gKwlpZiAoZGV2LT5vZl9ub2RlKSB7DQo+ICsJCWludCBnbG9i
YWxfcmVnc19zdGFydGluZ19vZmZzZXQgPSAwOw0KPiArDQo+ICsJCWRldmljZV9wcm9wZXJ0eV9y
ZWFkX3UzMihkZXYsICJzbnBzLGdsb2JhbC1yZWdzLXN0YXJ0aW5nLW9mZnNldCIsDQo+ICsJCQkJ
ICZnbG9iYWxfcmVnc19zdGFydGluZ19vZmZzZXQpOw0KDQpJIHN1Z2dlc3RlZCB0byB1c2UgY29t
cGF0aWJsZSBzdHJpbmcgaW5zdGVhZCBzaW5jZSB0aGlzIGlzbid0IGNvbW1vbiBhbmQNCm9ubHkg
dW5pcXVlIHRvIHlvdXIgcGxhdGZvcm0uIEFueSByZWFzb24gd2Ugc2hvdWxkbid0IGRvIHRoYXQ/
DQoNCmllLiBzb21ldGhpbmcgbGlrZSB0aGlzOg0KDQppZiAoZGV2LT5vZl9ub2RlICYmIG9mX2Rl
dmljZV9pc19jb21wYXRpYWJsZShkZXYtPm9mX25vZGUsICJ5b3VyLXBsYXRmb3JtIikpDQoJZHdj
X3Jlcy5zdGFydCArPSB5b3VyX3BsYXRmb3JtX29mZnNldDsNCmVsc2UNCglkd2NfcmVzLnN0YXJ0
ID0gRFdDM19HTE9CQUxTX1JFR1NfU1RBUlQ7DQoNCj4gKwkJaWYgKGdsb2JhbF9yZWdzX3N0YXJ0
aW5nX29mZnNldCkgew0KPiArCQkJZHdjX3Jlcy5zdGFydCAtPSBEV0MzX0dMT0JBTFNfUkVHU19T
VEFSVDsNCj4gKwkJCWR3Y19yZXMuc3RhcnQgKz0gZ2xvYmFsX3JlZ3Nfc3RhcnRpbmdfb2Zmc2V0
Ow0KPiArCQkJZGV2X2luZm8oZGV2LA0KPiArCQkJICAgICJkd2MzIGdsb2JhbCByZWdpc3RlciBz
dGFydCBhZGRyZXNzIGZyb20gMHgleCB0byBlbmQgMHgleFxuIiwNCj4gKwkJCSAgICAoaW50KWR3
Y19yZXMuc3RhcnQsIChpbnQpZHdjX3Jlcy5lbmQpOw0KDQpEb24ndCB1c2UgZGV2X2luZm8gd2hl
biBpdCdzIG5vdCBuZWVkZWQuIFdoYXQgeW91IGhhdmUgaGVyZSBpcyBmb3IgeW91cg0KZGVidWcg
cHVycG9zZS4gUGxlYXNlIHJlbW92ZS4NCg0KPiArCQl9DQo+ICsJfQ0KPiArDQo+ICAJcmVncyA9
IGRldm1faW9yZW1hcF9yZXNvdXJjZShkZXYsICZkd2NfcmVzKTsNCj4gIAlpZiAoSVNfRVJSKHJl
Z3MpKQ0KPiAgCQlyZXR1cm4gUFRSX0VSUihyZWdzKTsNCj4gLS0gDQo+IDIuMzQuMQ0KPiANCg0K
VGhhbmtzLA0KVGhpbmg=
