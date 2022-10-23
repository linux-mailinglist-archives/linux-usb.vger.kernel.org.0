Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B0ED609723
	for <lists+linux-usb@lfdr.de>; Mon, 24 Oct 2022 01:05:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229765AbiJWXDb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 23 Oct 2022 19:03:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229741AbiJWXD3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 23 Oct 2022 19:03:29 -0400
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (mail-lo2gbr01rlhn2162.outbound.protection.outlook.com [40.95.78.162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B8D969194
        for <linux-usb@vger.kernel.org>; Sun, 23 Oct 2022 16:03:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cQHTqX8hTFefB+BGBZDpFIH6yn+SqofhpqeE/jcpUchDOOTixIQu6lJ6n8WrR94EbE2QlYy9bfiKTSFIrl/qxlul5Ghfc6pvZ3omR8ZR0qAMXiR7QbZHhs04d7QM0IDTZR8MSBd7KR5SK2wGWHHb0gAGxKDYxSGLIaxhkBkTh/21T9qaWLRb9pYgeGPzX1qjqD5QpqQYh92Vb12iH7Rrt2/UsEo7P/IwI/y/pIvMQHZ723+EiP2qwq3/uGgAXv/eyJZNlAyH0XHvknktbKukkSgb7I0N5lTn1IJJwUn07I5kpE6F7msS4miSBaEfr+4RCWNgmPiXx9wdHVoiHLqgLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nq4MqPwcsOWaECz0wSV53g2tUCbwHfCMZsI8dJAoqjQ=;
 b=LEmc1KXaiUPhGA7m7SZnHjAFua8ULhd9LbvCBcvaq3GCG0nrIJNfbBvHxQhTxs6XENnHZ/SjGGZwYkGstPGApw7qHUwTZkROMHZUgyqaE+GsMpKQrhwTLbmjWgCq+b67v22hHH4vAFgtOPE8Iyd0BxgBD1oNQnJm8dCAMjDg8U8jXyQe9r16kxLgGiuJnrV3Ugyxk7sfrS6DOexEhb1aCl46eM+fQYtpaK4LZg0a5gsXtEgzGvdEoUFdW4y4MpXDUoYAZaSldg/0a9aY5TQnEiT6bbi69ZcurPxnFoYuiColbDb0g8kxx0ZD3KxuylB/aUtNYk3wr0Na9ZGRkeczmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 213.105.56.180) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=gmail.com;
 dmarc=fail (p=none sp=quarantine pct=100) action=none header.from=gmail.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brineleas.onmicrosoft.com; s=selector2-brineleas-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nq4MqPwcsOWaECz0wSV53g2tUCbwHfCMZsI8dJAoqjQ=;
 b=W8X9V5PauTgPQQmbwmfFdxj4YHrKnXZAwUDZWuNqK88m7hxo0wArdoVgFiE1CV69PO9doUfU9UhJYYsMWdOe+aDUxM5ZtunDgnCMNEQS5asZoxmulPta9prm2Rt2nZpUb5ci9wNn0KKYW8Zi8xMJwg5eM/zAbr5srh19b5DSdh4=
Received: from LO2P265CA0095.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:8::35) by
 LO6P123MB7351.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:37e::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.23; Sun, 23 Oct 2022 23:03:26 +0000
Received: from LO2GBR01FT031.eop-gbr01.prod.protection.outlook.com
 (2603:10a6:600:8:cafe::b1) by LO2P265CA0095.outlook.office365.com
 (2603:10a6:600:8::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15 via Frontend
 Transport; Sun, 23 Oct 2022 23:03:26 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 213.105.56.180) smtp.mailfrom=gmail.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=gmail.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 gmail.com discourages use of 213.105.56.180 as permitted sender)
