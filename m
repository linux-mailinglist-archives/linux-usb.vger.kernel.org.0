Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 497596D8C9F
	for <lists+linux-usb@lfdr.de>; Thu,  6 Apr 2023 03:16:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232000AbjDFBQu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Apr 2023 21:16:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbjDFBQt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Apr 2023 21:16:49 -0400
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95086F1
        for <linux-usb@vger.kernel.org>; Wed,  5 Apr 2023 18:16:48 -0700 (PDT)
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 335NOOeR016783;
        Wed, 5 Apr 2023 18:16:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=/4i382WHQlk7z0+bv0BZ1Zzugl/kVqFn+YTAf56CW4E=;
 b=g045TsYyvkcnJIk7VE02AAKkl4krm+g6rf4nnF7TjrE9bKD6iIdzQXn3gNQbjeUr8X/8
 uMFS03E34flWGlErGkiZ4P3nca0JHWkigiObAx+NffulbElld8nQ/jBdQdew53dxC8c5
 Ozbm+p/wuAZcJ5wTu8Ks6PiYLphQcfM+xj9Y+70YBvMg9BbSFpAkC1EmSkEFY8u6+rys
 6PnWZgqde2PyKNvjUUUT7bz8hjSa5QEpU7+kXmcM6rsxu3NUD7Q5Z3/HF3/siQnZ6SRK
 JIW8F4YcQ+qBK0Z2Y4x4m+P1M0c6TX9lQJsD9MJsOzyLtPb9N2+Fp05cJP22t6ozdY3f Sw== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3ppkhxt6md-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 05 Apr 2023 18:16:36 -0700
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id DF4A640099;
        Thu,  6 Apr 2023 01:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1680743795; bh=/4i382WHQlk7z0+bv0BZ1Zzugl/kVqFn+YTAf56CW4E=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=Kug/Kz3m+zYz2xO2rlWot7wRM0oCrpLSA8KyStgaWvLz4TAhsYR6pCbQ3SQgSdaPX
         pjN+mr5SUhE8V5dkntFQ0EGbeDi03tSUdKgyBozs/hmmYQsPtxGQDSW+Rg9J7KCAAt
         TqnV1m7OBP1Vc/yTs3SKrDMe9puVqxbWIQH8MYDoHfcZqheFzMul3SLnmcDyU4kcw0
         Ot70XfbmlSGR5xflIIlO67v1rVGu2VRT3tkH+koAfi9KxOzED9s1F/o/8Q3cuU9fBB
         6fZSLoi5hfim59tPf8j/dYuklTGHRuJee429owBMGXlDj1ejgo138zd1PUi3rsP8Jo
         gajSpkDiqDPUw==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id BC638A006F;
        Thu,  6 Apr 2023 01:16:34 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2105.outbound.protection.outlook.com [104.47.58.105])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 18D6740086;
        Thu,  6 Apr 2023 01:16:34 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="POVj3ZrQ";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B7hPH7KBKVrYVkDGudk1ut1VJVj90KbrnqOFoFjfw+P5fX4g0TZ+C7ghWRvrgc1lJuedVc2yPyBfPx5cAP6VUhlUQBM6rClm408ZWG111lwoCWqAbjxYDRme1t/D/vf5sfXZsOzV+3sY8tTIzub1bXgVRy3nYyllm1VaxHLUfk7NKIiYp548TMevZelHLNrYFsMGKH8Q37NFTvi7nJG90pXHjcp9FuLdK7ngJffktVB4xR+rigAzwnpNtAvJrhPcKgICf8vKzCmeWYGKVDbooV6Xv6Fee/CsRoq68kXy5MwzbcPE0+UZ7d/GcxMGdctpc7mCbkoP+2p8AUKddAef4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/4i382WHQlk7z0+bv0BZ1Zzugl/kVqFn+YTAf56CW4E=;
 b=W2RBkhq3lKQAWRmS2lh6Q/gpY0WdCgICfyaksTQkXZJZ4PMwfU+1+tgcSDTN0FNqfVTtB/jl5FOQh5UXC+6FXwDYEULTftRpAFyO1P8Cge8qedtNaogjWU5Su+g1dGdNHvnb+RcmLodqcPHX55gb4NwyBB8m0kA44pdV5XvDrKXORWXPBf0Sie2sYzBs3EPLA394gFXfa4JKNe8XUVbQf9ydKg4FKkCdhOT2skKw+ltVa5SthmhXfTNkVcxv0Aqk8svX5FPD2Ey/qHuxIT1nqLU7M6FBNvByI8mnwolHY4UxJTjRkDG0jpEl1T3nojqf/w8GyoTrQtLCLdJ2LDSmWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/4i382WHQlk7z0+bv0BZ1Zzugl/kVqFn+YTAf56CW4E=;
 b=POVj3ZrQoOu7BH0ncdmYckQVTRdtFY+SbMc04kImiPEFD4Qs3EYgW+ZrrlpXZ8LWXxcfcgx1G2vVGCbsnJ66WF8msyId8RsG2S+UwSVMvt08KQ1f7ih6PoPNMfNoZ3okvzyrMe5YTzsRoS7OVqJ0Qt0I7n7akVD7mNb76N+b6zU=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by CH3PR12MB8331.namprd12.prod.outlook.com (2603:10b6:610:12f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.37; Thu, 6 Apr
 2023 01:16:27 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3161:c44d:8bb3:423f]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3161:c44d:8bb3:423f%3]) with mapi id 15.20.6254.035; Thu, 6 Apr 2023
 01:16:26 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Johan Hovold <johan@kernel.org>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Oliver Neukum <oneukum@suse.com>,
        Udipto Goswami <quic_ugoswami@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v4] usb: dwc3: debugfs: Prevent any register access when
 devices
