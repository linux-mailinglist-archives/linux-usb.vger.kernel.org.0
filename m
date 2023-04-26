Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 606256EEBD4
	for <lists+linux-usb@lfdr.de>; Wed, 26 Apr 2023 03:16:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238472AbjDZBQv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Apr 2023 21:16:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231622AbjDZBQt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Apr 2023 21:16:49 -0400
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 626E4B217
        for <linux-usb@vger.kernel.org>; Tue, 25 Apr 2023 18:16:48 -0700 (PDT)
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
        by mx0b-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33Q0gvi1002533;
        Tue, 25 Apr 2023 18:16:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=o5ADcNwJU4yLdgk4S+6TaRB42DpRDT4lQep+7G3+hsk=;
 b=FA1l10TneWW5O3glwG0JBt8fhE6p42x2ak63cc3DDHiLgFhZjW2IevtttXh1zEFFpX/L
 W4+gkiFhLlsSDRfTk922od8W0qpWXSokXC7Jmq2Oi6s6odkY4Y175T7lBftGDOD9fnk3
 IvxIZ5+0PlqEg5JOcpa3tVqHCLX55CR3ngpqV5cB71sbt29WKbZyPxaBqKbiwBeEo6sA
 I1M8VenF656+GAR6Cm5VBpxQeDHFoVdWkMpqSagKUhIzK/ddeUjjKn6Pii769TC2+4cF
 g8DF0cAxaL+tTzCyVe2LwSoWZ90beF6uzcvvgog9otgv0KsfAeFf+jbb/oNYJvLU+olu /Q== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3q4yqpdkp7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 25 Apr 2023 18:16:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1682471795; bh=o5ADcNwJU4yLdgk4S+6TaRB42DpRDT4lQep+7G3+hsk=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=czCUHjadiLABrl2maDF+fAbAXseRXl02pJvpY/x0lJU5ztkgXNFomFuM7jyvIge+s
         M0MV0bsnPbwYtogtmyJK0IwvR5DTVskysMnk3tBBrmYcup6AeLK3RTabOUG4H49S57
         acd5eu8uqm3A4HRDOJMmYoGXGPiGdS//a0V6aqvi4G2PCBWt90DT43DAkoKizk1+o6
         WE5Gn4Agx9/9AvBnfZk5p7stTGEETgIOe0F01vPbS0k4tGkjTcLWRUSvbfKHETZXb4
         uAVakM4wBAMyUBwjUDSYj+yJltFL5xhV9iAAB1mQRAzQdqSC9BXICyWroPXJBqcncc
         h0ImcwPLXBH/w==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C36CD40525;
        Wed, 26 Apr 2023 01:16:35 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 4F72FA0083;
        Wed, 26 Apr 2023 01:16:35 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=IXzLbbee;
        dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id D650140616;
        Wed, 26 Apr 2023 01:16:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C21944Y3vj7+G3gDdQsxY1nVHUmTi72Jp9Dle+xxBEXXkmKK7Bd2J7rQIRQrtQSpi7acUf0wzfUBlKOFe94yDSvFigMJf23AG/ev4J5fD3sRfEXndDqy0iiLY6Dsu9FqC23/9cR3GOUbZVEWdjmzIXPxwKIdHVY+GefaDmvgQOVSS1cYgtuMHz6QUF5J/oeqNP3jnB8Ih6rlBfUrR4qAaTkoYIQCPZUUyd+IfsPwzcGY2pcqenAjlVsxjhjC15QsqTWXes5Ea3z+oQcu8MK3qY44i/x2j88aEtHxQRi2xbgaPC8yQfkZlAFWOydplL5FYd+/qUgkhTkOP2bD0pL9nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o5ADcNwJU4yLdgk4S+6TaRB42DpRDT4lQep+7G3+hsk=;
 b=OgTWIw32sa3XRCukJYgqhFVWJDTHOBrxmUGEHhXQGIi7MOtANaE7TJmZQyltCTX3RKiZXKHBbBUAlEvfSwHKaANN4sciV/CFbElhto0jA0MQEgaogbbjw96xoqhYNqc/fOM75nTJsSsSGPHdeOn22K63YinokosH1K23pjHW1kTEdJdEsqxCR77ytZRMCGZIfBP1pYIvSTU7ajvSHZG/NTX7uPCfgWPRFqF+LUp8fL8Ri+vvNYvfDjzV9dMBBFqpo2nU5AboNeuYOzRz2xPGwRbyKit3nK2mu+ovGokfZQOl25Bi3SPa9FCnCnqK5z5V5eW8Uy9mRbmBkyWuz2nnlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o5ADcNwJU4yLdgk4S+6TaRB42DpRDT4lQep+7G3+hsk=;
 b=IXzLbbeeFF34aZscZhTomoiD0QahJZXGWsOZGpOm7xsW89yjU8t1HUKOyrHeEmY1xO+z6lqntTQ4mTn09HyWpwSSnk5e7x7n4gI0VFsxuoSjXNGc3NUFFu8di89B0+sXEu4NuFRhSfeLAi4es/dZO3vLwHkx2qMCd5viqUE+NsA=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by DS7PR12MB6189.namprd12.prod.outlook.com (2603:10b6:8:9a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.20; Wed, 26 Apr
 2023 01:16:31 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3103:ba85:b667:315d]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3103:ba85:b667:315d%7]) with mapi id 15.20.6319.034; Wed, 26 Apr 2023
 01:16:31 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Udipto Goswami <quic_ugoswami@quicinc.com>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Oliver Neukum <oneukum@suse.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v6] usb: dwc3: debugfs: Prevent any register access when
 devices is runtime suspended
Thread-Topic: [PATCH v6] usb: dwc3: debugfs: Prevent any register access when
 devices is runtime suspended
