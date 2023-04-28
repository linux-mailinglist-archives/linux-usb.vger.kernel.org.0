Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C3546F1E35
	for <lists+linux-usb@lfdr.de>; Fri, 28 Apr 2023 20:49:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346487AbjD1Stn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Apr 2023 14:49:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229646AbjD1Stl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 28 Apr 2023 14:49:41 -0400
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B1991FDC
        for <linux-usb@vger.kernel.org>; Fri, 28 Apr 2023 11:49:39 -0700 (PDT)
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33SGr1iF011951;
        Fri, 28 Apr 2023 11:49:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=eQ98j861pKpKYpFVrlZVcUMQZlLRIixSVPhdt/eQAKk=;
 b=DiC8ryHd7ywT/clNV/jqlsdeQ4A2R2kpxSoo2g0sEysQsAHb6wV+1ZPVzmWqvW6C1dTy
 Q1RBvnzBrma2mWUe/6yk/gWssqis9mce2CBNP9HizobzJgJhI6G0986C6UplAbNILE/F
 /ens0vVQe6aUK0fPNlDDSVJCtEtfJ4v9SGxL5abs1D1+lye6tzcJx4NZdgKtJjvlnXMI
 4adLYuj4HPYk/lwzG+rFE43wFt2sEPI9fRgmW8tIwDO8C0TwFlXSon0XoIbnHoGCD3bk
 6cob7XHUSDQK19c3gsPLLGnTqhRgWI1PH8jdmLK4CjJXaq+Ax1qOJZWkkY+5TdnOcUL0 FQ== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3q4eu76t2y-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 28 Apr 2023 11:49:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1682707776; bh=eQ98j861pKpKYpFVrlZVcUMQZlLRIixSVPhdt/eQAKk=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=Q/vZxeYpJy8bwE6oFXgtelnRtmrKJ1TiLujfHIOQS3tTL2kpOu0P00cbIw2FCOTd+
         mJS8qPSWStfMrFr4wqagLrEjozoFUmFis+VrY0GLVAfEdena0BlbauZvlP1YLTI3N4
         mobh8Io+1EVAYKNbMApE2JCFW7lr0YBABqvf8aKTDjRMg0WHK5bJ6+eVSKmSerdJD6
         xk+86xsaAIqDTVVzvuuQ98JE6DIKvr9784E0zRjByhcfiThrwYA8w4d9Y3ESSAU30z
         Zd6dgwPxICjjC2kRRW8UhoIb5HrtdV0mkRoKr5kj0biOe8APFJ7BBvyxfdy05NPFua
         HItv7ZGGCZelw==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id ED63740522;
        Fri, 28 Apr 2023 18:49:35 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 75F43A0062;
        Fri, 28 Apr 2023 18:49:35 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=Nh2JhIWX;
        dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2043.outbound.protection.outlook.com [104.47.51.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 836D54045F;
        Fri, 28 Apr 2023 18:49:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WnUubGygwzyNjqPRjR7PUNPFbxtAEkX4ZtqYt2e1YL8AyvhJ9NUME/wIMBajrKz+AnQfaTLf+mysmoKHShsuyLfGtPNEdBitPTl7HgeiPLDp1bIl4r2yaEbxyS7+3XkyVXBJRBGeNuSbedysh+WUBt6Szagwo4DR/iZtlA3gWOpLGbYVG0DLgEUvISLDTm5+kTkaWuNJ/C1F3T3nRbEQ1a/+a/wmlRMk+RHJQ5RZAnIWGDlWAUxgXpTL7J3BdgcFQUUrjlrDxDX9Hgy8c1T5uNlIOjmMAg0Rs5oRmP0+fD8w/cagjT+/ZO+wCMvc2gVsogr37ub97uy8KrZdZuEI4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eQ98j861pKpKYpFVrlZVcUMQZlLRIixSVPhdt/eQAKk=;
 b=MQpN2wHjGuevrZR3NQMJQZN8jz57Qt56r6hBdpLnOmOAcdS29BEzbpRgcH9e9Ysfw+czs631ysLjQsAqCOmG4glo8I1Rw13vDkpv7hxu2TOT0GxOKtbvw4MKQa3JbhuT2k5uIzYS/dvoQDSdn+/0Z/3bxIL/nfyBhuCVJ5JUtpMyIhMeELWVGGTAiSrFeUgmqRwoo45RUHvmNwTmgAKBIkqzYBOkYnJvUseBBUz9AeqnZE+2bAn5XUF9hl+ZUuZ4uhAtEjB8+jHStIkpguGshfLNMN1F7pEqfqfnqXYCbjsoGUQxE69uouO017iQmhvg2yg1uu2APuj/a6GJSX5DXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eQ98j861pKpKYpFVrlZVcUMQZlLRIixSVPhdt/eQAKk=;
 b=Nh2JhIWX+t/law5JBg/sp473sCiFNqtpm3WTHXjghimqYDXLvAnhZrgkwvO2n6YdpDRBk0IstmTY3r4DVebcp5fwECp+iXBLifT+uDIdeUslNcTSySQrWytjaDhfGDBfukCDcjB1JGDI0hznSs1e/smqLylLHvYeoGXzCqGw5r4=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BY5PR12MB4132.namprd12.prod.outlook.com (2603:10b6:a03:209::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.23; Fri, 28 Apr
 2023 18:49:31 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::bb79:9aea:e237:688c]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::bb79:9aea:e237:688c%6]) with mapi id 15.20.6340.022; Fri, 28 Apr 2023
 18:49:31 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v5] usb: dwc3: update link state on each device level
 interrupt
Thread-Topic: [PATCH v5] usb: dwc3: update link state on each device level
 interrupt