Thread-Topic: [PATCH v4] usb: dwc3: debugfs: Prevent any register access when
 devices
Thread-Index: AQHZZtyBQSzEIU4DQUOpQRrLn0wgo68a/QEAgAABE4CAAAmMgIAABqwAgAAGcYCAAKABAIAAr5mAgAEYvAA=
Date:   Thu, 6 Apr 2023 01:16:24 +0000
Message-ID: <20230406011622.oi3ctel7fa7sj5za@synopsys.com>
References: <20230404100055.28100-1-quic_ugoswami@quicinc.com>
 <ZCwEeFzSFVRmB/yI@hovoldconsulting.com>
 <9f8277ce-7888-46b7-fe82-90fe4b775762@suse.com>
 <ZCwNYU3kR1Lb2kt5@hovoldconsulting.com>
 <58eaa062-4857-4704-5d5d-ff6ea069e899@suse.com>
 <ZCwYYb/GkE8x6snr@hovoldconsulting.com>
 <20230404220306.qasfe3eg5w6eyaki@synopsys.com>
 <ZC0x589/77gYu77b@hovoldconsulting.com>
In-Reply-To: <ZC0x589/77gYu77b@hovoldconsulting.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|CH3PR12MB8331:EE_
x-ms-office365-filtering-correlation-id: 1a7b4ce7-0b67-4936-4eff-08db363c8a5b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kMbb1WmXkwHRxIuG6fe2VKMu1gwgCwMYnGzM9DjLBFGr3bVXSr74Tc3VKtzybr1mo8YMNqMnbsr75u3juilhbr99F9FvMfWlD9b98ESr0jB4IGz19uuRw6D1lRQWmpAZT3A2PDxh9Z9sqrAglACdDsK6GBnqWpwaBciyhQE470sxccT4Yo0dDQJE+hlgLNG/wef7VRI18rhn/LPFQ6xfFNIIwbYpa3dt+He2Ae766fMxLVHoxkvI/YqmW8We7pg8yH70YusdaItmqyyNRIuivtWdoyjQqRTDgEGpl5f/mR/6ZEHBlasX20PYwKXdqdA71QDCLjl38y/+W+o108XBuXTuRE7G5MeonFrKNvgum+yUnHDelD3uiJMRlAfztWeSJy/ZY7kIE6YYdJ4hAon6UKUF+mZdDYJDYd2PtWC8Zn6aTzt7hjNxOllFZnpRL4lIXnl/okYvU4vm/mGNpzEemo/g/VtBdN2Hwj4Re22PJc/RJ7n6ykQSYK5Za9E9Q162YpulbcU7jgclQb0sTZvXh8piAk1EjcIyEwpn1TBJ+qni2iQ8/AajxFgcVjR0uJ/8S3LfruFX19Rim7cw5iu++FKtB3tDlWUFhIUqkGJDX4gwVROi4dq+WcutKo2uMRO3
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(376002)(366004)(39860400002)(136003)(451199021)(478600001)(71200400001)(86362001)(54906003)(316002)(6512007)(6506007)(1076003)(26005)(186003)(6486002)(53546011)(2906002)(5660300002)(41300700001)(66946007)(66556008)(64756008)(66446008)(66476007)(76116006)(4326008)(8676002)(6916009)(8936002)(38070700005)(38100700002)(122000001)(83380400001)(36756003)(2616005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cVovamtGQmtiY2RNRHBNWWF5c0kydHZjcWwyTktsdElSeDVpejc1L0c0Ulg2?=
 =?utf-8?B?b25QdXZpcEtDMW9aVGl0SlhCYVBSUXFVK2RLNGxldWFBdnVOMGFFeE9CMWhj?=
 =?utf-8?B?blh5YzFwVzhPd3FPYzk3bFQzajFZV1lLRHNrNC92clliR2ZpNEVCSUR1OGRT?=
 =?utf-8?B?a3BYM0RnZlFPSzdSc2FEWWQzVG9NT2pJUU14QUhaSUdMWFhwWlpDKzVOUXVV?=
 =?utf-8?B?Mk9CQUgvM0hlTEw4a0toL1lkMm5PRVpXYTRwVWZuSGNaSzZRRGVkZTlVMzBB?=
 =?utf-8?B?NjNKWkZGa1FyOVRxKzAyQjZFLzBnUU50Z2VXWnRwbDdUQ1RMYnZEc0I2amJY?=
 =?utf-8?B?UDhZSTFIQXphRGRYYVlWZjA2dU4xaGRDaU1MaG5jblNrTU8xZTJWRTNFYktL?=
 =?utf-8?B?RHRPUnN0dFhJamt2ZEdFbnljNE9yaFdOalRmckttLzFwQVBFdkROMms0ZGRS?=
 =?utf-8?B?c1JZZVhRUmpvVXFRa1duNS9ZMCtOSnlNQkhDOW1zS1lCMktsY3RPakc4anR1?=
 =?utf-8?B?RVBjSkppN041UTZ3VXNqbU9IMFd6M0REZ2F2am1iYUF4SUg0UC9zZUpudjF5?=
 =?utf-8?B?ZDNBaGl3WThZOVYvbHdQNHBxVUUwK1JSQUk4TzQzUUhtL3NYMzR1bmcrNTU2?=
 =?utf-8?B?dS9IcEhMWXcvd21EWW1WeTVRaUJjMlZvUXRlakxhOVJudWpjWldvQnhEVi96?=
 =?utf-8?B?NjRCRy9iUGNqSnVDdVZWdFVDYnYzTkxwWGVHUjlEMThYdnpqbXA0ZlhtQ1pQ?=
 =?utf-8?B?c1RVVkI5M3YyTWk5RVNtNGU0RTVMQTBWOCtMbGV5d0Q3dWVsUjM1NXpQZWQr?=
 =?utf-8?B?NVNvb3VVck4rczVOSjdHTTdnTkZlOVBuaS83WFo4YVlBSEVhdHBBbUtnRTJs?=
 =?utf-8?B?alBEWEpNaEcvZWQvK2JobkxscXBjakZ0QVp1Q1AvNU1JSFRtdmJ2U0d3eTFp?=
 =?utf-8?B?dWNJMkxsNnNaWkRrMFo4R3pTdWRsREttRHJFT1dTMlc4WVh2WWRKL05NUjl6?=
 =?utf-8?B?RWwxcHM2SkF3T3ZwNXJyU05vc2RaMGFqSEcxTFlWTjF3dVZPS1JiV0tWVFpL?=
 =?utf-8?B?TmR1WXNNMVpHaGlKUW9rSkxkejhRMHI1MWx0ZU9ZL09qQ0VLQTUvY2c1ZzZI?=
 =?utf-8?B?cnNSTnpGcUliTVkzY0w1am1YNlBaMlRwQVVYZVhGSS9wcytNVkFFRjlWNHl3?=
 =?utf-8?B?UmR4U2haQTl5WFpnSkRTUmg5aUFscVZtNTdRVUY0VWZXMU5MZjIyaTA4RGxm?=
 =?utf-8?B?b2t1UDdmNmYrb3luZ2E3WXA3WUg1TSs4WUxKVkdVdktrMGNONTVRUTJRTzJ2?=
 =?utf-8?B?YjRENExBVGFzL2k5dk4rVDJURncxVjNWTGlDNjlrV3pIYjN6c1MrMkhpbzlN?=
 =?utf-8?B?VnhhRG9SOGtNMmx2MVRHREpxaVhRbHErandzYnN0MDJvNHlpOFRaK1phSHNt?=
 =?utf-8?B?dFVLbkhPQitNbW5oelZ3eE9kbmpYVU1XbklFWUxZeTcrNG9jUVk1bXRBUGVh?=
 =?utf-8?B?bU0rTkxFNWRlSG8wMUVvbVQ1VXhSd1kzb1ZrMlplMUNwa0JtUkRmaTBpd1ll?=
 =?utf-8?B?YURiNHkyOGplMlhVY2dTdjYzdmtVK0dXcWh6aTBEV1JmQ2NmQzM1dlF2SkFz?=
 =?utf-8?B?ZXpmVTlySUdXNkVGeHQwdGNlNkxYK0VJOW9YQ01SRVAxcXg0NE9CRjFLMDdy?=
 =?utf-8?B?UkZ1S1FraEpyOVIydXhrVDNZQXlqUmhnUmNpbUlBZStYMnVOTmFxNjBNN3My?=
 =?utf-8?B?UE4wQzJMVDVkZ0JuUXdDckpNaHFWdk8rTklLcGhxcmN5Vy8vK0RNSjR3SmpM?=
 =?utf-8?B?Y01meDZTQlNGNnNaUFZ3QzAydG1YUXVnZFpsSGhrMUZmb0dlTVZVNTVudWNt?=
 =?utf-8?B?cWNxeG90UG5kY1Q0TUhDbmZaYXVNaVpKbmpraXpDOExuSUNudlVMeFBGd2pR?=
 =?utf-8?B?TGx2QUdYd05NTlZzRUJ6ZDRMeTEvTmlOQjlPUG15dXA0VjFwbDNqSzlQN0h4?=
 =?utf-8?B?WngyQkxyYzRoUU4wcXFHN3hZelJZVFhJMXArMG5xRW9iN3hxejZ0R0xkTU1X?=
 =?utf-8?B?WW5lbm5MUEIzakdvR3BQMzVRVFZuTnhrY3k5Vm90TXNudDZMZW5tcyt4NHRj?=
 =?utf-8?Q?kdl+dfgv//r1B8gKW86cQb85R?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BFD904802ED9D84F9D0B99BD6CE996FA@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?M2ZVOUpkUlhnTWdPWkczVFNKQ2cwQURtNGFVUVZXazhVZ0pqTGM1UHlRNXhq?=
 =?utf-8?B?MUVMVm9wREY3RzF4ajRoT1JLb1BUazIrSm1TMjU3VWxVWE9LbTNqVzYzTnFT?=
 =?utf-8?B?QkNmajFmclQ1RmFvZ01qK0ZhMi9BSGFQcWlySW1OaEwzdkErcU9OV3RoZDZF?=
 =?utf-8?B?OXM2VjFMYVczSkdYUFFZYkpYaFBoTnFnL3lTMzEwNzVFNG16djdaNkU4bUpT?=
 =?utf-8?B?R3hrOTJZMVJ1UUQ1dy9NQUh2Uk9GeUFJSVV0YWtqRTV0eFFjZzduZ0pXNito?=
 =?utf-8?B?aDd5U0d6TnliNE12SjkyM1E2RndwK1dGMDlYcVU4T2FVL3BkaFlBM1VxTU41?=
 =?utf-8?B?Um42Nlhpd2dydWpEM2FuK2Q4aTdjYnNtT21sUHFmQmcvb1NiZ0RXRmpQR0Qr?=
 =?utf-8?B?enZXNW9TNmlQY05EWWc0MVpiRG0xYnkwWUdIUkM4MXcyaE84akJkTEd0NWtL?=
 =?utf-8?B?WWN4Q1RQclJmejZVcFUwemJ4d1pLcWs4eUJyS1VIbDVSVWJVQi8xMk9VM3Nv?=
 =?utf-8?B?Mjdic2prbUI2c05xU252R2Y2S3ZoOUt5dmdZa0J2b1ByRVdmWXVPMG1VeS9K?=
 =?utf-8?B?dEhWaWZURFJnZHdzMjZBd3lFQ0p6NmRVb2lEWURmMG0rNDR3WWdzSFhTWU1z?=
 =?utf-8?B?OEFucHY4Vk5SNU5aUHRQeDBha25UVDVKN1VzcTZlWUJPZEtRa0tNM1J6L05u?=
 =?utf-8?B?YStPcTVkN0paZ1ZlaFZITHNyWWI1MzFQL0dkbVh2R0pmL2RFY1FhV01iTWdp?=
 =?utf-8?B?ek11NElsRlpvaVI0KzFDR3owSmVTdndRQkdQYzhwRXVpSXpqRjN5OVRTTndY?=
 =?utf-8?B?RGxNNkV4Z21lb2gyS3ladGZEeXowL2Zqejg3eGpKVWI4SVk1K05mdWdkZ2E2?=
 =?utf-8?B?MU5oam9ZZzN4ZU9BYnQrRWp5WFUzYkErc3VvdGdLbHI4eGk0MTI1aDJEOEVk?=
 =?utf-8?B?S3I4R1BOczI5ZkJHbEl3dWhmWEF2QWZzVll5dGs5c0I3UjlMOTloL2pXWnpE?=
 =?utf-8?B?UE1kRWwwQXl0WFZZcjVSSjJnSzlNUE5vSWtudXhjaEQ1c003RHJYRzRKMDcx?=
 =?utf-8?B?ci9BYTdQVlhQQUcwNjFVR0NjVEtaTVBrdVJ5YnlIWjNwMFdWeWJ6cU1mcWtV?=
 =?utf-8?B?NXdRanJWa3QrM3ZpTWQ4K0JEZWVmRTdHdmc0aDYvMmNZVnJiYTllRW8wT3A0?=
 =?utf-8?B?blpmeFlTNk9tRGpFY1FtL01IVXJvYnFaekdNeDJadGNSV3o1WjEvekl0V1RQ?=
 =?utf-8?B?dHpwSHpGTktkd05BVlJhVk5GMTRod01jbmVSWktuZ0Z4S2xCUT09?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a7b4ce7-0b67-4936-4eff-08db363c8a5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2023 01:16:24.9811
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bUO3goG4ay3GB85rllOqqBoY2jHyb4endAjaKFMMCKj8q/P7B0A3e8mL0a8LDVxLXQPDJwNO+ZuztWXFxViXKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8331
X-Proofpoint-GUID: U-xipg_5H5sL1NMadaDgnNhgw2j642ca
X-Proofpoint-ORIG-GUID: U-xipg_5H5sL1NMadaDgnNhgw2j642ca
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-05_15,2023-04-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 spamscore=0 mlxlogscore=883 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2304060009
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gV2VkLCBBcHIgMDUsIDIwMjMsIEpvaGFuIEhvdm9sZCB3cm90ZToNCj4gT24gVHVlLCBBcHIg
MDQsIDIwMjMgYXQgMTA6MDM6MDlQTSArMDAwMCwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+IE9u
IFR1ZSwgQXByIDA0LCAyMDIzLCBKb2hhbiBIb3ZvbGQgd3JvdGU6DQo+ID4gPiBPbiBUdWUsIEFw
ciAwNCwgMjAyMyBhdCAwMjowNzoyMlBNICswMjAwLCBPbGl2ZXIgTmV1a3VtIHdyb3RlOg0KPiA+
ID4gPiANCj4gPiA+ID4gDQo+ID4gPiA+IE9uIDA0LjA0LjIzIDEzOjQzLCBKb2hhbiBIb3ZvbGQg
d3JvdGU6DQo+ID4gPiA+IA0KPiA+ID4gPiA+IFRoZSBkZXZpY2UgaXMgYmVpbmcgdXNlZDsgYnkg
dGhlIGRyaXZlciBhbmQgdWx0aW1hdGVseSBieSBhIHVzZXIgdGVsbGluZw0KPiA+ID4gPiANCj4g
PiA+ID4gSSBhbSBhZnJhaWQgdGhhdCBpcyBqdXN0IGFuIGFzc3VtcHRpb24gd2UgY2Fubm90IG1h
a2UuIFRoZSB1c2VyIG1heSBqdXN0IGFzDQo+ID4gPiA+IHdlbGwgYmUgcmVhZGluZyBhIGRldmlj
ZSBzdGF0ZSBiZWZvcmUgYSBkZXZpY2UgaXMgYmVpbmcgdXNlZCBhcyB0aGF0IG1heSBtYXR0ZXIu
DQo+ID4gPiANCj4gPiA+IEl0J3MgYSBwZXJmZWN0bHkgdmFsaWQgYXNzdW1wdGlvbiB0byBtYWtl
LCBhbmQgaXQgaXMgd2FzIGFsbCBkcml2ZXJzIGRvDQo+ID4gPiBmb3IgZGVidWdmcyAoYXMgd2Vs
bCBhcyBzeXNmcykuIFlvdSBhcmUgdGhlIG9uZSBhcmd1aW5nIGZvciBtYWtpbmcgYW4NCj4gPiA+
IGV4Y2VwdGlvbiwgd2hpY2ggSSBkb24ndCB0aGluayBpcyB3YXJyYW50ZWQuDQo+ID4gPiANCj4g
PiA+ID4gPiB0aGUgZHJpdmVyIHRvIGRvIHNvbWV0aGluZyBvbiB0aGVpciBiZWhhbGYuIFRoZSBm
YWN0IHRoYXQgdGhlIHVzZXIgaXMNCj4gPiA+ID4gPiBpbml0aWF0aW5nIGFuIGFjdGlvbiB0aHJv
dWdoIGFuIGludGVyZmFjZSB3aGljaCBpbnRlbmRlZCBmb3IgZGVidWdnaW5nDQo+ID4gPiA+ID4g
c2hvdWxkIG5vdCBtYXR0ZXIgKGFuZCB0aGUgdXNlciBhbHdheXMgaGFzIHRoZSBvcHRpb24gdG8g
Y2hlY2sgdGhlDQo+ID4gPiA+ID4gcnVudGltZSBwbSBzdGF0ZSBiZWZvcmUgaW5pdGlhdGluZyB0
aGUgYWN0aW9uIGlmIHRoYXQgbWF0dGVycyBhdCBhbGwpLg0KPiA+ID4gPiANCj4gPiA+ID4gMS4g
VGhhdCBpcyBhIHJhY2UgY29uZGl0aW9uLg0KPiA+ID4gDQo+ID4gPiBTdXJlLCBidXQgeW91IGNh
bid0IGhhdmUgaXQgYm90aCB3YXlzLiBZb3VyIHByb3Bvc2VkIGludmVydGVkIGxvZ2ljIGlzDQo+
ID4gPiByYWN5IGFzIHlvdSBtYXkgb3IgbWF5IG5vdCBnZXQgYW55IGRhdGEuDQo+ID4gPiANCj4g
PiA+ID4gMi4gUXVpdGUgYSBsb3Qgb2YgYnVncyB3ZSBhcmUgbG9va2luZyBhdCBpbnZvbHZlIHBv
d2VyIHRyYW5zaXRpb25zLg0KPiA+ID4gPiBZb3UganVzdCBjYW5ub3QgYXNzdW1lIHRoYXQgYSBk
ZXZpY2Ugd2lsbCByZWFjdCB0aGUgc2FtZSB3YXkgaWYgaXQgd2FzDQo+ID4gPiA+IHdha2VuIHVw
IGJldHdlZW4gZXZlbnRzLg0KPiA+ID4gDQo+ID4gPiBUaGVuIGp1c3QgZG9uJ3QgdXNlIHRoZSBp
bnRlcmZhY2UgaWYgeW91IGZvciB3aGF0ZXZlciByZWFzb24gZG9uJ3Qgd2FudA0KPiA+ID4gdG8g
d2FrZSB0aGUgZGV2aWNlIHVwLg0KPiA+ID4gDQo+ID4gDQo+ID4gSG93IGNhbiB3ZSBrbm93IHdo
ZW4gdG8gdXNlIGFuZCB3aGVuIG5vdCB0byB1c2UgaXQ/IFdlIGNhbid0IGp1c3QgcmVseQ0KPiA+
IG9uIHJ1bnRpbWVfc3RhdHVzIGZvciB0aGF0LiBUaGUgZGV2aWNlIGNhbiBnbyBpbnRvIHN1c3Bl
bmQgYW55IHRpbWUuDQo+IA0KPiBZb3UgY2FuIGRpc2FibGUgcnVudGltZSBQTSB0aHJvdWdoIHN5
c2ZzIGlmIHlvdSB3YW50IHRvIGF2b2lkIHByZXZlbnQNCj4gdGhlIGRldmljZSBmcm9tIHN1c3Bl
bmRpbmcgdW5kZXJuZWF0aCB5b3UuDQo+IA0KPiBUaGUgcG9pbnQgaXMgdGhhdCBieSBoYXZpbmcg
YSBjb25zaXN0ZW50IGJlaGF2aW91ciBmb3IgZGVidWdmcyB3aXRoDQo+IHJlc3BlY3QgdG8gcnVu
dGltZSBQTSB5b3UgY2FuICphbHdheXMqIHVzZSBpdC4gSXQgZG9lc24ndCBjcmFzaCBhbmQgaXQN
Cj4gZG9lcyBub3QgcmV0dXJuIHJhbmRvbSBlcnJvcnMgYmFzZWQgb24gZXh0ZXJuYWwgZXZlbnRz
Lg0KPiANCj4gU3VyZSwgaWYgeW91IGFyZSB0cnlpbmcgdG8gZGVidWcgc29tZSBydW50aW1lIFBN
IHJlbGF0ZWQgaXNzdWUsIHRoaXMgbWF5DQo+IG9yIG1heSBub3QgaW50ZXJmZXJlIHdpdGggdGhh
dCwgYnV0IHRoZW4geW91IHByb2JhYmx5IG5lZWQgYSBtb3JlDQo+IHNwZWNpYWxpc2VkIGluc3Ry
dW1lbnRhdGlvbiB0byBkZWJ1ZyB0aGF0IGFueXdheSAoZS5nLiBkdW1waW5nIHN0YXRlDQo+IHdo
ZW4geW91IHJlY2VpdmUgd2FrZXVwIGV2ZW50cywgZXRjKS4NCg0KRmFpciBwb2ludHMuIEkgd2Fz
IGVudGVydGFpbmluZyB0aGUgb3B0aW9uIHdoZXJlIHRoaXMgY2FuIGJlIHVzZWQgdG8NCnBvbGwg
ZHVyaW5nIHJ1bnRpbWUgUE0gZW5hYmxlZCwgYnV0IHRoZSBkYXRhIG1heSBub3QgYmUgdXNlZnVs
IGVub3VnaCBpbg0KYWN0dWFsIGRlYnVnLg0KDQo+IA0KPiBBIG1hbnVhbGx5IGNvbnRyb2xsZWQg
c3lzZnMgaW50ZXJmYWNlIGZvciBkdW1waW5nIHJlZ2lzdGVycyByZWFsbHkgaXNuJ3QNCj4gZW5v
dWdoIHRvIGRlYnVnIHBvd2VyLXN0YXRlICp0cmFuc2l0aW9ucyouDQo+IA0KPiBUaGF0IGxlYXZl
cyBpbnNwZWN0aW9uIG9mIHRoZSBzdXNwZW5kZWQgc3RhdGUsIGJ1dCB0aGUgd2hvbGUgcmVhc29u
IHRoYXQNCj4gd2UncmUgaGF2aW5nIHRoaXMgZGlzY3Vzc2lvbiBpcyB0aGF0IHRoYXQgc3RhdGUg
aXMgbm90IGF2YWlsYWJsZSB0byB0aGUNCj4gZHJpdmVyIHdoaWxlIHN1c3BlbmRlZCBpbiB0aGUg
Zmlyc3QgcGxhY2UuDQo+IA0KDQpJJ20gY29udmluY2VkIG5vdy4NCg0KVGhhbmtzLA0KVGhpbmg=