Thread-Index: AQHZc0dvLo6FvD3Z5UiA8dqpbjY4BK880uaA
Date:   Wed, 26 Apr 2023 01:16:31 +0000
Message-ID: <20230426011629.b5pyes5vn77szcxi@synopsys.com>
References: <20230420051705.27801-1-quic_ugoswami@quicinc.com>
In-Reply-To: <20230420051705.27801-1-quic_ugoswami@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|DS7PR12MB6189:EE_
x-ms-office365-filtering-correlation-id: 30e7e4e3-3504-4e94-9e7c-08db45f3de73
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XVbRve/ilpck9ja3J6zod/r9xNS4i4ne9MvU8P2yHlIPnkFssG0rN7R35yFp1/PDVWFNl/fXXiFPbaKj/jsPTXgefxp9cWZxBkJTlhsIxSoE3p4DNLklyyoVTi72s3NBTR8TSRrpe4IFhTzhGP0NJHlmLsDMuP2IeQDQwWWV9teGprD026mebUyNoqNwsUWRS41TVNwoZNxTwGuL9a7CxHkUb2mZGdXFAN/jvqL9fg1H2vLGJ/xf1AqnOB0qs/II5a5RadsZ9wByH+Fozt746TaQEjcMjxx80jqUcLWCgbxuTNK48i05+l0yIgv7JUNq9dfOIaVhxqazsNMxhHPK2k/AWHdBQ3E1TENAnrdMKuUz4pPg0KLp4pBX1iU0nUTdAmhoK345bDbdBumt39xvF6MscgRvNrhrFUMJjOuZdu7RwhQJW+KwKPX8FJp+iKIBShaszWTZim50CzqogKq7pab7gse390oFHp2G2DVCsvS2kqDBqE6OktF8IKVNz2V/7TkhszF7aaH3/n7mEQ5M3PSUKbh17H6MG+cFEd4alFLdiGz+iry7CWjDZWLlJkIxW7zM+BI8a4rTpS3yfyIcdUNdiuZj3K9RUsCkGKfJ/m3+vd9lfOtJliONIuPDDIOQ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39860400002)(136003)(366004)(346002)(396003)(451199021)(15650500001)(38070700005)(2906002)(30864003)(38100700002)(36756003)(5660300002)(8936002)(8676002)(86362001)(71200400001)(6486002)(1076003)(26005)(54906003)(478600001)(6506007)(6512007)(2616005)(83380400001)(186003)(316002)(41300700001)(122000001)(6916009)(4326008)(66446008)(66476007)(66556008)(64756008)(76116006)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ay9XYks0dTl1R2pCTTU0ZkQwYVJXSU55dVVZNSsrNVNkMk4zYUdDWU5MaGZC?=
 =?utf-8?B?WjU4K29LUExETnd5ZCtveU0wWTdWZmVCQi9uamlGVnJZTXM0MFBId1VEQkdy?=
 =?utf-8?B?NkxZK0hMSms2TWZRMXlGc2NlaXZqS2xPRHdYNzR5UHZGOE5JOTZEelhOVWVO?=
 =?utf-8?B?MnAwTXBHK1puV2doT3RkaFVTNVJwUEtKU0FZV0k4R2xhTHZyRm54NFl6MzNM?=
 =?utf-8?B?eUVyNFpEN2xjbCs4QzduUWEyTUYwZXg2YWM4NEJodDltTjhoVU1kSHNzTDRa?=
 =?utf-8?B?dFlZYTRPaFlFb3VMd0paN3pTclEyeGJqN1JDRXRkV1NaQjBVbHAzbVFIWEh5?=
 =?utf-8?B?QlQ3TnBnYjZlTW8wTmpiNXcyUkZxbmJ3NTNDdVhTVWgzQ0pkT3MwZjd3UWsx?=
 =?utf-8?B?c1FScXl0aFVyTmZOWXlGT3RYQzJTbXNPRjZOdXRmR2V4Ym15dlI2S0c4bnFx?=
 =?utf-8?B?ajBlNENwUUowUUJrWFN5OFhmN3NaMmFyeHczdW9pZXlQNWF0RjdvUWdmK1ZD?=
 =?utf-8?B?VkprRmR4Zm9xTERqQUxXL0FDalhzT0ZtRFVGU3l6djhjSDljRWc4a2RwRGpx?=
 =?utf-8?B?TlBINUpwSnNBOEV4VHljKy9RU3NwcG9OQm5kbjNaSVY1bzU2b1dBN2VwUFlF?=
 =?utf-8?B?dE1ORk1lSmkyQUxRYzA5bW9tSHRzTCswM29USkczQkJ1Q3BhOVlnTjNKbEt0?=
 =?utf-8?B?UW1wUC9GTmR3TzF1cHNCeEZpR2tVWTFzTzYrVW5XL01uclE0dzBUbGs1cTUz?=
 =?utf-8?B?T2NhbWxmRUNEdEtIUTEzNFdDcGtLTEJoMEtSaFVpcUhIYTVXOHRhT3JMaThK?=
 =?utf-8?B?Z25XMGQ0UjBJdzBHQXIvUVNFOWJyTmJ5L1RFTkpPN1lBQUVZM05hRlhJZGJu?=
 =?utf-8?B?d1BycGVlcFIxa2QyNVAvV1dKUGNWcmNSZnhQRHFDTDltc05wUU8rV1VwSklM?=
 =?utf-8?B?RlMvSzJwUjBSV1R4OGFleFNwaUxublJ2UTd6M1duL1o2Wm9JUzVSQSthMUJa?=
 =?utf-8?B?cE9UdXJOMVJqV2s2NHMxajg1a3F5bEFrMUpoK1NKSUFCT1BTN1ViL2RNWVRS?=
 =?utf-8?B?aFRqeGNUVWZQMEl4ejYwMjk3eUZveDE5K1N2a2k4ekpOQXo0eit5NDhLM3Fk?=
 =?utf-8?B?U2Z1MnMyZ3pFR1lRVStIMXZFTm5rYzZiNjFuM0loWVI1UVdqREFUYXFlMVNS?=
 =?utf-8?B?c2F0TW9rNGtQK0ZZdmZFU3pTL2tWeHNhTEZnODc5SXY2T2dpaTZRSlFua2sv?=
 =?utf-8?B?NWtYWG9yU3lidURDZXhUS25QcC9OMTIrb1RCTlF4azl1Uzd0SlJkenlkRDRT?=
 =?utf-8?B?WW5rQ2pZWTFZcGZjRXVOa1ZTTnhUc256RUwwSUN2SEYrekVCUGlKZzJQa0U4?=
 =?utf-8?B?VmxnTHhpQnc1eXhwTHBsQzRPSzAvTndwL2k1TkVRd1RMNmIvTldRSEpWSUh3?=
 =?utf-8?B?eFBJZVpZdXhwN0tldFhma2lPcVRlRWtSME9xWjhMTXltZ0tvbFRVYmxMWU42?=
 =?utf-8?B?NTExYzMxdGZSRmg3Qi9wOWsrTGhzZGNpanhqMTNQWkVMNmFsbHRKa0l3Umxh?=
 =?utf-8?B?ZHhWYzNpM2RwVWVsU0N1cE9JNlhNTitmUHhYZzdrQWRiSUpYWW4xZ2c5SDBR?=
 =?utf-8?B?SjZ0aFA2S0hvQnJiNEdOMFc5OGRuUm5HN3V6V21mNWdkSkt1YUh3SVI5bVlq?=
 =?utf-8?B?cHdZdFROZTJqeFhHL3pLVnp3WklsZ1oxMS9NV0RRUFpYbVVnR3lVWVphR25K?=
 =?utf-8?B?bDg0MXJEMUxhMWJkdGFtWUtya3RmNHBScXlWZlFBRmtiS251SCt2ek1YMkpu?=
 =?utf-8?B?RmtHa0tYdGM2TkFkRWg3UUM2RFo3Mnpra2cvKzJpclNHWW9qMmxxQlJuL0Za?=
 =?utf-8?B?ZjRtMmFCWWUvaUNJNjF4cURvbFhhSHhQVldaaVFvY0pvL0JYbDVCSDY0NTdV?=
 =?utf-8?B?TzVGeDZ3VnFab2dUdVNaWW9Nb3lxS0VHNEttRmk2S1FsWjRtZGRCYUovV1Rr?=
 =?utf-8?B?YW9mWDRJOTgrdTFBbzRIdkhML2VrenNHYm5lWkR1YTFqUDNzVmNXWTEwL2dK?=
 =?utf-8?B?a1lzMkE4ME5HRnV4L0hwZG5aYmdTSVhwcmx0Y2lWeHhwVEFLR1NnNlV5eEp0?=
 =?utf-8?B?d0tISElzalE4NGt1dllYQ21yY0Y4N0xVelFyOVpSTVB4elh6bmFCNHRNeEdt?=
 =?utf-8?B?aGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <357CA9E4259C4C42B65D188AAA5FAFC8@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?Sys1UGorNjRBWXpWZjZrY2s2clpOVUZwTk1CTUpIUFhMQk5VUUxZQ282bmUz?=
 =?utf-8?B?dU1sSkxvRnhQa1lxK2VZM2cvZk16SUx4VzlmNzhOV0dyaHcyU05VejlvcmtM?=
 =?utf-8?B?NWpnbEpBUVliMnp3WWc1ZGxCUWRueG1hZ3FVSm9rOHd4dUR4bVNYSnhSMmpj?=
 =?utf-8?B?bkI0ejVhV0JQN0RKeE5wT1ZYYjZMMmdSbGM4Mld6eWhSd3pkeTZoQk9YQWNz?=
 =?utf-8?B?TFVVZDBaQ0s2YUxmdkEwdXpaakJnNCtFZGgrbitBb2s4S203M1J6WXRGNGl1?=
 =?utf-8?B?bkJIN25TaVgxOHk4ZnM3MkYwOC9zb2prYVVmVXhjSFYxUklXTFh6N2FadEdt?=
 =?utf-8?B?VXM4cFpmNnBlZSsxWklPTU1WVWhOdU8wN1V3RTFWV1gwWVF4dkZXWEYxV2Ix?=
 =?utf-8?B?b2UzTjFMQkRYSmpOYi94OWhaUnpJTFZYMmlYUXBMcnU1YnhjVzQzRVRRU3Fj?=
 =?utf-8?B?OW5EbjB2OWdTSHhGQitGUVM5Z3NKMzdST0F2c2tjUkdtT0hNQ0psRVprRk1P?=
 =?utf-8?B?b1VoRHJoSm5QdEtPQ01zZk5UenEvanBud2lsdlJIeDRMZkNkMkp3blhyYkNy?=
 =?utf-8?B?UTlYeG9uZThuUXN3cGlmb2Z3Znp0bFBnTzEvYXJYdUNJdkIySldqWk8xMDhj?=
 =?utf-8?B?bXNWdGM5d3YxU3llU2NZcDdCenllZm9JNURGVGdaZktTUFkrbkVhTXZhdUZy?=
 =?utf-8?B?bHhuT1NyNDkyQmJzb2h6MkYwalh0RDNKZUlLdWJ5TnBoZE5pZG9YR0JpY2Na?=
 =?utf-8?B?d01SalhLV29qRUFoY0xWWll6VXlDTUlSSGN3YUF4Z1ovUDBDNTk3RVlQeEk5?=
 =?utf-8?B?dkJhWXZJeHUzNGdGWHpOckpwaG53bm5DdFFDMHcwcmdjNlpqRnNkbnpZNms1?=
 =?utf-8?B?MFFHZzdyWmhBMklodXhpcndYSEdpb0x5S2FkZVVEemNHMlRIdThVQklaaGRu?=
 =?utf-8?B?YWJmOWl2ZTgxdEsxNzFJYWpqVm5kTE5CcDVWTGZxcFR4bFo4YXBpeiszTHlw?=
 =?utf-8?B?dXhpMnpMTWozb09ZVUptcnBNeTFWVTFiNVhkMUU1ekNpaCtpcnFNNlRFbzhu?=
 =?utf-8?B?TVpCcC9vd01kdTBZVXFNS2pSbG5uelRIbCt0WnllcWJCY0d4NndTb3N1M2Fa?=
 =?utf-8?B?ZURVOUZEbGROalFUSzdIWjlWSTBGaW1PYkxvQThYMXRIMXdHK3BzYmFJZGRU?=
 =?utf-8?B?V3JEN3RTQmRoTkZYOTNCNmhrK0JYUkxFNVZ5a0RXcUZQdFNjdlhyaGxXVVM2?=
 =?utf-8?Q?lKz92N9MlkhXIOg?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30e7e4e3-3504-4e94-9e7c-08db45f3de73
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2023 01:16:31.4281
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: okg/RDecFCif4sCdp78FKcg0vANj+TGpt9/sLsr233wdQ7v7v2DP98GQolYm5APWsq5bRDrX0c1cqgdDOM8QnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6189
X-Proofpoint-GUID: Q7p7idEtUi8bwHyRg0FtKocRB6PxSZQE
X-Proofpoint-ORIG-GUID: Q7p7idEtUi8bwHyRg0FtKocRB6PxSZQE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-25_11,2023-04-25_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 adultscore=0 priorityscore=1501 malwarescore=0 mlxscore=0 suspectscore=0
 mlxlogscore=921 spamscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304260009
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVGh1LCBBcHIgMjAsIDIwMjMsIFVkaXB0byBHb3N3YW1pIHdyb3RlOg0KPiBXaGVuIHRoZSBk
d2MzIGRldmljZSBpcyBydW50aW1lIHN1c3BlbmRlZCwgdmFyaW91cyByZXF1aXJlZCBjbG9ja3Mg
d291bGQNCj4gZ2V0IGRpc2FibGVkIGFuZCBpdCBpcyBub3QgZ3VhcmFudGVlZCB0aGF0IGFjY2Vz
cyB0byBhbnkgcmVnaXN0ZXJzIHdvdWxkDQo+IHdvcmsuIERlcGVuZGluZyBvbiB0aGUgU29DIGds
dWUsIGEgcmVnaXN0ZXIgcmVhZCBjb3VsZCBiZSBhcyBiZW5pZ24gYXMNCj4gcmV0dXJuaW5nIDAg
b3IgYmUgZmF0YWwgZW5vdWdoIHRvIGhhbmcgdGhlIHN5c3RlbS4NCj4gDQo+IEluIG9yZGVyIHRv
IHByZXZlbnQgc3VjaCBzY2VuYXJpb3Mgb2YgZmF0YWwgZXJyb3JzLCBtYWtlIHN1cmUgdG8gcmVz
dW1lDQo+IGR3YzMgdGhlbiBhbGxvdyB0aGUgZnVuY3Rpb24gdG8gcHJvY2VlZC4NCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IFVkaXB0byBHb3N3YW1pIDxxdWljX3Vnb3N3YW1pQHF1aWNpbmMuY29tPg0K
PiAtLS0NCj4gDQo+IHY2OiBBZGRlZCBjaGFuZ2VzIHRvIGhhbmRsZSBnZXRfZHluYyBmYWlsdXJl
IGFwcHJvcHJpYXRlbHkuDQo+IHY1OiBSZXdvcmtlZCB0aGUgcGF0Y2ggdG8gcmVzdW1lIGR3YzMg
d2hpbGUgYWNjZXNzaW5nIHRoZSByZWdpc3RlcnMuDQo+IHY0OiBJbnRyb2R1Y2VkIHBtX3J1bnRp
bWVfZ2V0X2lmX2luX3VzZSBpbiBvcmRlciB0byBtYWtlIHN1cmUgZHdjMyBpc24ndA0KPiAJc3Vz
cGVuZGVkIHdoaWxlIGFjY2Vzc2luZyB0aGUgcmVnaXN0ZXJzLg0KPiB2MzogUmVwbGFjZSBwcl9l
cnIgdG8gZGV2X2Vyci4gDQo+IHYyOiBSZXBsYWNlZCByZXR1cm4gMCB3aXRoIC1FSU5WQUwgJiBz
ZXFfcHV0cyB3aXRoIHByX2Vyci4NCj4gDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2RlYnVnZnMuYyB8
IDEyNCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICAxIGZpbGUgY2hh
bmdlZCwgMTI0IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9k
d2MzL2RlYnVnZnMuYyBiL2RyaXZlcnMvdXNiL2R3YzMvZGVidWdmcy5jDQo+IGluZGV4IGU0YTI1
NjBiOWRjMC4uYjA4NjA0YTczZTY5IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2Rl
YnVnZnMuYw0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2RlYnVnZnMuYw0KPiBAQCAtMzMyLDYg
KzMzMiwxMyBAQCBzdGF0aWMgaW50IGR3YzNfbHNwX3Nob3coc3RydWN0IHNlcV9maWxlICpzLCB2
b2lkICp1bnVzZWQpDQo+ICAJdW5zaWduZWQgaW50CQljdXJyZW50X21vZGU7DQo+ICAJdW5zaWdu
ZWQgbG9uZwkJZmxhZ3M7DQo+ICAJdTMyCQkJcmVnOw0KPiArCWludAkJCXJldDsNCj4gKw0KPiAr
CXJldCA9IHBtX3J1bnRpbWVfZ2V0X3N5bmMoZHdjLT5kZXYpOw0KPiArCWlmIChyZXQgPCAwKSB7
DQo+ICsJCXBtX3J1bnRpbWVfcHV0KGR3Yy0+ZGV2KTsNCg0KU2hvdWxkIHdlIHVzZSBwbV9ydW50
aW1lX3B1dF9zeW5jPw0KDQo+ICsJCXJldHVybiAtRUlOVkFMOw0KDQpXaHkgbm90IHJldHVybiAi
cmV0Ij8NCg0KPiArCX0NCj4gIA0KPiAgCXNwaW5fbG9ja19pcnFzYXZlKCZkd2MtPmxvY2ssIGZs
YWdzKTsNCj4gIAlyZWcgPSBkd2MzX3JlYWRsKGR3Yy0+cmVncywgRFdDM19HU1RTKTsNCj4gQEAg
LTM0OSw2ICszNTYsNyBAQCBzdGF0aWMgaW50IGR3YzNfbHNwX3Nob3coc3RydWN0IHNlcV9maWxl
ICpzLCB2b2lkICp1bnVzZWQpDQo+ICAJCWJyZWFrOw0KPiAgCX0NCj4gIAlzcGluX3VubG9ja19p
cnFyZXN0b3JlKCZkd2MtPmxvY2ssIGZsYWdzKTsNCj4gKwlwbV9ydW50aW1lX3B1dChkd2MtPmRl
dik7DQo+ICANCj4gIAlyZXR1cm4gMDsNCj4gIH0NCj4gQEAgLTM5NSw2ICs0MDMsMTMgQEAgc3Rh
dGljIGludCBkd2MzX21vZGVfc2hvdyhzdHJ1Y3Qgc2VxX2ZpbGUgKnMsIHZvaWQgKnVudXNlZCkN
Cj4gIAlzdHJ1Y3QgZHdjMwkJKmR3YyA9IHMtPnByaXZhdGU7DQo+ICAJdW5zaWduZWQgbG9uZwkJ
ZmxhZ3M7DQo+ICAJdTMyCQkJcmVnOw0KPiArCWludAkJCXJldDsNCj4gKw0KPiArCXJldCA9IHBt
X3J1bnRpbWVfZ2V0X3N5bmMoZHdjLT5kZXYpOw0KPiArCWlmIChyZXQgPCAwKSB7DQo+ICsJCXBt
X3J1bnRpbWVfcHV0KGR3Yy0+ZGV2KTsNCj4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ICsJfQ0KPiAg
DQo+ICAJc3Bpbl9sb2NrX2lycXNhdmUoJmR3Yy0+bG9jaywgZmxhZ3MpOw0KPiAgCXJlZyA9IGR3
YzNfcmVhZGwoZHdjLT5yZWdzLCBEV0MzX0dDVEwpOw0KPiBAQCAtNDE0LDYgKzQyOSw3IEBAIHN0
YXRpYyBpbnQgZHdjM19tb2RlX3Nob3coc3RydWN0IHNlcV9maWxlICpzLCB2b2lkICp1bnVzZWQp
DQo+ICAJCXNlcV9wcmludGYocywgIlVOS05PV04gJTA4eFxuIiwgRFdDM19HQ1RMX1BSVENBUChy
ZWcpKTsNCj4gIAl9DQo+ICANCj4gKwlwbV9ydW50aW1lX3B1dChkd2MtPmRldik7DQo+ICAJcmV0
dXJuIDA7DQo+ICB9DQo+ICANCj4gQEAgLTQ2Myw2ICs0NzksMTMgQEAgc3RhdGljIGludCBkd2Mz
X3Rlc3Rtb2RlX3Nob3coc3RydWN0IHNlcV9maWxlICpzLCB2b2lkICp1bnVzZWQpDQo+ICAJc3Ry
dWN0IGR3YzMJCSpkd2MgPSBzLT5wcml2YXRlOw0KPiAgCXVuc2lnbmVkIGxvbmcJCWZsYWdzOw0K
PiAgCXUzMgkJCXJlZzsNCj4gKwlpbnQJCQlyZXQ7DQo+ICsNCj4gKwlyZXQgPSBwbV9ydW50aW1l
X2dldF9zeW5jKGR3Yy0+ZGV2KTsNCj4gKwlpZiAocmV0IDwgMCkgew0KPiArCQlwbV9ydW50aW1l
X3B1dChkd2MtPmRldik7DQo+ICsJCXJldHVybiAtRUlOVkFMOw0KPiArCX0NCj4gIA0KPiAgCXNw
aW5fbG9ja19pcnFzYXZlKCZkd2MtPmxvY2ssIGZsYWdzKTsNCj4gIAlyZWcgPSBkd2MzX3JlYWRs
KGR3Yy0+cmVncywgRFdDM19EQ1RMKTsNCj4gQEAgLTQ5Myw2ICs1MTYsNyBAQCBzdGF0aWMgaW50
IGR3YzNfdGVzdG1vZGVfc2hvdyhzdHJ1Y3Qgc2VxX2ZpbGUgKnMsIHZvaWQgKnVudXNlZCkNCj4g
IAkJc2VxX3ByaW50ZihzLCAiVU5LTk9XTiAlZFxuIiwgcmVnKTsNCj4gIAl9DQo+ICANCj4gKwlw
bV9ydW50aW1lX3B1dChkd2MtPmRldik7DQo+ICAJcmV0dXJuIDA7DQo+ICB9DQo+ICANCj4gQEAg
LTUwOSw2ICs1MzMsNyBAQCBzdGF0aWMgc3NpemVfdCBkd2MzX3Rlc3Rtb2RlX3dyaXRlKHN0cnVj
dCBmaWxlICpmaWxlLA0KPiAgCXVuc2lnbmVkIGxvbmcJCWZsYWdzOw0KPiAgCXUzMgkJCXRlc3Rt
b2RlID0gMDsNCj4gIAljaGFyCQkJYnVmWzMyXTsNCj4gKwlpbnQJCQlyZXQ7DQo+ICANCj4gIAlp
ZiAoY29weV9mcm9tX3VzZXIoJmJ1ZiwgdWJ1ZiwgbWluX3Qoc2l6ZV90LCBzaXplb2YoYnVmKSAt
IDEsIGNvdW50KSkpDQo+ICAJCXJldHVybiAtRUZBVUxUOw0KPiBAQCAtNTI2LDEwICs1NTEsMTcg
QEAgc3RhdGljIHNzaXplX3QgZHdjM190ZXN0bW9kZV93cml0ZShzdHJ1Y3QgZmlsZSAqZmlsZSwN
Cj4gIAllbHNlDQo+ICAJCXRlc3Rtb2RlID0gMDsNCj4gIA0KPiArCXJldCA9IHBtX3J1bnRpbWVf
Z2V0X3N5bmMoZHdjLT5kZXYpOw0KPiArCWlmIChyZXQgPCAwKSB7DQo+ICsJCXBtX3J1bnRpbWVf
cHV0KGR3Yy0+ZGV2KTsNCj4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ICsJfQ0KPiArDQo+ICAJc3Bp
bl9sb2NrX2lycXNhdmUoJmR3Yy0+bG9jaywgZmxhZ3MpOw0KPiAgCWR3YzNfZ2FkZ2V0X3NldF90
ZXN0X21vZGUoZHdjLCB0ZXN0bW9kZSk7DQo+ICAJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmZHdj
LT5sb2NrLCBmbGFncyk7DQo+ICANCj4gKwlwbV9ydW50aW1lX3B1dChkd2MtPmRldik7DQo+ICAJ
cmV0dXJuIGNvdW50Ow0KPiAgfQ0KPiAgDQo+IEBAIC01NDgsMTIgKzU4MCwyMCBAQCBzdGF0aWMg
aW50IGR3YzNfbGlua19zdGF0ZV9zaG93KHN0cnVjdCBzZXFfZmlsZSAqcywgdm9pZCAqdW51c2Vk
KQ0KPiAgCWVudW0gZHdjM19saW5rX3N0YXRlCXN0YXRlOw0KPiAgCXUzMgkJCXJlZzsNCj4gIAl1
OAkJCXNwZWVkOw0KPiArCWludAkJCXJldDsNCj4gKw0KPiArCXJldCA9IHBtX3J1bnRpbWVfZ2V0
X3N5bmMoZHdjLT5kZXYpOw0KPiArCWlmIChyZXQgPCAwKSB7DQo+ICsJCXBtX3J1bnRpbWVfcHV0
KGR3Yy0+ZGV2KTsNCj4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ICsJfQ0KPiAgDQo+ICAJc3Bpbl9s
b2NrX2lycXNhdmUoJmR3Yy0+bG9jaywgZmxhZ3MpOw0KPiAgCXJlZyA9IGR3YzNfcmVhZGwoZHdj
LT5yZWdzLCBEV0MzX0dTVFMpOw0KPiAgCWlmIChEV0MzX0dTVFNfQ1VSTU9EKHJlZykgIT0gRFdD
M19HU1RTX0NVUk1PRF9ERVZJQ0UpIHsNCj4gIAkJc2VxX3B1dHMocywgIk5vdCBhdmFpbGFibGVc
biIpOw0KPiAgCQlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZkd2MtPmxvY2ssIGZsYWdzKTsNCj4g
KwkJcG1fcnVudGltZV9wdXQoZHdjLT5kZXYpOw0KPiAgCQlyZXR1cm4gMDsNCj4gIAl9DQo+ICAN
Cj4gQEAgLTU2Niw2ICs2MDYsNyBAQCBzdGF0aWMgaW50IGR3YzNfbGlua19zdGF0ZV9zaG93KHN0
cnVjdCBzZXFfZmlsZSAqcywgdm9pZCAqdW51c2VkKQ0KPiAgCQkgICBkd2MzX2dhZGdldF9oc19s
aW5rX3N0cmluZyhzdGF0ZSkpOw0KPiAgCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmR3Yy0+bG9j
aywgZmxhZ3MpOw0KPiAgDQo+ICsJcG1fcnVudGltZV9wdXQoZHdjLT5kZXYpOw0KPiAgCXJldHVy
biAwOw0KPiAgfQ0KPiAgDQo+IEBAIC01ODQsNiArNjI1LDcgQEAgc3RhdGljIHNzaXplX3QgZHdj
M19saW5rX3N0YXRlX3dyaXRlKHN0cnVjdCBmaWxlICpmaWxlLA0KPiAgCWNoYXIJCQlidWZbMzJd
Ow0KPiAgCXUzMgkJCXJlZzsNCj4gIAl1OAkJCXNwZWVkOw0KPiArCWludAkJCXJldDsNCj4gIA0K
PiAgCWlmIChjb3B5X2Zyb21fdXNlcigmYnVmLCB1YnVmLCBtaW5fdChzaXplX3QsIHNpemVvZihi
dWYpIC0gMSwgY291bnQpKSkNCj4gIAkJcmV0dXJuIC1FRkFVTFQ7DQo+IEBAIC02MDMsMTAgKzY0
NSwxNyBAQCBzdGF0aWMgc3NpemVfdCBkd2MzX2xpbmtfc3RhdGVfd3JpdGUoc3RydWN0IGZpbGUg
KmZpbGUsDQo+ICAJZWxzZQ0KPiAgCQlyZXR1cm4gLUVJTlZBTDsNCj4gIA0KPiArCXJldCA9IHBt
X3J1bnRpbWVfZ2V0X3N5bmMoZHdjLT5kZXYpOw0KPiArCWlmIChyZXQgPCAwKSB7DQo+ICsJCXBt
X3J1bnRpbWVfcHV0KGR3Yy0+ZGV2KTsNCj4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ICsJfQ0KPiAr
DQo+ICAJc3Bpbl9sb2NrX2lycXNhdmUoJmR3Yy0+bG9jaywgZmxhZ3MpOw0KPiAgCXJlZyA9IGR3
YzNfcmVhZGwoZHdjLT5yZWdzLCBEV0MzX0dTVFMpOw0KPiAgCWlmIChEV0MzX0dTVFNfQ1VSTU9E
KHJlZykgIT0gRFdDM19HU1RTX0NVUk1PRF9ERVZJQ0UpIHsNCj4gIAkJc3Bpbl91bmxvY2tfaXJx
cmVzdG9yZSgmZHdjLT5sb2NrLCBmbGFncyk7DQo+ICsJCXBtX3J1bnRpbWVfcHV0KGR3Yy0+ZGV2
KTsNCj4gIAkJcmV0dXJuIC1FSU5WQUw7DQo+ICAJfQ0KPiAgDQo+IEBAIC02MTYsMTIgKzY2NSwx
NCBAQCBzdGF0aWMgc3NpemVfdCBkd2MzX2xpbmtfc3RhdGVfd3JpdGUoc3RydWN0IGZpbGUgKmZp
bGUsDQo+ICAJaWYgKHNwZWVkIDwgRFdDM19EU1RTX1NVUEVSU1BFRUQgJiYNCj4gIAkgICAgc3Rh
dGUgIT0gRFdDM19MSU5LX1NUQVRFX1JFQ09WKSB7DQo+ICAJCXNwaW5fdW5sb2NrX2lycXJlc3Rv
cmUoJmR3Yy0+bG9jaywgZmxhZ3MpOw0KPiArCQlwbV9ydW50aW1lX3B1dChkd2MtPmRldik7DQo+
ICAJCXJldHVybiAtRUlOVkFMOw0KPiAgCX0NCj4gIA0KPiAgCWR3YzNfZ2FkZ2V0X3NldF9saW5r
X3N0YXRlKGR3Yywgc3RhdGUpOw0KPiAgCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmR3Yy0+bG9j
aywgZmxhZ3MpOw0KPiAgDQo+ICsJcG1fcnVudGltZV9wdXQoZHdjLT5kZXYpOw0KPiAgCXJldHVy
biBjb3VudDsNCj4gIH0NCj4gIA0KPiBAQCAtNjQ1LDYgKzY5NiwxMyBAQCBzdGF0aWMgaW50IGR3
YzNfdHhfZmlmb19zaXplX3Nob3coc3RydWN0IHNlcV9maWxlICpzLCB2b2lkICp1bnVzZWQpDQo+
ICAJdW5zaWduZWQgbG9uZwkJZmxhZ3M7DQo+ICAJdTMyCQkJbWR3aWR0aDsNCj4gIAl1MzIJCQl2
YWw7DQo+ICsJaW50CQkJcmV0Ow0KPiArDQo+ICsJcmV0ID0gcG1fcnVudGltZV9nZXRfc3luYyhk
d2MtPmRldik7DQo+ICsJaWYgKHJldCA8IDApIHsNCj4gKwkJcG1fcnVudGltZV9wdXQoZHdjLT5k
ZXYpOw0KPiArCQlyZXR1cm4gLUVJTlZBTDsNCj4gKwl9DQo+ICANCj4gIAlzcGluX2xvY2tfaXJx
c2F2ZSgmZHdjLT5sb2NrLCBmbGFncyk7DQo+ICAJdmFsID0gZHdjM19jb3JlX2ZpZm9fc3BhY2Uo
ZGVwLCBEV0MzX1RYRklGTyk7DQo+IEBAIC02NTcsNiArNzE1LDcgQEAgc3RhdGljIGludCBkd2Mz
X3R4X2ZpZm9fc2l6ZV9zaG93KHN0cnVjdCBzZXFfZmlsZSAqcywgdm9pZCAqdW51c2VkKQ0KPiAg
CXNlcV9wcmludGYocywgIiV1XG4iLCB2YWwpOw0KPiAgCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUo
JmR3Yy0+bG9jaywgZmxhZ3MpOw0KPiAgDQo+ICsJcG1fcnVudGltZV9wdXQoZHdjLT5kZXYpOw0K
PiAgCXJldHVybiAwOw0KPiAgfQ0KPiAgDQo+IEBAIC02NjcsNiArNzI2LDEzIEBAIHN0YXRpYyBp
bnQgZHdjM19yeF9maWZvX3NpemVfc2hvdyhzdHJ1Y3Qgc2VxX2ZpbGUgKnMsIHZvaWQgKnVudXNl
ZCkNCj4gIAl1bnNpZ25lZCBsb25nCQlmbGFnczsNCj4gIAl1MzIJCQltZHdpZHRoOw0KPiAgCXUz
MgkJCXZhbDsNCj4gKwlpbnQJCQlyZXQ7DQo+ICsNCj4gKwlyZXQgPSBwbV9ydW50aW1lX2dldF9z
eW5jKGR3Yy0+ZGV2KTsNCj4gKwlpZiAocmV0IDwgMCkgew0KPiArCQlwbV9ydW50aW1lX3B1dChk
d2MtPmRldik7DQo+ICsJCXJldHVybiAtRUlOVkFMOw0KPiArCX0NCj4gIA0KPiAgCXNwaW5fbG9j
a19pcnFzYXZlKCZkd2MtPmxvY2ssIGZsYWdzKTsNCj4gIAl2YWwgPSBkd2MzX2NvcmVfZmlmb19z
cGFjZShkZXAsIERXQzNfUlhGSUZPKTsNCj4gQEAgLTY3OSw2ICs3NDUsNyBAQCBzdGF0aWMgaW50
IGR3YzNfcnhfZmlmb19zaXplX3Nob3coc3RydWN0IHNlcV9maWxlICpzLCB2b2lkICp1bnVzZWQp
DQo+ICAJc2VxX3ByaW50ZihzLCAiJXVcbiIsIHZhbCk7DQo+ICAJc3Bpbl91bmxvY2tfaXJxcmVz
dG9yZSgmZHdjLT5sb2NrLCBmbGFncyk7DQo+ICANCj4gKwlwbV9ydW50aW1lX3B1dChkd2MtPmRl
dik7DQo+ICAJcmV0dXJuIDA7DQo+ICB9DQo+ICANCj4gQEAgLTY4OCwxMiArNzU1LDIwIEBAIHN0
YXRpYyBpbnQgZHdjM190eF9yZXF1ZXN0X3F1ZXVlX3Nob3coc3RydWN0IHNlcV9maWxlICpzLCB2
b2lkICp1bnVzZWQpDQo+ICAJc3RydWN0IGR3YzMJCSpkd2MgPSBkZXAtPmR3YzsNCj4gIAl1bnNp
Z25lZCBsb25nCQlmbGFnczsNCj4gIAl1MzIJCQl2YWw7DQo+ICsJaW50CQkJcmV0Ow0KPiArDQo+
ICsJcmV0ID0gcG1fcnVudGltZV9nZXRfc3luYyhkd2MtPmRldik7DQo+ICsJaWYgKHJldCA8IDAp
IHsNCj4gKwkJcG1fcnVudGltZV9wdXQoZHdjLT5kZXYpOw0KPiArCQlyZXR1cm4gLUVJTlZBTDsN
Cj4gKwl9DQo+ICANCj4gIAlzcGluX2xvY2tfaXJxc2F2ZSgmZHdjLT5sb2NrLCBmbGFncyk7DQo+
ICAJdmFsID0gZHdjM19jb3JlX2ZpZm9fc3BhY2UoZGVwLCBEV0MzX1RYUkVRUSk7DQo+ICAJc2Vx
X3ByaW50ZihzLCAiJXVcbiIsIHZhbCk7DQo+ICAJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmZHdj
LT5sb2NrLCBmbGFncyk7DQo+ICANCj4gKwlwbV9ydW50aW1lX3B1dChkd2MtPmRldik7DQo+ICAJ
cmV0dXJuIDA7DQo+ICB9DQo+ICANCj4gQEAgLTcwMywxMiArNzc4LDIwIEBAIHN0YXRpYyBpbnQg
ZHdjM19yeF9yZXF1ZXN0X3F1ZXVlX3Nob3coc3RydWN0IHNlcV9maWxlICpzLCB2b2lkICp1bnVz
ZWQpDQo+ICAJc3RydWN0IGR3YzMJCSpkd2MgPSBkZXAtPmR3YzsNCj4gIAl1bnNpZ25lZCBsb25n
CQlmbGFnczsNCj4gIAl1MzIJCQl2YWw7DQo+ICsJaW50CQkJcmV0Ow0KPiArDQo+ICsJcmV0ID0g
cG1fcnVudGltZV9nZXRfc3luYyhkd2MtPmRldik7DQo+ICsJaWYgKHJldCA8IDApIHsNCj4gKwkJ
cG1fcnVudGltZV9wdXQoZHdjLT5kZXYpOw0KPiArCQlyZXR1cm4gLUVJTlZBTDsNCj4gKwl9DQo+
ICANCj4gIAlzcGluX2xvY2tfaXJxc2F2ZSgmZHdjLT5sb2NrLCBmbGFncyk7DQo+ICAJdmFsID0g
ZHdjM19jb3JlX2ZpZm9fc3BhY2UoZGVwLCBEV0MzX1JYUkVRUSk7DQo+ICAJc2VxX3ByaW50Zihz
LCAiJXVcbiIsIHZhbCk7DQo+ICAJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmZHdjLT5sb2NrLCBm
bGFncyk7DQo+ICANCj4gKwlwbV9ydW50aW1lX3B1dChkd2MtPmRldik7DQo+ICAJcmV0dXJuIDA7
DQo+ICB9DQo+ICANCj4gQEAgLTcxOCwxMiArODAxLDIwIEBAIHN0YXRpYyBpbnQgZHdjM19yeF9p
bmZvX3F1ZXVlX3Nob3coc3RydWN0IHNlcV9maWxlICpzLCB2b2lkICp1bnVzZWQpDQo+ICAJc3Ry
dWN0IGR3YzMJCSpkd2MgPSBkZXAtPmR3YzsNCj4gIAl1bnNpZ25lZCBsb25nCQlmbGFnczsNCj4g
IAl1MzIJCQl2YWw7DQo+ICsJaW50CQkJcmV0Ow0KPiArDQo+ICsJcmV0ID0gcG1fcnVudGltZV9n
ZXRfc3luYyhkd2MtPmRldik7DQo+ICsJaWYgKHJldCA8IDApIHsNCj4gKwkJcG1fcnVudGltZV9w
dXQoZHdjLT5kZXYpOw0KPiArCQlyZXR1cm4gLUVJTlZBTDsNCj4gKwl9DQo+ICANCj4gIAlzcGlu
X2xvY2tfaXJxc2F2ZSgmZHdjLT5sb2NrLCBmbGFncyk7DQo+ICAJdmFsID0gZHdjM19jb3JlX2Zp
Zm9fc3BhY2UoZGVwLCBEV0MzX1JYSU5GT1EpOw0KPiAgCXNlcV9wcmludGYocywgIiV1XG4iLCB2
YWwpOw0KPiAgCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmR3Yy0+bG9jaywgZmxhZ3MpOw0KPiAg
DQo+ICsJcG1fcnVudGltZV9wdXQoZHdjLT5kZXYpOw0KPiAgCXJldHVybiAwOw0KPiAgfQ0KPiAg
DQo+IEBAIC03MzMsMTIgKzgyNCwyMCBAQCBzdGF0aWMgaW50IGR3YzNfZGVzY3JpcHRvcl9mZXRj
aF9xdWV1ZV9zaG93KHN0cnVjdCBzZXFfZmlsZSAqcywgdm9pZCAqdW51c2VkKQ0KPiAgCXN0cnVj
dCBkd2MzCQkqZHdjID0gZGVwLT5kd2M7DQo+ICAJdW5zaWduZWQgbG9uZwkJZmxhZ3M7DQo+ICAJ
dTMyCQkJdmFsOw0KPiArCWludAkJCXJldDsNCj4gKw0KPiArCXJldCA9IHBtX3J1bnRpbWVfZ2V0
X3N5bmMoZHdjLT5kZXYpOw0KPiArCWlmIChyZXQgPCAwKSB7DQo+ICsJCXBtX3J1bnRpbWVfcHV0
KGR3Yy0+ZGV2KTsNCj4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ICsJfQ0KPiAgDQo+ICAJc3Bpbl9s
b2NrX2lycXNhdmUoJmR3Yy0+bG9jaywgZmxhZ3MpOw0KPiAgCXZhbCA9IGR3YzNfY29yZV9maWZv
X3NwYWNlKGRlcCwgRFdDM19ERVNDRkVUQ0hRKTsNCj4gIAlzZXFfcHJpbnRmKHMsICIldVxuIiwg
dmFsKTsNCj4gIAlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZkd2MtPmxvY2ssIGZsYWdzKTsNCj4g
IA0KPiArCXBtX3J1bnRpbWVfcHV0KGR3Yy0+ZGV2KTsNCj4gIAlyZXR1cm4gMDsNCj4gIH0NCj4g
IA0KPiBAQCAtNzQ4LDEyICs4NDcsMjAgQEAgc3RhdGljIGludCBkd2MzX2V2ZW50X3F1ZXVlX3No
b3coc3RydWN0IHNlcV9maWxlICpzLCB2b2lkICp1bnVzZWQpDQo+ICAJc3RydWN0IGR3YzMJCSpk
d2MgPSBkZXAtPmR3YzsNCj4gIAl1bnNpZ25lZCBsb25nCQlmbGFnczsNCj4gIAl1MzIJCQl2YWw7
DQo+ICsJaW50CQkJcmV0Ow0KPiArDQo+ICsJcmV0ID0gcG1fcnVudGltZV9nZXRfc3luYyhkd2Mt
PmRldik7DQo+ICsJaWYgKHJldCA8IDApIHsNCj4gKwkJcG1fcnVudGltZV9wdXQoZHdjLT5kZXYp
Ow0KPiArCQlyZXR1cm4gLUVJTlZBTDsNCj4gKwl9DQo+ICANCj4gIAlzcGluX2xvY2tfaXJxc2F2
ZSgmZHdjLT5sb2NrLCBmbGFncyk7DQo+ICAJdmFsID0gZHdjM19jb3JlX2ZpZm9fc3BhY2UoZGVw
LCBEV0MzX0VWRU5UUSk7DQo+ICAJc2VxX3ByaW50ZihzLCAiJXVcbiIsIHZhbCk7DQo+ICAJc3Bp
bl91bmxvY2tfaXJxcmVzdG9yZSgmZHdjLT5sb2NrLCBmbGFncyk7DQo+ICANCj4gKwlwbV9ydW50
aW1lX3B1dChkd2MtPmRldik7DQo+ICAJcmV0dXJuIDA7DQo+ICB9DQo+ICANCj4gQEAgLTc5OCw2
ICs5MDUsMTMgQEAgc3RhdGljIGludCBkd2MzX3RyYl9yaW5nX3Nob3coc3RydWN0IHNlcV9maWxl
ICpzLCB2b2lkICp1bnVzZWQpDQo+ICAJc3RydWN0IGR3YzMJCSpkd2MgPSBkZXAtPmR3YzsNCj4g
IAl1bnNpZ25lZCBsb25nCQlmbGFnczsNCj4gIAlpbnQJCQlpOw0KPiArCWludAkJCXJldDsNCj4g
Kw0KPiArCXJldCA9IHBtX3J1bnRpbWVfZ2V0X3N5bmMoZHdjLT5kZXYpOw0KPiArCWlmIChyZXQg
PCAwKSB7DQo+ICsJCXBtX3J1bnRpbWVfcHV0KGR3Yy0+ZGV2KTsNCj4gKwkJcmV0dXJuIC1FSU5W
QUw7DQo+ICsJfQ0KPiAgDQo+ICAJc3Bpbl9sb2NrX2lycXNhdmUoJmR3Yy0+bG9jaywgZmxhZ3Mp
Ow0KPiAgCWlmIChkZXAtPm51bWJlciA8PSAxKSB7DQo+IEBAIC04MjcsNiArOTQxLDcgQEAgc3Rh
dGljIGludCBkd2MzX3RyYl9yaW5nX3Nob3coc3RydWN0IHNlcV9maWxlICpzLCB2b2lkICp1bnVz
ZWQpDQo+ICBvdXQ6DQo+ICAJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmZHdjLT5sb2NrLCBmbGFn
cyk7DQo+ICANCj4gKwlwbV9ydW50aW1lX3B1dChkd2MtPmRldik7DQo+ICAJcmV0dXJuIDA7DQo+
ICB9DQo+ICANCj4gQEAgLTgzOSw2ICs5NTQsMTMgQEAgc3RhdGljIGludCBkd2MzX2VwX2luZm9f
cmVnaXN0ZXJfc2hvdyhzdHJ1Y3Qgc2VxX2ZpbGUgKnMsIHZvaWQgKnVudXNlZCkNCj4gIAl1MzIJ
CQlsb3dlcl8zMl9iaXRzOw0KPiAgCXUzMgkJCXVwcGVyXzMyX2JpdHM7DQo+ICAJdTMyCQkJcmVn
Ow0KPiArCWludAkJCXJldDsNCj4gKw0KPiArCXJldCA9IHBtX3J1bnRpbWVfZ2V0X3N5bmMoZHdj
LT5kZXYpOw0KPiArCWlmIChyZXQgPCAwKSB7DQo+ICsJCXBtX3J1bnRpbWVfcHV0KGR3Yy0+ZGV2
KTsNCj4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ICsJfQ0KPiAgDQo+ICAJc3Bpbl9sb2NrX2lycXNh
dmUoJmR3Yy0+bG9jaywgZmxhZ3MpOw0KPiAgCXJlZyA9IERXQzNfR0RCR0xTUE1VWF9FUFNFTEVD
VChkZXAtPm51bWJlcik7DQo+IEBAIC04NTEsNiArOTczLDcgQEAgc3RhdGljIGludCBkd2MzX2Vw
X2luZm9fcmVnaXN0ZXJfc2hvdyhzdHJ1Y3Qgc2VxX2ZpbGUgKnMsIHZvaWQgKnVudXNlZCkNCj4g
IAlzZXFfcHJpbnRmKHMsICIweCUwMTZsbHhcbiIsIGVwX2luZm8pOw0KPiAgCXNwaW5fdW5sb2Nr
X2lycXJlc3RvcmUoJmR3Yy0+bG9jaywgZmxhZ3MpOw0KPiAgDQo+ICsJcG1fcnVudGltZV9wdXQo
ZHdjLT5kZXYpOw0KPiAgCXJldHVybiAwOw0KPiAgfQ0KPiAgDQo+IEBAIC05MTAsNiArMTAzMyw3
IEBAIHZvaWQgZHdjM19kZWJ1Z2ZzX2luaXQoc3RydWN0IGR3YzMgKmR3YykNCj4gIAlkd2MtPnJl
Z3NldC0+cmVncyA9IGR3YzNfcmVnczsNCj4gIAlkd2MtPnJlZ3NldC0+bnJlZ3MgPSBBUlJBWV9T
SVpFKGR3YzNfcmVncyk7DQo+ICAJZHdjLT5yZWdzZXQtPmJhc2UgPSBkd2MtPnJlZ3MgLSBEV0Mz
X0dMT0JBTFNfUkVHU19TVEFSVDsNCj4gKwlkd2MtPnJlZ3NldC0+ZGV2ID0gZHdjLT5kZXY7DQo+
ICANCj4gIAlyb290ID0gZGVidWdmc19jcmVhdGVfZGlyKGRldl9uYW1lKGR3Yy0+ZGV2KSwgdXNi
X2RlYnVnX3Jvb3QpOw0KPiAgCWR3Yy0+ZGVidWdfcm9vdCA9IHJvb3Q7DQo+IC0tIA0KPiAyLjE3
LjENCj4gDQoNClRoYW5rcywNClRoaW5o