Received: from webmail.brineleas.co.uk (213.105.56.180) by
 LO2GBR01FT031.mail.protection.outlook.com (10.152.42.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Sun, 23 Oct 2022 23:03:26 +0000
Received: from BL-EX01.brineleas.local (172.16.0.40) by
 BL-HBD01.brineleas.local (172.16.0.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.14; Mon, 24 Oct 2022 00:03:15 +0100
Received: from gmail.com (192.3.223.142) by BL-EX01.brineleas.local
 (172.16.0.40) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 24 Oct
 2022 00:03:13 +0100
Reply-To: <chooleech@gmail.com>
From:   <adaincle@gmail.com>
To:     <linux-usb@vger.kernel.org>
Subject: Partnership
Date:   Sun, 23 Oct 2022 16:03:13 -0700
Message-ID: <20221023160313.3994CE3BEFBFA2C9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BL-HBD01.brineleas.local (172.16.0.41) To
 BL-EX01.brineleas.local (172.16.0.40)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2GBR01FT031:EE_|LO6P123MB7351:EE_
X-MS-Office365-Filtering-Correlation-Id: a4149d67-3f0b-46a5-7a93-08dab54acad0
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QVYyY2lXOW9Jc0s2Mm4xSzlyQXBCYmlaL2I3WExtM0d1R0hyNHhRRXJhR0pS?=
 =?utf-8?B?aHE2Z3QwTXp0TVY5OXA3ZmRPcUEwV3NKak1IRkRlRDV5TzQwQTNCdzFRRGov?=
 =?utf-8?B?QUtkNEszdFhOZXRGTG9CMmVoTEtVTmJkZk9zbVp6ZTFuWW1FWUZlYlVraFVG?=
 =?utf-8?B?UUJaZ1NWU2JQeWQ3ZXRjZm1nd2xuRkRmcUdzM1VMTmFFMWZRRmYxM2ZhQ1ZQ?=
 =?utf-8?B?elB4VDNrZXdDR3o5d2xvZjg1L21pQU9YeU9oY2R0eHRKNmo2ZlFlSjNkOFNh?=
 =?utf-8?B?eDVvNGs3enJ0OWFnOU1jUlBYRlN4UzQ2RlN1dUhneXh0dVAvL3BYTHRYNHRk?=
 =?utf-8?B?MjQwR3N6TWxCQmxwOEZ5TCtFdmI5S3NyM25JaGJlbVduS3hzL1dTWU90SC9Q?=
 =?utf-8?B?eTAwRmkwNENtOSsvSmZ6aUdNMkwzaWNDZEliZ3RJSVpkWTBIRFJSaitqSGhR?=
 =?utf-8?B?N282VnFkY01VMmdMVGZENTlhcnZhcTVKL3orN3huVndlU3ZqQlVocm55MXFO?=
 =?utf-8?B?VHFpQnNjY0NxZGlDVW42a05KSmdiNDhpRW03MWx6OXF2NW4rWkxZVGFNYXl5?=
 =?utf-8?B?S3l5ZzJVbnpjOVBjS0dwc1AveVdubnlIaDc3bjFpVGIzK1RITU9UTmJQcnd3?=
 =?utf-8?B?NzZIRmJuY3lzVkwrMHhCekZzZmdoOWhCNXVSWnpCTlh6azR6QU56dGkvYy9R?=
 =?utf-8?B?UHM1YnhjbGthUzY5SHYvS0M2T1BReVZLb3hCTnJuZUFjUEZ5a0tseHdwRVFP?=
 =?utf-8?B?RVVHYTBtTTMrZmw1SnNwVGhyUjQ0L3N2c0IwZFBNeXdCUER5bWxZc0RZRnVr?=
 =?utf-8?B?Y3VBSXV0SUlUQWRabzU0b254MzBabjBGV3RMLzI2T3FmM0xIdHZYRm9rRk1n?=
 =?utf-8?B?aXFlWTh6Y0ZaRjFQOUZyL3JlK3lBWE5LVzdlbUZiQ3VQdVZlL2tLRmxVNmtr?=
 =?utf-8?B?eFZxQVpzWk5TNjh3RmFHWlRudXBnN1h4ZmM2aWgzcXAxOTFGcDVkWlRxUnR6?=
 =?utf-8?B?THdINTFDWkJsdHFxZjhobDJBd3hmdWlndTh1dGNBeVQxaXlwSmxaUGZrZTVs?=
 =?utf-8?B?MDNYZks2NlEwclBrQWxkbXBrKzBhV3ZyMnpnNXdPKzA0NEVDU1FrWTVYRVVL?=
 =?utf-8?B?V0kwb3hQUTVyTFUvYThUQmhBUE1pVDd6RTdSTFJQM3JseHAyZytHcDNqM2pt?=
 =?utf-8?B?S0FudkpZeWZJODJXRzdwVGVTeGRqR04vb3A0QlI5Z01YQ2F5R1JsSWFmSmNz?=
 =?utf-8?B?dVE2TXlwbTlCQjBTMTlDTGpxbmlYcG9xMDY3cEJkVFAwSm5OamdvbHJyVzVv?=
 =?utf-8?B?VFhMWUkyVWRaUHFCaUU5S2Fhblp3OEQyNEJVcHFzTVE5OTZiWWxteklWQnpz?=
 =?utf-8?B?dGtzanhuQ2J2QUtpdEl0ODBVUGdrenpJMmd5TkV1RUg2QlVqWnFtYS90anVz?=
 =?utf-8?B?U2xHK3YxcWh5OFpuTEY2bVhGeTVoVFNSVzYrQStVblVYNndLb1RVOHFTVjlD?=
 =?utf-8?B?bGFSR3RPay9rOVl6RWlLU1IrazR3NWF1RExJTDk0VVpQT29Cdm1lc29BSWd3?=
 =?utf-8?B?djg0dzJGN0lzdUxsaFJXYjhUZUdaTnlDZlQyRndJbG8xNnh0WTlLK0t4d2hm?=
 =?utf-8?B?a1ZEdG01dDFlZWtDZzR1NlVWMHFISnc9PQ==?=
X-Forefront-Antispam-Report: CIP:213.105.56.180;CTRY:GB;LANG:en;SCL:5;SRV:;IPV:NLI;SFV:SPM;H:webmail.brineleas.co.uk;PTR:180.56-105-213.static.virginmediabusiness.co.uk;CAT:OSPM;SFS:(13230022)(396003)(136003)(346002)(376002)(39860400002)(451199015)(46966006)(40470700004)(316002)(498600001)(786003)(1076003)(82202003)(103936005)(356005)(33656002)(40480700001)(82740400003)(6916009)(4744005)(55446002)(86362001)(26005)(55016003)(8676002)(2906002)(8936002)(76482006)(2616005)(47076005)(956004)(2876002)(2860700004)(35950700001)(36756003)(5660300002)(83380400001)(82310400005)(7696005)(70206006)(70586007)(336012)(40460700003)(73392003)(54836003)(41300700001)(7116003)(41320700001)(3480700007)(135420200001);DIR:OUT;SFP:1023;
X-OriginatorOrg: brineleas.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2022 23:03:26.0433
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4149d67-3f0b-46a5-7a93-08dab54acad0
X-MS-Exchange-CrossTenant-Id: 41a4300f-9b0d-411a-a67e-115d58d05597
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=41a4300f-9b0d-411a-a67e-115d58d05597;Ip=[213.105.56.180];Helo=[webmail.brineleas.co.uk]
X-MS-Exchange-CrossTenant-AuthSource: LO2GBR01FT031.eop-gbr01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P123MB7351
X-Spam-Status: Yes, score=6.4 required=5.0 tests=BAYES_50,DKIM_ADSP_CUSTOM_MED,
        DKIM_SIGNED,DKIM_VALID,FORGED_GMAIL_RCVD,FREEMAIL_FROM,
        FREEMAIL_REPLYTO,NML_ADSP_CUSTOM_MED,PDS_HELO_SPF_FAIL,
        RCVD_IN_DNSWL_NONE,SPF_HELO_FAIL,SPF_SOFTFAIL autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [40.95.78.162 listed in list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.7 SPF_SOFTFAIL SPF: sender does not match SPF record (softfail)
        *  0.0 SPF_HELO_FAIL SPF: HELO does not match SPF record (fail)
        *      [SPF failed: Please see http://www.openspf.org/Why?s=helo;id=GBR01-LO2-obe.outbound.protection.outlook.com;ip=40.95.78.162;r=lindbergh.monkeyblade.net]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [adaincle[at]gmail.com]
        *  1.0 FORGED_GMAIL_RCVD 'From' gmail.com does not match 'Received'
        *      headers
        *  0.0 DKIM_ADSP_CUSTOM_MED No valid author signature, adsp_override
        *      is CUSTOM_MED
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  2.0 PDS_HELO_SPF_FAIL High profile HELO that fails SPF
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  0.9 NML_ADSP_CUSTOM_MED ADSP custom_med hit, and not from a mailing
        *       list
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I am Mr. Lee Chong, Business Relationship Manager at Nanyang
Commercial Bank in Hong Kong, China. I have decided to contact
you regarding the state of the client who managed an investment
under our bank many years ago. If you are interested in
partnership kindly reply to my emails for more information
email: Leechong@asia.com
Respectfully,
Lee Chong