Thread-Index: AQHZd+hiMA4PyIWTdEGDDnqcQ8CMgq9BFH4A
Date:   Fri, 28 Apr 2023 18:49:30 +0000
Message-ID: <20230428184926.aygf6bzj3khwiqg3@synopsys.com>
References: <1682476780-2367-1-git-send-email-quic_linyyuan@quicinc.com>
In-Reply-To: <1682476780-2367-1-git-send-email-quic_linyyuan@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|BY5PR12MB4132:EE_
x-ms-office365-filtering-correlation-id: 91a0995c-b4d0-4cf8-4629-08db48194d36
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GbnMmMHKBAAlXsozYWU5Y/AWaNqlzltwoPHjgkweNufATbnlo3bO5Q1TaQRPt6cr1e4uGXUuVTgr6Bp98M65bheGITudU5DRzKSHduTe3k6z2S1GAA+wQFetQTFPGjs6S5HZk2J8g3cHQiuQVsscvbweCJIR/ORn+BJBkn0ktNmoVwoaJ+D6SvKBbGoh7fWSRKYV8v9k1uyxgRmvb/4NcOdHYYxgbX3wGMatoGmx/XHYg9MQzhqyDUsf5qtiYh1NVt/BL3Wt8dctGJo2mZ8zy9gzQVaNnJ/Oa0c3V95OLCgnQrlCQGqgmq6duUrP4dpoKnizyobSTj/OKryV49eedI5X9jXLwkfoZFd2C8Iy58f0qbIuiLukI28Fae2wJhfFJBo66okK8SeUW3XiXzJRrfSz+IGeLzaNeG802s9E5VgW5luCohAq3S26RSWwSvQD1uOApUD7Kb9W0QsWezHHsyv/kb+nBprdXgW7WwbJYRaX5YhjSZD2uhoTskIadenWiJA7CgY39qTsbgBrWXRbNbFnwAXAkiX7vfdYTS7HPBBYbvgXme3ZIhJq3E2xTjDLAK0NV17wRRQwsBn2q7DIBxDd3W55eLupcjtEdmOxs7bcOsYJGUt1AXexDCLj0VBWFAO9KxL3/My8vGTaYEUszQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39850400004)(366004)(346002)(396003)(136003)(451199021)(66946007)(8676002)(8936002)(54906003)(6916009)(38100700002)(5660300002)(66476007)(66556008)(4326008)(66446008)(64756008)(76116006)(478600001)(316002)(86362001)(966005)(38070700005)(122000001)(6486002)(2906002)(41300700001)(83380400001)(15650500001)(2616005)(71200400001)(36756003)(186003)(6512007)(6506007)(1076003)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d0FsbzVLL0pMbFI2RFJkWWlKbk8rNE0vUGFtT25MS2ZZQTNKbEwxeTJjYU5o?=
 =?utf-8?B?VlVYbkZlemNXcTBxdGNJTWxYRzE1TDd5YmZ0OTYzVGlQT2JtVDJsS1NNK3lJ?=
 =?utf-8?B?QnBLc2tlQWQ3aVZQVUVEQmRjaVZFMjR3ZXRKU01HU1Awb2s0aVJIVndiYmRu?=
 =?utf-8?B?dUg3S0YzZ3hSTTNONm4xV0hTd3VhNXl6UUJTR1Z3eWxpOW4yckFvdHI5aXZM?=
 =?utf-8?B?ZmI2clJrb1JJN21TalQwNGg0eHZvNjlVMXpIazBJWjlQV201MDYwUVVTSlR5?=
 =?utf-8?B?WjR0YThjVWdzWHJ2eGNZYW5JN09sRXJtOUw5WU1VU3p1NERtM2tycC9xRGVi?=
 =?utf-8?B?STVoNmlpaE9CeGZDdEN2WnVyYTk4T3ZrZk42OG9memJxV3NaTnBIc1FNQkgw?=
 =?utf-8?B?bVVwVUsycm0yQWN2MVgyZFdPZGliOS9mMTdSMnJqdDVuTWNiUnMzeFJ4K0Q2?=
 =?utf-8?B?YXB6QXJyNkgvc092VVYxcE16dU1VMVlpM1JsbCtDR3krSGdURUtVakNqK3hS?=
 =?utf-8?B?OGtvTXpBallpb2t4TEI1ZkxsVCtpVHpNS29ISmxNNFNLRmxob29xcktBc3NC?=
 =?utf-8?B?ZVBxTmtvSWJpOU52ek9YdXdXSWQ1aG01VHRJYW9OMUdiQW9QdTk4amtSOGN2?=
 =?utf-8?B?QS9McFA3NWdXbzJiRWpsMGdmLzFxUUpYMWVnbkVlY2J4ZjJXdk5PcjRhaG5m?=
 =?utf-8?B?Nml5T1kxRmxVaUFQdXZuMU9YK2k5b2RzblJMeWFhWG1kVGtQZnhSL1dYOXpy?=
 =?utf-8?B?N2Z1TVhRK2ZGS01MQ21XMURUTHdTbkQxNW1hK2Y0OWZXVGRvMGEwTUhaTXk4?=
 =?utf-8?B?Q2xRdjV2SXU3Yk8xcEJGRGg2MXZFa2R3K1FkcjNydWlOKzJMZldOWkk2VldG?=
 =?utf-8?B?V29RN3FpOEZxMVJLeDJVUFZEMnRQbUdVY29xMUJnOWp1aVBYcEFpQTV2VWFI?=
 =?utf-8?B?dzVkNDBPS01jT3VSSG1KRW5pSEZEQmJud1BacThZV1N1Tk5OTTZHU3F3U3hs?=
 =?utf-8?B?V0g4NjBGbzJycTFjUDRONm12REw5SmFhTWpPWmRwZzVha1BMY0xzdUF0TmxO?=
 =?utf-8?B?RHliVVFUMG5UZ1ZjblZLQjFEdmNJNThiTU96RURnTEwrbFBrTkdFaTAxSWU1?=
 =?utf-8?B?NSt3NldsRGlmVGpJaUN4eGo5TGh5d0cxWUtOWlRwSS9DTHJZcDhSQWFqN3dl?=
 =?utf-8?B?S0RJSFpXam5tVTdhbGUydWx5MVpNaWxlNzQvODM1RnlObmFrajdSamJoNUQv?=
 =?utf-8?B?RWFOdFFVRmE0WWdRK0tHKzZKdkVnT2lCRitqeWdkV1lKcFIyb3g5eGM0Nmcv?=
 =?utf-8?B?RXJCYU9GQk1ZL1c4VzYzN2MwNEw4SFFPMWVCSlZrVUxqVm13OFF5RnUrZ3lZ?=
 =?utf-8?B?TzNJWUcrMjZIVmlwVEVndmJlOVk5TEd2dmt5b3A2emhJbncyUHRhQmNxSys3?=
 =?utf-8?B?cHVFdTdqYWR0VU42dDVObjJvOTd5a1h5WGdwOWVNRWlaZFZSZ1JiQ2w0OUV2?=
 =?utf-8?B?clppVzFQaUcwcTlxR29kYTZYTm5VVitWclN4Ukl6MW1TVW91QVRScXorSldP?=
 =?utf-8?B?dDdZNkpXQUhCMFBsbzJoZ2xOUVJIUmNPOEY0UE4yU2ZJY3VNdytMWXVYaklp?=
 =?utf-8?B?dVh2U1RxRTB4YUVvNjlkWUlTVDBQRnVVbEpCSk1YaURqQU1zcVgwMVAwb3NB?=
 =?utf-8?B?cTh0U3BvNGJ4WDVWMUl6SnBDTWxPVjhZNlRUR08yNFhMbmM2dVUvMmsrWllh?=
 =?utf-8?B?OEs4TnNqajNMWWF1UkxNM3piNU1wYS9vSnRhN1dIcTlxWElUMDlnMytIQmNQ?=
 =?utf-8?B?bEZvT3QzdGsvQWFvTWozMnVSeTRuekt3RTVRUUdYeFpTQVNxS28zZUpDRVpE?=
 =?utf-8?B?UCtETHcxWS9UcXRxanZHOE5ZY2JNRnY0c0crNjRrdUVtbXlHVFhCSXpHUVdW?=
 =?utf-8?B?ekNnbVl0NHducWhERzF1a1VJeXZCVEpkSG9PS2tLZ3FXQ0o1THVFeCtsWWZS?=
 =?utf-8?B?Z2hRMitBZVltQ0N6Z0JGOEp1WXI3eTlNWFVod0RpaFpuQjJPbnJ2YUdxTU4x?=
 =?utf-8?B?MmsxbmlxTUFzNTlNdGxTUFFGcDhiWE9wR1VId3BLa1dTQUw0OXRyQU1Ycmp3?=
 =?utf-8?B?ZXhwdmgrVVlDcGx6ZTB4Vi9kbFZSV1Q0WnlsSzNuUHZsMCtwL3FLbmNrM3Y1?=
 =?utf-8?B?cHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <70CBFBEFFDD044438BEF47E8BC292205@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: MDLuWzYhqxywOgCKK2kCqZJgSgF9a5pt1YdXBI5X9hzCq8fR3ILGsYV0BWpY904WMQ8Jaa5QGAU7FXCuX4l51l+/2PTDcSgmL76iu0RDtgageSfxx+whyBknP6JNBwuZEjjiBRH6/hUmVq7cmKcls8noRA72/koA+mQ0Z+OTLlEDjhnxB4Z7XTC3PXRHqVUcUbDoVajkIU5i6f1M0qd+zgRAz7jAJTITzgO2R7boKlnL6oGAnar3zYvOYjCf6Oqq7w4/yApZgknSLx8qZ1rppQnZGtpO+uGzk95S8W5RQQrNhNe6DB8L8k7jWWQ82vwlJz05Y6Uhsuhu1qn1YTrF9tvyqgVKi2LjY5iKOu4NxajmV/6eEBcIipRD6jBgjxPgDssWq1X/31bDtam/nOpeXFYb6HiwBtt3HpSE4Dv/hdChX+qvog27OWNopqUVyPBV+Bdu28B2gIBPVeSsdAlwJGwb7Q2lmIuxZcJFTnvfCmWl4egw6rfkYLWiGzhGAuFAClRG19QgA4bCGZnS+OrdrzH7dIXPGZm4s21zPv657iVNpH0lRdnsUsmLNLgZjvYZTWz7Hdj2cdt5TNTzjuNC24mpd7POydTV/14Z8a2HNtDnkD2CcRMnQHvORsC+hU1ZA/4HRFtCQdEGivqw0WNuEoytmMoaTQCGzrVV9//SahKRxt2q7RwGRUqeFND76q+Z41YtWPoXK/Bf/Lyqzb5z4Kzf/nE2nuToecTdGAMnaZMAekao2LR8/EyGUlFn8OkntBSf92M6ymCRxLa7bLGbwIrkT7NQqyO49b4Stuwdn06jVQSH6Tx/Hi/krMQwxK+IPrErszF3xVhtJia1xQVYn8I1IsAPmP72KUylAP0Q/54itNeBrP5x7BT+v+sW7VO5CMXDsdGIOHbYqEu40IeClA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91a0995c-b4d0-4cf8-4629-08db48194d36
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2023 18:49:30.9270
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p2ofkS11pQVpdBRrIia1qr7cIQQ0kbFCVv9ZtmvTAhJz0z+g+q/4xUsgku+YUhPjyttfuf3GtcV7lWfZNbZrQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4132
X-Proofpoint-GUID: h4TDAK3fIw2LXG4MmmZrLCD_WvYhRgG9
X-Proofpoint-ORIG-GUID: h4TDAK3fIw2LXG4MmmZrLCD_WvYhRgG9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-28_05,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0
 mlxscore=0 phishscore=0 mlxlogscore=999 malwarescore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2304280153
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gV2VkLCBBcHIgMjYsIDIwMjMsIExpbnl1IFl1YW4gd3JvdGU6DQo+IFdoZW4gd29yayBpbiBn
YWRnZXQgbW9kZSwgY3VycmVudGx5IGRyaXZlciBkb2Vzbid0IHVwZGF0ZSBzb2Z0d2FyZSBsZXZl
bA0KPiBsaW5rX3N0YXRlIGNvcnJlY3RseSBhcyBsaW5rIHN0YXRlIGNoYW5nZSBldmVudCBpcyBu
b3QgZW5hYmxlZCBmb3IgbW9zdA0KPiBkZXZpY2VzLCBpbiBmdW5jdGlvbiBkd2MzX2dhZGdldF9z
dXNwZW5kX2ludGVycnVwdCgpLCBpdCB3aWxsIG9ubHkgcGFzcw0KPiBzdXNwZW5kIGV2ZW50IHRv
IFVEQyBjb3JlIHdoZW4gc29mdHdhcmUgbGV2ZWwgbGluayBzdGF0ZSBjaGFuZ2VzLCBzbyB3aGVu
DQo+IGludGVycnVwdCBnZW5lcmF0ZWQgaW4gc2VxdWVuY2VzIG9mIHN1c3BlbmQgLT4gcmVzZXQg
LT4gY29ubmRvbmUgLT4NCj4gc3VzcGVuZCwgbGluayBzdGF0ZSBpcyBub3QgdXBkYXRlZCBkdXJp
bmcgcmVzZXQgYW5kIGNvbm5kb25lLCBzbyBzZWNvbmQNCj4gc3VzcGVuZCBpbnRlcnJ1cHQgZXZl
bnQgd2lsbCBub3QgcGFzcyB0byBVREMgY29yZS4NCj4gDQo+IEFzIGluIGdhZGdldCBtb2RlLCBk
ZXZpY2UgbGV2ZWwgaW50ZXJydXB0IGV2ZW50IGhhdmUgbGluayBzdGF0ZQ0KPiBpbmZvcm1hdGlv
biwgbGV0J3MgdHJ1c3QgaXQgYW5kIHVwZGF0ZSBzb2Z0d2FyZSBsZXZlbCBsaW5rIHN0YXRlIHRv
IGl0DQo+IHdoZW4gcHJvY2VzcyBlYWNoIGRldmljZSBsZXZlbCBpbnRlcnJ1cHQuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBMaW55dSBZdWFuIDxxdWljX2xpbnl5dWFuQHF1aWNpbmMuY29tPg0KPiAt
LS0NCj4gDQo+IHY1OiAocmVmZXIgdjQgaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXVzYi8xNjgyMzkzMjU2LTE1NTcyLTEtZ2l0LXNlbmQt
ZW1haWwtcXVpY19saW55eXVhbkBxdWljaW5jLmNvbS9fXzshIUE0RjJSOUdfcGchWXBvVWtXMmpt
Q0JNbEloMHlGdkdpTl9iMGliZmRSNE9xNjE2bVZYcFRNRVhqZ201TGVabmJZZ3hicjlTUUoyZDMx
SUs0Q1dudFlHRmc2eFRYN0l2SEdYUXUtUkNHUSQgKQ0KPiAxKSByZW5hbWUgc3VzcGVuZF9pcnFf
aGFwcGVuIHRvIHN1c3BlbmRlZCBhbmQgZG9jdW1lbnQgaXQNCj4gMikgYWRkIG9sZF9saW5rX3N0
YXRlIGZvciBsaW5rIGNoYW5nZSBpbnRlcnJ1cHQgdXNhZ2UgYW5kIGNoYW5nZSBhY2NvcmRpbmds
eQ0KPiANCj4gdjQ6IChyZWZlciB2MyBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtdXNiLzE2ODIwNTM4NjEtMjE3MzctMS1naXQtc2VuZC1l
bWFpbC1xdWljX2xpbnl5dWFuQHF1aWNpbmMuY29tL19fOyEhQTRGMlI5R19wZyFZcG9Va1cyam1D
Qk1sSWgweUZ2R2lOX2IwaWJmZFI0T3E2MTZtVlhwVE1FWGpnbTVMZVpuYllneGJyOVNRSjJkMzFJ
SzRDV250WUdGZzZ4VFg3SXZIR1hqSlA5ODZ3JCApDQo+IDEpIHJlbW92ZSBsaW5rIHN0YXRlIGNo
ZWNraW5nIGluIGR3YzNfZ2FkZ2V0X3dha2V1cF9pbnRlcnJ1cHQoKQ0KPiAyKSByZW1vdmUgdHdv
IHN3aXRjaC9jYXNlIHRvIGlmIG9wZWFydGlvbg0KPiANCj4gdjM6IChyZWZlciB2MiBodHRwczov
L3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtdXNiLzE2
ODIwNDI0NzItMjEyMjItMS1naXQtc2VuZC1lbWFpbC1xdWljX2xpbnl5dWFuQHF1aWNpbmMuY29t
L19fOyEhQTRGMlI5R19wZyFZcG9Va1cyam1DQk1sSWgweUZ2R2lOX2IwaWJmZFI0T3E2MTZtVlhw
VE1FWGpnbTVMZVpuYllneGJyOVNRSjJkMzFJSzRDV250WUdGZzZ4VFg3SXZIR1c2ZlRjdEJnJCAp
DQo+IG5vIGNvZGUgY2hhbmdlIHNpbmNlIHYyLCBjaGFuZ2VzIGNvbXBhcmUgdjEgYXMgYmVsb3cs
DQo+IDEpIGFkZCBhIGZsYWcgc3VzcGVuZF9pcnFfaGFwcGVuIHRvIHNpbXBsaWZ5IGR3YzNfZ2Fk
Z2V0X3N1c3BlbmRfaW50ZXJydXB0KCksDQo+ICAgIGl0IHdpbGwgYXZvaWQgcmVmZXIgdG8gc29m
dHdhcmUgbGV2ZWwgbGlua19zdGF0ZSwgZmluYWxseSBsaW5rX3N0YXRlIHdpbGwNCj4gICAgb25s
eSB1c2VkIGluIGR3YzNfZ2FkZ2V0X2xpbmtzdHNfY2hhbmdlX2ludGVycnVwdCgpLg0KPiAyKSBy
ZW1vdmUgc3cgc2V0dGluZyBvZiBsaW5rX3N0YXRlIGluIGR3YzNfZ2FkZ2V0X2Z1bmNfd2FrZXVw
KCkNCj4gMykgYWRkIGR3YzNfZ2FkZ2V0X2ludGVycnVwdF9lYXJseSgpIHRvIGNvcnJlY3Qgc2V0
dGluZyBvZiBsaW5rX3N0YXRlDQo+ICAgIGFuZCBzdXNwZW5kX2lycV9oYXBwZW4uDQo+IA0KPiB2
MjogdXBkYXRlIGFjY29yZGluZyB2MSBkaXNjdXNzaW9uDQo+IHYxOiBodHRwczovL3VybGRlZmVu
c2UuY29tL3YzL19faHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtdXNiLzE2NzUyMjEyODYt
MjM4MzMtMS1naXQtc2VuZC1lbWFpbC1xdWljX2xpbnl5dWFuQHF1aWNpbmMuY29tL19fOyEhQTRG
MlI5R19wZyFZcG9Va1cyam1DQk1sSWgweUZ2R2lOX2IwaWJmZFI0T3E2MTZtVlhwVE1FWGpnbTVM
ZVpuYllneGJyOVNRSjJkMzFJSzRDV250WUdGZzZ4VFg3SXZIR1U4bGg4NHNBJCANCj4gDQo+ICBk
cml2ZXJzL3VzYi9kd2MzL2NvcmUuaCAgIHwgIDQgKysrKw0KPiAgZHJpdmVycy91c2IvZHdjMy9n
YWRnZXQuYyB8IDQzICsrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0N
Cj4gIDIgZmlsZXMgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0pDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmggYi9kcml2ZXJzL3VzYi9k
d2MzL2NvcmUuaA0KPiBpbmRleCBkNTY0NTdjLi4xNDA4NjZhIDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL3VzYi9kd2MzL2NvcmUuaA0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuaA0KPiBA
QCAtMTAzOCw2ICsxMDM4LDcgQEAgc3RydWN0IGR3YzNfc2NyYXRjaHBhZF9hcnJheSB7DQo+ICAg
KiBAZXAwX25leHRfZXZlbnQ6IGhvbGQgdGhlIG5leHQgZXhwZWN0ZWQgZXZlbnQNCj4gICAqIEBl
cDBzdGF0ZTogc3RhdGUgb2YgZW5kcG9pbnQgemVybw0KPiAgICogQGxpbmtfc3RhdGU6IGxpbmsg
c3RhdGUNCj4gKyAqIEBvbGRfbGlua19zdGF0ZTogY2FjaGUgbGluayBzdGF0ZSBmb3IgbGluayBj
aGFuZ2UgaW50ZXJydXB0IHVzYWdlDQo+ICAgKiBAc3BlZWQ6IGRldmljZSBzcGVlZCAoc3VwZXIs
IGhpZ2gsIGZ1bGwsIGxvdykNCj4gICAqIEBod3BhcmFtczogY29weSBvZiBod3BhcmFtcyByZWdp
c3RlcnMNCj4gICAqIEByZWdzZXQ6IGRlYnVnZnMgcG9pbnRlciB0byByZWdkdW1wIGZpbGUNCj4g
QEAgLTExMTYsNiArMTExNyw3IEBAIHN0cnVjdCBkd2MzX3NjcmF0Y2hwYWRfYXJyYXkgew0KPiAg
ICogQGRpc19tZXRhc3RhYmlsaXR5X3F1aXJrOiBzZXQgdG8gZGlzYWJsZSBtZXRhc3RhYmlsaXR5
IHF1aXJrLg0KPiAgICogQGRpc19zcGxpdF9xdWlyazogc2V0IHRvIGRpc2FibGUgc3BsaXQgYm91
bmRhcnkuDQo+ICAgKiBAd2FrZXVwX2NvbmZpZ3VyZWQ6IHNldCBpZiB0aGUgZGV2aWNlIGlzIGNv
bmZpZ3VyZWQgZm9yIHJlbW90ZSB3YWtldXAuDQo+ICsgKiBAc3VzcGVuZGVkOiBzZXQgaWYgc3Vz
cGVuZCBpcnEgaGFwcGVuIHRvIGF2b2lkIHBvc3NpYmxlIGNvbnNlY3RpdmUgc3VzcGVuZC4NCj4g
ICAqIEBpbW9kX2ludGVydmFsOiBzZXQgdGhlIGludGVycnVwdCBtb2RlcmF0aW9uIGludGVydmFs
IGluIDI1MG5zDQo+ICAgKgkJCWluY3JlbWVudHMgb3IgMCB0byBkaXNhYmxlLg0KPiAgICogQG1h
eF9jZmdfZXBzOiBjdXJyZW50IG1heCBudW1iZXIgb2YgSU4gZXBzIHVzZWQgYWNyb3NzIGFsbCBV
U0IgY29uZmlncy4NCj4gQEAgLTEyNTQsNiArMTI1Niw3IEBAIHN0cnVjdCBkd2MzIHsNCj4gIAll
bnVtIGR3YzNfZXAwX25leHQJZXAwX25leHRfZXZlbnQ7DQo+ICAJZW51bSBkd2MzX2VwMF9zdGF0
ZQllcDBzdGF0ZTsNCj4gIAllbnVtIGR3YzNfbGlua19zdGF0ZQlsaW5rX3N0YXRlOw0KPiArCWVu
dW0gZHdjM19saW5rX3N0YXRlCW9sZF9saW5rX3N0YXRlOw0KPiAgDQo+ICAJdTE2CQkJdTJzZWw7
DQo+ICAJdTE2CQkJdTJwZWw7DQo+IEBAIC0xMzMyLDYgKzEzMzUsNyBAQCBzdHJ1Y3QgZHdjMyB7
DQo+ICAJdW5zaWduZWQJCWRpc19zcGxpdF9xdWlyazoxOw0KPiAgCXVuc2lnbmVkCQlhc3luY19j
YWxsYmFja3M6MTsNCj4gIAl1bnNpZ25lZAkJd2FrZXVwX2NvbmZpZ3VyZWQ6MTsNCj4gKwl1bnNp
Z25lZAkJc3VzcGVuZGVkOjE7DQo+ICANCj4gIAl1MTYJCQlpbW9kX2ludGVydmFsOw0KPiAgDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jIGIvZHJpdmVycy91c2IvZHdj
My9nYWRnZXQuYw0KPiBpbmRleCBjMGNhNGQxLi5hMWFiYTNhIDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMN
Cj4gQEAgLTI0NDAsNyArMjQ0MCw2IEBAIHN0YXRpYyBpbnQgZHdjM19nYWRnZXRfZnVuY193YWtl
dXAoc3RydWN0IHVzYl9nYWRnZXQgKmcsIGludCBpbnRmX2lkKQ0KPiAgCQkJcmV0dXJuIC1FSU5W
QUw7DQo+ICAJCX0NCj4gIAkJZHdjM19yZXN1bWVfZ2FkZ2V0KGR3Yyk7DQo+IC0JCWR3Yy0+bGlu
a19zdGF0ZSA9IERXQzNfTElOS19TVEFURV9VMDsNCg0KVGhlIGR3YzNfZ2FkZ2V0X2Z1bmNfd2Fr
ZXVwKCkgc2hvdWxkbid0IHVwZGF0ZSB0aGUgZHdjLT5saW5rX3N0YXRlIGluDQp0aGUgYmVnaW5u
aW5nLiBJIG1pc3NlZCB0aGlzIHdoZW4gcmV2aWV3aW5nIGZvciB0aGF0Lg0KDQo+ICAJfQ0KPiAg
DQo+ICAJcmV0ID0gZHdjM19zZW5kX2dhZGdldF9nZW5lcmljX2NvbW1hbmQoZHdjLCBEV0MzX0RH
Q01EX0RFVl9OT1RJRklDQVRJT04sDQo+IEBAIC00MTc4LDcgKzQxNzcsNyBAQCBzdGF0aWMgdm9p
ZCBkd2MzX2dhZGdldF9jb25uZG9uZV9pbnRlcnJ1cHQoc3RydWN0IGR3YzMgKmR3YykNCj4gIAkg
Ki8NCj4gIH0NCj4gIA0KPiAtc3RhdGljIHZvaWQgZHdjM19nYWRnZXRfd2FrZXVwX2ludGVycnVw
dChzdHJ1Y3QgZHdjMyAqZHdjLCB1bnNpZ25lZCBpbnQgZXZ0aW5mbykNCj4gK3N0YXRpYyB2b2lk
IGR3YzNfZ2FkZ2V0X3dha2V1cF9pbnRlcnJ1cHQoc3RydWN0IGR3YzMgKmR3YykNCj4gIHsNCj4g
IAkvKg0KPiAgCSAqIFRPRE8gdGFrZSBjb3JlIG91dCBvZiBsb3cgcG93ZXIgbW9kZSB3aGVuIHRo
YXQncw0KPiBAQCAtNDE5MCwxNCArNDE4OSwxMSBAQCBzdGF0aWMgdm9pZCBkd2MzX2dhZGdldF93
YWtldXBfaW50ZXJydXB0KHN0cnVjdCBkd2MzICpkd2MsIHVuc2lnbmVkIGludCBldnRpbmZvKQ0K
PiAgCQlkd2MtPmdhZGdldF9kcml2ZXItPnJlc3VtZShkd2MtPmdhZGdldCk7DQo+ICAJCXNwaW5f
bG9jaygmZHdjLT5sb2NrKTsNCj4gIAl9DQo+IC0NCj4gLQlkd2MtPmxpbmtfc3RhdGUgPSBldnRp
bmZvICYgRFdDM19MSU5LX1NUQVRFX01BU0s7DQo+ICB9DQo+ICANCj4gIHN0YXRpYyB2b2lkIGR3
YzNfZ2FkZ2V0X2xpbmtzdHNfY2hhbmdlX2ludGVycnVwdChzdHJ1Y3QgZHdjMyAqZHdjLA0KPiAt
CQl1bnNpZ25lZCBpbnQgZXZ0aW5mbykNCj4gKwkJZW51bSBkd2MzX2xpbmtfc3RhdGUgbmV4dCkN
Cj4gIHsNCj4gLQllbnVtIGR3YzNfbGlua19zdGF0ZQluZXh0ID0gZXZ0aW5mbyAmIERXQzNfTElO
S19TVEFURV9NQVNLOw0KPiAgCXVuc2lnbmVkIGludAkJcHdyb3B0Ow0KPiAgDQo+ICAJLyoNCj4g
QEAgLTQyMjAsNyArNDIxNiw3IEBAIHN0YXRpYyB2b2lkIGR3YzNfZ2FkZ2V0X2xpbmtzdHNfY2hh
bmdlX2ludGVycnVwdChzdHJ1Y3QgZHdjMyAqZHdjLA0KPiAgCXB3cm9wdCA9IERXQzNfR0hXUEFS
QU1TMV9FTl9QV1JPUFQoZHdjLT5od3BhcmFtcy5od3BhcmFtczEpOw0KPiAgCWlmIChEV0MzX1ZF
Ul9JU19QUklPUihEV0MzLCAyNTBBKSAmJg0KPiAgCQkJKHB3cm9wdCAhPSBEV0MzX0dIV1BBUkFN
UzFfRU5fUFdST1BUX0hJQikpIHsNCj4gLQkJaWYgKChkd2MtPmxpbmtfc3RhdGUgPT0gRFdDM19M
SU5LX1NUQVRFX1UzKSAmJg0KPiArCQlpZiAoKGR3Yy0+b2xkX2xpbmtfc3RhdGUgPT0gRFdDM19M
SU5LX1NUQVRFX1UzKSAmJg0KPiAgCQkJCShuZXh0ID09IERXQzNfTElOS19TVEFURV9SRVNVTUUp
KSB7DQo+ICAJCQlyZXR1cm47DQo+ICAJCX0NCj4gQEAgLTQyNDksNyArNDI0NSw3IEBAIHN0YXRp
YyB2b2lkIGR3YzNfZ2FkZ2V0X2xpbmtzdHNfY2hhbmdlX2ludGVycnVwdChzdHJ1Y3QgZHdjMyAq
ZHdjLA0KPiAgCQkJdTMyCXUxdTI7DQo+ICAJCQl1MzIJcmVnOw0KPiAgDQo+IC0JCQlzd2l0Y2gg
KGR3Yy0+bGlua19zdGF0ZSkgew0KPiArCQkJc3dpdGNoIChkd2MtPm9sZF9saW5rX3N0YXRlKSB7
DQo+ICAJCQljYXNlIERXQzNfTElOS19TVEFURV9VMToNCj4gIAkJCWNhc2UgRFdDM19MSU5LX1NU
QVRFX1UyOg0KPiAgCQkJCXJlZyA9IGR3YzNfcmVhZGwoZHdjLT5yZWdzLCBEV0MzX0RDVEwpOw0K
PiBAQCAtNDI5NSwyMyArNDI5MSwzNCBAQCBzdGF0aWMgdm9pZCBkd2MzX2dhZGdldF9saW5rc3Rz
X2NoYW5nZV9pbnRlcnJ1cHQoc3RydWN0IGR3YzMgKmR3YywNCj4gIAkJYnJlYWs7DQo+ICAJfQ0K
PiAgDQo+IC0JZHdjLT5saW5rX3N0YXRlID0gbmV4dDsNCj4gKwlkd2MtPm9sZF9saW5rX3N0YXRl
ID0gbmV4dDsNCj4gIH0NCj4gIA0KPiAtc3RhdGljIHZvaWQgZHdjM19nYWRnZXRfc3VzcGVuZF9p
bnRlcnJ1cHQoc3RydWN0IGR3YzMgKmR3YywNCj4gLQkJCQkJICB1bnNpZ25lZCBpbnQgZXZ0aW5m
bykNCj4gK3N0YXRpYyB2b2lkIGR3YzNfZ2FkZ2V0X3N1c3BlbmRfaW50ZXJydXB0KHN0cnVjdCBk
d2MzICpkd2MpDQo+ICB7DQo+IC0JZW51bSBkd2MzX2xpbmtfc3RhdGUgbmV4dCA9IGV2dGluZm8g
JiBEV0MzX0xJTktfU1RBVEVfTUFTSzsNCj4gLQ0KPiAtCWlmIChkd2MtPmxpbmtfc3RhdGUgIT0g
bmV4dCAmJiBuZXh0ID09IERXQzNfTElOS19TVEFURV9VMykNCj4gKwlpZiAoIWR3Yy0+c3VzcGVu
ZGVkKSB7DQo+ICsJCWR3Yy0+c3VzcGVuZGVkID0gdHJ1ZTsNCj4gIAkJZHdjM19zdXNwZW5kX2dh
ZGdldChkd2MpOw0KPiArCX0NCj4gK30NCj4gIA0KPiAtCWR3Yy0+bGlua19zdGF0ZSA9IG5leHQ7
DQo+ICtzdGF0aWMgaW5saW5lIHZvaWQgZHdjM19nYWRnZXRfaW50ZXJydXB0X2Vhcmx5KHN0cnVj
dCBkd2MzICpkd2MsDQo+ICsJCQljb25zdCBzdHJ1Y3QgZHdjM19ldmVudF9kZXZ0ICpldmVudCkN
Cj4gK3sNCj4gKwlkd2MtPmxpbmtfc3RhdGUgPSBldmVudC0+ZXZlbnRfaW5mbyAmIERXQzNfTElO
S19TVEFURV9NQVNLOw0KPiArDQo+ICsJaWYgKGV2ZW50LT50eXBlICE9IERXQzNfREVWSUNFX0VW
RU5UX0xJTktfU1RBVFVTX0NIQU5HRSkNCj4gKwkJZHdjLT5vbGRfbGlua19zdGF0ZSA9IGR3Yy0+
bGlua19zdGF0ZTsNCj4gKw0KPiArCWlmICAoZXZlbnQtPnR5cGUgIT0gRFdDM19ERVZJQ0VfRVZF
TlRfU1VTUEVORCkNCj4gKwkJZHdjLT5zdXNwZW5kZWQgPSBmYWxzZTsNCj4gIH0NCj4gIA0KPiAg
c3RhdGljIHZvaWQgZHdjM19nYWRnZXRfaW50ZXJydXB0KHN0cnVjdCBkd2MzICpkd2MsDQo+ICAJ
CWNvbnN0IHN0cnVjdCBkd2MzX2V2ZW50X2RldnQgKmV2ZW50KQ0KPiAgew0KPiArCWR3YzNfZ2Fk
Z2V0X2ludGVycnVwdF9lYXJseShkd2MsIGV2ZW50KTsNCj4gKw0KDQpXaGF0J3MgZHdjLT5saW5r
X3N0YXRlIGN1cnJlbnQgdXNlIGNhc2UgaGVyZT8gV2UncmUgbm90IHVzaW5nIGl0IGZvcg0KeW91
ciBmaXggcmlnaHQ/IFdoeSBkbyB3ZSBjaGFuZ2UgaG93IGl0J3MgdXBkYXRlZCBub3c/DQoNClRo
YW5rcywNClRoaW5oDQoNCj4gIAlzd2l0Y2ggKGV2ZW50LT50eXBlKSB7DQo+ICAJY2FzZSBEV0Mz
X0RFVklDRV9FVkVOVF9ESVNDT05ORUNUOg0KPiAgCQlkd2MzX2dhZGdldF9kaXNjb25uZWN0X2lu
dGVycnVwdChkd2MpOw0KPiBAQCAtNDMyMywxOCArNDMzMCwxOCBAQCBzdGF0aWMgdm9pZCBkd2Mz
X2dhZGdldF9pbnRlcnJ1cHQoc3RydWN0IGR3YzMgKmR3YywNCj4gIAkJZHdjM19nYWRnZXRfY29u
bmRvbmVfaW50ZXJydXB0KGR3Yyk7DQo+ICAJCWJyZWFrOw0KPiAgCWNhc2UgRFdDM19ERVZJQ0Vf
RVZFTlRfV0FLRVVQOg0KPiAtCQlkd2MzX2dhZGdldF93YWtldXBfaW50ZXJydXB0KGR3YywgZXZl
bnQtPmV2ZW50X2luZm8pOw0KPiArCQlkd2MzX2dhZGdldF93YWtldXBfaW50ZXJydXB0KGR3Yyk7
DQo+ICAJCWJyZWFrOw0KPiAgCWNhc2UgRFdDM19ERVZJQ0VfRVZFTlRfSElCRVJfUkVROg0KPiAg
CQlkZXZfV0FSTl9PTkNFKGR3Yy0+ZGV2LCB0cnVlLCAidW5leHBlY3RlZCBoaWJlcm5hdGlvbiBl
dmVudFxuIik7DQo+ICAJCWJyZWFrOw0KPiAgCWNhc2UgRFdDM19ERVZJQ0VfRVZFTlRfTElOS19T
VEFUVVNfQ0hBTkdFOg0KPiAtCQlkd2MzX2dhZGdldF9saW5rc3RzX2NoYW5nZV9pbnRlcnJ1cHQo
ZHdjLCBldmVudC0+ZXZlbnRfaW5mbyk7DQo+ICsJCWR3YzNfZ2FkZ2V0X2xpbmtzdHNfY2hhbmdl
X2ludGVycnVwdChkd2MsIGR3Yy0+bGlua19zdGF0ZSk7DQo+ICAJCWJyZWFrOw0KPiAgCWNhc2Ug
RFdDM19ERVZJQ0VfRVZFTlRfU1VTUEVORDoNCj4gIAkJLyogSXQgY2hhbmdlZCB0byBiZSBzdXNw
ZW5kIGV2ZW50IGZvciB2ZXJzaW9uIDIuMzBhIGFuZCBhYm92ZSAqLw0KPiAgCQlpZiAoIURXQzNf
VkVSX0lTX1BSSU9SKERXQzMsIDIzMEEpKQ0KPiAtCQkJZHdjM19nYWRnZXRfc3VzcGVuZF9pbnRl
cnJ1cHQoZHdjLCBldmVudC0+ZXZlbnRfaW5mbyk7DQo+ICsJCQlkd2MzX2dhZGdldF9zdXNwZW5k
X2ludGVycnVwdChkd2MpOw0KPiAgCQlicmVhazsNCj4gIAljYXNlIERXQzNfREVWSUNFX0VWRU5U
X1NPRjoNCj4gIAljYXNlIERXQzNfREVWSUNFX0VWRU5UX0VSUkFUSUNfRVJST1I6DQo+IC0tIA0K
PiAyLjcuNA0KPiA=
