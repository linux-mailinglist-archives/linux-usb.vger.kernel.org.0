Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 384E7634D93
	for <lists+linux-usb@lfdr.de>; Wed, 23 Nov 2022 03:07:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235390AbiKWCHF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Nov 2022 21:07:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235324AbiKWCHE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Nov 2022 21:07:04 -0500
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D94968DA60
        for <linux-usb@vger.kernel.org>; Tue, 22 Nov 2022 18:07:02 -0800 (PST)
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AMLsAgi018814;
        Tue, 22 Nov 2022 18:07:00 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=gMWR1LnxKBjQgDFXRDht53k+8EasGkbfk5vOCFrhlg0=;
 b=iYgDJE37cKoqWxY1PlEi6eiots2Mpg9krPZ8uRTDpUVBVIjFerJ7Io6+uAdPiPPzQXbw
 yA6jB3emGJK9uQIVYYSQcCnLZRsiCY/Sq0jChClsd/bIgucxPJ9tx+FQ8ODvB4xc12ac
 vK+8qZCRQpZq3tdFddbSn0rky+NFLw9BBpTWmy2sKgyeMmiu1YcCsZYrczoxS+WrWFE6
 NhNjhBirvUQCihoeSvTcQ1fjCH2aA06i/aZbikff8Xz8bW/L7GgEiYV1GAZIejDx+qJs
 n2WahXXT1qGuFOJytB94CW8eJqHgw+NWrocInrEwzglM+PtI9Q/cjM0V0ipOFiNDnDIF 4w== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3kxypnqxjm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 22 Nov 2022 18:06:59 -0800
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id EBF6F40094;
        Wed, 23 Nov 2022 02:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1669169219; bh=gMWR1LnxKBjQgDFXRDht53k+8EasGkbfk5vOCFrhlg0=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=IreXh/h8e821iMZAe8k1KX6eINHln698NH9NRjKbbNWF/WIAFFV145eKt10DfKyzr
         gBg9MVlJGkM9870fBkZROAW7lebgQkxvFfWSkCe2jjtym6+7CQS//Yj/4Sn14gwgDM
         qrEA5V59DYr6HLIhV1107n8IqtcD/JCOYDzLpZ9NyDXlAcGy6ugf6Fsf8z5hQnyfDL
         cNHY6GPaXQf0TUNVs3RqiO97O14ylG8NIZLTiu9iuvcUPK4AEYfKPzk7YXUkgJtk9a
         wHTz/R1ks90EA3tvPsmYnEoirZEqyOOQE+FVO3jwacCrFHfVpYFNw2EkkO3HccvcjQ
         xXTqcZVzCKnkg==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 66A4FA0067;
        Wed, 23 Nov 2022 02:06:58 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 764D5800AA;
        Wed, 23 Nov 2022 02:06:57 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="bOKJtSs4";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e7ox9eBc98qKDOMjYl9aAxEew7Sa+vJW3Gs/X3ATONY1IH2fOkVvz1eQMdxiPhW2KpHSngsyJEyByIH+GO9F17XKaLv47EwJejUc4QA0Y0R6wzaUhwjLfyIn/8rOMXltz2c5UEdXpdBwTAfBbmMChG0YIbYxJQNpM6yaGnkh/603dhl/DFzPF1l2x9FsbRYYYbe7Br6h/Pey3AhgRWWCWADgcZANe4zoM0fApWUHEAJ0KxywisCraNYEHJqWLHJhLpQOQmUM/cmAWsDQkITdL19XCLvV0w9cl7rhG0dwL355KZaHhTmPEzBn8+5JtBYWWvDpKGCftLl8DXfpPf1jpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gMWR1LnxKBjQgDFXRDht53k+8EasGkbfk5vOCFrhlg0=;
 b=QkskdYVpsiKx1HW5h6bmh+yDdPgJKIVGw73UstPW3GZBQfIJz1TZtU8CblEwb4R1qJnlq7Satu+2CqEg5KAJyxXDnxQA7L6BBUBYH4aet0G9n4Rz7OEFUBD3+sQQ3WAZKeTfjtx7oY/ySiAJettPTqF7j6bJq8oj/kkOLVAgmaXD6mHeGjbH1vxuLqZWB+m/A7HxNNQEHf+jk6D8Tc5d7Q0EGHG/a+AtQ743Ynlge8dYopHwi8+96rFOzMAbSI/krT5LQ7/ekqqyUFTlVxV1niIo6SMl3aCc1+Bl72EG0LYQ9UaxCb1Qeyd2dwYo3NCnSmE4zM+7SO39An3s9Oxbbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gMWR1LnxKBjQgDFXRDht53k+8EasGkbfk5vOCFrhlg0=;
 b=bOKJtSs4ZKplXCycuz2CHzhkJLuEujCDRrB+vUhKgGF820ZaN147dYWwMW7v3x2dntdEC0kHP84zIjNQdvUPK7tX3L43sDVuf6Zz+16CW0D81zsyCysgX3Rn4NgP5/SAXxcg3cwfOHPH/LvzxRFCAByu5rkEk90EMOrQeNSCFpA=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by CH3PR12MB7618.namprd12.prod.outlook.com (2603:10b6:610:14c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Wed, 23 Nov
 2022 02:06:54 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::e395:902b:2e90:b7ee]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::e395:902b:2e90:b7ee%4]) with mapi id 15.20.5834.011; Wed, 23 Nov 2022
 02:06:54 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Udipto Goswami <quic_ugoswami@quicinc.com>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jack Pham <quic_jackp@quicinc.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Subject: Re: [PATCH] usb: dwc3: ep0: Add implementation of ep0_dequeue
 separately
Thread-Topic: [PATCH] usb: dwc3: ep0: Add implementation of ep0_dequeue
 separately
Thread-Index: AQHY+khxkuNi6ALG7k2qI+0H9sR18a5D7tWAgABETQCABfxUgIAAiv2AgAERbAA=
Date:   Wed, 23 Nov 2022 02:06:53 +0000
Message-ID: <20221123020638.bicszpyxdyq37avd@synopsys.com>
References: <20221117054917.30104-1-quic_ugoswami@quicinc.com>
 <20221118020141.fjngcaovttbzkbvv@synopsys.com>
 <93e1a840-6d9f-9a6a-d848-d006f1333d18@quicinc.com>
 <20221122013033.if667zpm2p47he6r@synopsys.com>
 <21de2d7a-1955-c9ea-3d6c-02932d16a379@quicinc.com>
In-Reply-To: <21de2d7a-1955-c9ea-3d6c-02932d16a379@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|CH3PR12MB7618:EE_
x-ms-office365-filtering-correlation-id: d6c8f71f-d667-490a-60c4-08daccf7646a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EzWsIS/mi181D5Jeo9qVbjwWKSE3evJUDKGX3jVMaCHibPJzSMrsTpm8FPPYL26mFZZ9yt5YJWVW9b9dM4CGc3/Jt3CHoxnzx+b2rgMDy9wn0fUTMuq3BF79D8vsfrHI7rvz/A8TNRHQKDr38Dx3l/5V0dzWVQ1gyXndZ+OV9Q9vy9do6kgRztk7vLK63sKRa8sNgGAR6DuTl2Yn8giZZ2jdKp4xHhLTJuYhdzLYLxH80lQCYpM5CvsAk3U7DOdXNG1l0Hkwq/mSFp04maY6D6hooAiCVTW7iXwtmv1mBJou/yPGOyuO2q+o30jpHJ+dETEhOIvtTt2CJJnkiH/CDN56alsfpCWRQdSS+2BDwlqtMZdeovECRbFJgQRBQ1rDOUCn4fULlSo55TMMhn9xwqeHlIsGsGFp+JUBt7u5OXzIGqsZRedgU8dDgFoOB+06wuyyEtqmr7hJlNZNyphaK1mP2L+lED/c4nB7ZqcfsgNzcPTdn6l/o/vX3WFgScw8Hx2rW+eI1oQltrSjNLy18q8MN6kt3NX7twQGBfo41+/wbExv7ecHZAqB48ByC+e9ZDIWHONCJB72/gxuK/JSD9Iy7we0HcihLnhmSn7FBf9cUz707j3qkYlji0Bmjw9zPIH5xgnXY+frkA36CwNxPuBIKf6llILV079Kb+MIvtC/I0kwBbMTUdeOD8iBmh/0dNs5C24rB1CeKFtpwmUGIAphjOj09/BJP0PPFVUCfhA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(396003)(39860400002)(366004)(136003)(376002)(451199015)(6512007)(2616005)(83380400001)(1076003)(53546011)(122000001)(76116006)(64756008)(186003)(26005)(38100700002)(2906002)(5660300002)(6506007)(4326008)(66476007)(6916009)(66556008)(54906003)(6486002)(71200400001)(966005)(8676002)(66946007)(316002)(8936002)(66446008)(478600001)(41300700001)(36756003)(86362001)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WXlOcklSaUJwRGJBNnYwWTFUSExKWXZjY2dZOHJ0L2ZBTGJoTjFVV3ErK3Rj?=
 =?utf-8?B?VzJ3YWNMYzdhVy9xYTY2bXl4cGxSUlZmcmJnbHRFUUpMcEUrNThVbW1KOHRj?=
 =?utf-8?B?RDRXSzFONVNGd1Q4VVZQZG1Sb1RoSEVGNmp2QlZkSUluQVRHZ3NPdFFMazVX?=
 =?utf-8?B?Sk1yZ0xsTGFXaWtFbTRoQUZocHZFSDdSbTV0RlZzN2tDeDNzZm14WStMdTJ4?=
 =?utf-8?B?cnJEenVRVUJCYnJGMUVTeFQyeE9ZNFhjRjI3MThWZFpDbXh0TkRRMnNvb1hm?=
 =?utf-8?B?cVoxaUlyUlFTTExWTUhqaEs3UmVWeXNTV0tIczR4aDNuMTVwK1RJT2IvZ0No?=
 =?utf-8?B?YitxTlo1c2dvSGJYRFd3SGZmWk56RU10eDZIaEpHSGxhaXpSeG95S3BlRFpp?=
 =?utf-8?B?K1NUVndkSk1vSnVrQkVCUENJNEM4elp1cTVzNWtGNEliWjZKMVh5MWlnWDh6?=
 =?utf-8?B?WVkwaHVHNDdFcmJEbGIxekpLTWVxQ3hVaGtlb3dpS2Zrdy9NZS9jYnk5dVFG?=
 =?utf-8?B?OHRncms1VUZZeVFQZWFqQ09pVkJTdzUvUlRzdnhaSjA4c1paTGtHRlB3N3c0?=
 =?utf-8?B?K3lNbDIzNm8yMjA5UDhlclA1Y2REWDdqNFhQb2JkWEUrWlFydUNQekMveDYv?=
 =?utf-8?B?eUhEb3FaUnRlZ3hVQkdra2xvTkhnWm03cVJIMkJPMVlabjJUS1RBcUJOZnNM?=
 =?utf-8?B?RHU4eGRkZ3BXaWxWa2czcXJNcjJqUmw5bGh2SEZNVTlHUmgzMFZrYUFINkRW?=
 =?utf-8?B?RGJJb1VONmFLM0hSSHJuQ0x1SUljSmUvR04xUlBDa1ZKZjU2ZHp2UmFoYWdG?=
 =?utf-8?B?cC9mYXUyODVnTXV3QVZiM0cxTDJDT0lvbFlJY0NsQXJ0bytMNHRNVGhMRlps?=
 =?utf-8?B?Yy9wRE41YXdGangxbzlwOUs1TEFIRU1TMjZvOGgyU3ZNcWRNNTllWmJvWGx4?=
 =?utf-8?B?U3hUb0QrQkFteng4TnE4cXNRUTRtYUpWL1ArMWsrUGozekh3emk3UURjeTEw?=
 =?utf-8?B?MVVwSmtTQzhScDQrYlllWUo2azUyT29lNFVuREUvekIvbjN2a1VpOVIycEVu?=
 =?utf-8?B?aE9LRzR6Nm82RG1lWmYzTXNqb1FJMG16TjU2aFkvOHBMblRmdmZ0Z2VoWEpY?=
 =?utf-8?B?K3A5WFZZNlNnaHV4eXBYV1loRm9DSjI1TXRmSFdUczBmRmtoVFJqcTFwZmJD?=
 =?utf-8?B?aVNTU05hbXZiZEhVZWIwRlVrQlAzeExOL3dFdmMvR1NkNzZNVDFrVXlSOTNv?=
 =?utf-8?B?UjhLMCtucGlmTVZ2dTgvK3ZZaVFLeldCYkpIMUFpS0dMYzdKVlJvY09DQWsw?=
 =?utf-8?B?OTdRYStrclUzNkZVcFBocU9hVEQrMGJYUTFLdjJESEp5TGE4QzRqZEN3cGM1?=
 =?utf-8?B?SHI4dDljYlVHeVArd2tuSm1RRTNGYU1lNUZ0aXhmYzZmNlMvMTNSVlIvTStp?=
 =?utf-8?B?SUFqb0lpZXJTMFVaVlRUaTlVeW5jak1BblBDUzgxNjNrT0JRcWxSNmF6RWhC?=
 =?utf-8?B?STVKUm5wUDc0S2QxUnFCam85U0dFdjc0aHZVdDdDOHpVYXpmZC84Nm4weXVm?=
 =?utf-8?B?aXQyNHFNakxNQWJCbjRUc1dYR2hLNk00VU9Yd2lWb1EvUzhNSUVDTEI5Wjcv?=
 =?utf-8?B?bVJxV2ZpL2hQMmxpUGNTWSsyVFRYUlBxZWxFL0ZkUnlmTnhyN1poUW1ONDdD?=
 =?utf-8?B?V0kyNlhBaFQ3aTZRTW5CTXAyUURoNHNwaHRvdk14Sk1BdUNIaVJkNFRuWFI4?=
 =?utf-8?B?MUtoRHZXS3NKTGJ3UlpXbmJTOTdjRWtLai9OL2FuZ0VYTEZ6cC9qRWp4UHZq?=
 =?utf-8?B?QzExT1o2ODUvVVNWMndoanExbjY3dVptYWQxaVhhdHVrUmhGL3VxMW1QNVox?=
 =?utf-8?B?ejR0RHJEN1RDQ0V1cEVPMVg1bTZHaGVOYVAwMTZnUjdndGxTTDE1OXJMK2hE?=
 =?utf-8?B?aE9kSHRuZk95dGdZMmlVclpiWjluakRYdG94OWtINXBZdG45TWp5SHFnMHcz?=
 =?utf-8?B?SjhhcHZ1bzdINjhRY0RMaEZ3UUtmQzlTckFGREY1blJ2UkpydzEvRjBwdi9p?=
 =?utf-8?B?eUE2Sit3VmVtLzYxTFRrUHJlVkpwUnhMT1YrektwejkvZklheHBBVXNqSzlQ?=
 =?utf-8?Q?9Uu59v/Fw3dJuhOQMyyiTwyaZ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9F799FC2B15EC94397A6984AEC5B6D24@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?c2V2dUN2c3Q4NUQwbHFXcUwvdmFoOWRLd0M3dDEyZDdFL1FFdzlNL2RUdnJp?=
 =?utf-8?B?RWJFRGg5SlNPOFJ0NFEzN0pzOG1UMloyR0ZsMVg0TS9LMDdEQjFMTzhJeHUx?=
 =?utf-8?B?SWU1MkZlNkxWVFN5a1lGWFZhU0NLd2xkMFliTCszbk9xb1psc2MzWHhKUzd4?=
 =?utf-8?B?bzRDSkVjdElkS0t1RG55UlJ5NklMRWhvWThFd2hqWkNlKytSS3cvTGY5WXdZ?=
 =?utf-8?B?WVZSUjVFUDYwU2VSOVNVaDBnTTFKTEZHWEpjTE1KcFBtWVlhYUh5U2p5bmR5?=
 =?utf-8?B?M1Bad2hYc3B5RTBTREt6aEhFSHlDclllZFIySnR4Wm5hTUxURnQ2Rlo1aHhZ?=
 =?utf-8?B?L1c2azFreEJLQVFHZnlsUWV3SmxZZFQ5OHVzMzJQaWFXSHhpeVJNRmMxV2hE?=
 =?utf-8?B?bm94SVBHbytPSnhyaEpXR2lBYzBXOXhRVHhOek5Fdk5YWnJzSmhDY2JzRlRW?=
 =?utf-8?B?a1FSeTNjVWJUbXZXSXNiT3BzN2d5VVRWemUwSmpSUi9oeWdtV1dLeFo5Zk9S?=
 =?utf-8?B?UW4yUG9hWGhiekx2dG92cEpIcVFvQWZIc3JHamNVamFOZUx1MDduQzFienhP?=
 =?utf-8?B?dUNZOFhtMnl2QkNVbkFhMENXd0RSZTVaSWdyQ01yNlZtdmx3blo1amtrYnRk?=
 =?utf-8?B?TmtmYUg5SXdTV3hPUnpMRTZjbFEvTkFHRW8wZ2JYTFFKRnJrdmROSGlVUm9q?=
 =?utf-8?B?OFlXazJzYVUyanpKOFZ3SHk4dW50VzBKM1RhSHN6MEZZN3FZc0FHSmRneGFG?=
 =?utf-8?B?ejkyeDRsMVFnWEpyZFdmZDRWRDdwRjBPS2E2UEp0bmFzNFhZT3p4U2xkTERX?=
 =?utf-8?B?clhjYjJsWExqbGVCUGJ1cERvZDdFblFNSUppZFZMYlJkODA2T1RiWG1RcFhW?=
 =?utf-8?B?cVNoWU1GbXo2bG1kcmh4MGRRZzRKanFncW5SOURCVnc5U2l1UVNBcHJlL3hG?=
 =?utf-8?B?ZXB1bzNNSTRGejIrYTlEZTYxREQ0emtYYzVkbU9sc1h4WnJ3d1JkOVNiMUNC?=
 =?utf-8?B?YmV4N2VoTjcrWk5CeHJtZi9ZTStEaXV2b3dSNUhPbHRDUFVRSyt1bTZJdjAy?=
 =?utf-8?B?Q2xKdXJlQmhOd2lMeUFyOE92Y1p0YWxnYzVKNmxSdmRlWEtpUWlwajNqTTM0?=
 =?utf-8?B?eTRzVmYxcTczNlhxelRlVnIrdVFTU2ovR3N1SzV4dHg2Q0l4RGVOaU1pTy9z?=
 =?utf-8?B?QXFuamhSaU95a1gxWkFkejdKZWtXVWR2QnIvdHVJQmdIbkVaR2Z3NnFJN213?=
 =?utf-8?B?eEcyK2d6TFJIN0tvZ3BIMnUwZ25Zd2ZhTGl6YXJ6b0VGa2t3T2ZjaXROOFNE?=
 =?utf-8?Q?zgWKWcGmPfcE4=3D?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6c8f71f-d667-490a-60c4-08daccf7646a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2022 02:06:53.9403
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DBsJmcoEzKwktCGR17D+qRGzmIIIIpqBbF5sSQeLX8N4agSroAGPvfdlnJoroj8A3gH8igETFeyIGJuXiOIC/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7618
X-Proofpoint-GUID: lXm_iri3gpWgNIvrjbB94qQbGOd2YyPc
X-Proofpoint-ORIG-GUID: lXm_iri3gpWgNIvrjbB94qQbGOd2YyPc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-22_13,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 adultscore=0 mlxscore=0
 priorityscore=1501 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211230014
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVHVlLCBOb3YgMjIsIDIwMjIsIFVkaXB0byBHb3N3YW1pIHdyb3RlOg0KPiBIaSBUaGluaCwN
Cj4gDQo+IA0KPiBPbiAxMS8yMi8yMiA3OjAwIEFNLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4g
SGkgVWRpcHRvLA0KPiA+IA0KPiA+IE9uIEZyaSwgTm92IDE4LCAyMDIyLCBVZGlwdG8gR29zd2Ft
aSB3cm90ZToNCj4gPiA+IEhpIFRoaW5oDQo+ID4gPiANCj4gPiA+IE9uIDExLzE4LzIyIDc6MzEg
QU0sIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gPiA+ID4gT24gVGh1LCBOb3YgMTcsIDIwMjIsIFVk
aXB0byBHb3N3YW1pIHdyb3RlOg0KPiA+ID4gPiA+IEEgZGVxdWV1ZSBmb3IgZXAwIG5lZWQgdG8g
YWRqdXN0IHRoZSBoYW5kbGluZyBiYXNlZCBvbiB0aGUNCj4gPiA+ID4gPiBkYXRhIHN0YWdlIGFu
ZCBzdGF0dXMgc3RhZ2UuIEN1cnJlbnRseSBpZiBlcDAgaXMgaW4gZGF0YS9zdGF0dXMNCj4gPiA+
ID4gPiBzdGFnZSB0aGUgaGFuZGxpbmcgaXNuJ3QgdGhhdCBkaWZmZXJlbnQsIGRyaXZlciB3aWxs
IHRyeSBnaXZlYmFjaw0KPiA+ID4gPiA+IGFzIHBhcnQgb2YgZGVxdWV1ZSBwcm9jZXNzIHdoaWNo
IG1pZ2h0IHBvdGVudGlhbGx5IGxlYWQgdG8gdGhlDQo+ID4gPiA+ID4gY29udHJvbGxlciBhY2Nl
c3NpbmcgaW52YWxpZCB0cmJzLg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IEFsc28gZm9yIGVwMCB0
aGUgcmVxdWVzdHMgYXJlbid0IG1vdmVkIGludG8gdGhlIHN0YXJ0ZWRfbGlzdCwNCj4gPiA+ID4g
PiB3aGljaCBtaWdodCBwb3RlbnRpYWxseSBsZWFkIHRvIHRoZSB1bi1tYXBwaW5nIG9mIHRoZSBy
ZXF1ZXN0DQo+ID4gPiA+ID4gYnVmZmVycyB3aXRob3V0IHNlbmRpbmcgZW5keGZlci4NCj4gPiA+
ID4gDQo+ID4gPiA+IE1heWJlIHdlIG5lZWQgdG8gdHJhY2sgc3RhcnRlZF9saXN0IGZvciBjb250
cm9sIGVuZHBvaW50PyBJZiB0aGUgcmVxdWVzdA0KPiA+ID4gPiBpc24ndCBwcmVwYXJlZCB5ZXQg
b3IgdGhhdCB0aGUgdHJhbnNmZXIgaGFkIGNvbXBsZXRlZCwgdGhlbiB0aGVyZSdzIG5vDQo+ID4g
PiA+IG5lZWQgdG8gaXNzdWUgRW5kIFRyYW5mZXIgY29tbWFuZC4NCj4gPiA+ID4gDQo+ID4gPiA+
IEJ1dCBJIGJlbGlldmUgc2VuZGluZyBFbmQgVHJhbnNmZXIgZm9yIGluYWN0aXZlIGVuZHBvaW50
IHNob3VsZCBiZSBmaW5lDQo+ID4gPiA+IGFsc28uIFRoZW4gd2UgbWF5YmUgYWJsZSB0byBnZXQg
YXdheSB3aXRob3V0IGNoZWNraW5nIHRoZSBzdGFydGVkIGxpc3QuDQo+ID4gPiA+IElmIHlvdSdy
ZSBwbGFubmluZyB0byBkbyB0aGF0LCBwbGVhc2UgdGVzdCBhbmQgbm90ZSBpdCBzb21ld2hlcmUu
DQo+ID4gPiA+IA0KPiA+ID4gPiA+IA0KPiA+ID4gdGhhbmtzIGZvciB0aGUgc3VnZ2VzdGlvbiwg
c3VyZSBpJ2xsIGRvIHNvbWUgbW9yZSBleHBlcmltZW50cyBhbmQgY29uZmlybQ0KPiA+ID4gaXQu
DQo+ID4gPiANCj4gPiANCj4gPiBKdXN0IGN1cmlvdXMsIGhvdyBkbyB5b3UgaGl0L3Rlc3QgdGhp
cyBzY2VuYXJpbz8NCj4gPiANCj4gPiBGb3Igb3RoZXIgZW5kcG9pbnQgdHlwZXMsIEkgY2FuIHNl
ZSBwb3NzaWJsZSBzY2VuYXJpb3Mgd2hlcmUgYSBkZXF1ZXVlDQo+ID4gbWF5IGJlIG5lZWRlZCwg
YnV0IEkgZG9uJ3Qgc2VlIG9uZSBmb3IgY29udHJvbCB0cmFuc2Zlci4NCj4gPiANCj4gPiBUaGUg
aG9zdCBjYW4gY2FuY2VsIHRoZSBjb250cm9sIHRyYW5zZmVyLCBhbmQgdGhlIGNvbnRyb2xsZXIg
d2lsbCBzZWUNCj4gPiAic2V0dXBfcGFja2V0X3BlbmRpbmciIGFuZCBoYW5kbGUgYWNjb3JkaW5n
bHkuIElmIHRoZXJlJ3MgYSBkaXNjb25uZWN0LA0KPiA+IHRoYXQncyBhbHNvIGhhbmRsZWQgc2Vw
YXJhdGVseSBieSB0aGUgY29udHJvbGxlciBkcml2ZXIgYWxzby4gU28sIHdoZXJlDQo+ID4gZG9l
cyBlcDBfZGVxdWV1ZSBjb21lIGludG8gcGxheSBoZXJlPw0KPiA+IA0KPiBhZGRpbmcgdGhlIHJl
ZmVyZW5jZSB0byBvdGhlciB0aHJlYWQgWzFdDQo+IA0KPiBbMV06IGh0dHBzOi8vdXJsZGVmZW5z
ZS5jb20vdjMvX19odHRwczovL3d3dy5zcGluaWNzLm5ldC9saXN0cy9saW51eC11c2IvbXNnMjMz
ODYyLmh0bWxfXzshIUE0RjJSOUdfcGchWjZoc0FydExmZXFtYWYwOElxeFRvdjVWeVhkdkxKdW5j
Yjh3SVhZSEM1UFc3Wms3V082dV9yOEFwMWdSLVRscm16d21RRVEtY0pFbFEyRURfMGRlTTh0NDll
bWNqdyQNCj4gDQo+IHdhcyB0cnlpbmcgdG8gYWRkcmVzcyBhIHJhY2UgY29uZGl0aW9uIGluIHRo
ZSBmZnMgZHJpdmVyIHdoZXJlIGVwX2RlcXVldWUNCj4gd2FzIHN1Z2dlc3RlZCwgYmVmb3JlIGZy
ZWVpbmcgdGhlIHJlcXVlc3QgZGVxdWV1ZSBpdC4NCj4gDQo+IGFzIHBlciB0aGUgY3VycmVudCBj
b2RlLCBzaW5jZSBlcDAgcmVxIGlzbid0IG1vdmVkIHRvIHN0YXJ0ZWQgbGlzdA0KPiB0aGVyZWZv
cmUgaXQgd2lsbCBleGl0IGZyb20gdGhpcyBpbiBlcF9kZXF1ZXVlOg0KPiANCj4gbGlzdF9mb3Jf
ZWFjaF9lbnRyeShyLCAmZGVwLT5wZW5kaW5nX2xpc3QsIGxpc3QpIHsNCj4gICAgICAgICAgICAg
ICAgICAgIGlmIChyID09IHJlcSkgew0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICBkd2Mz
X2dhZGdldF9naXZlYmFjayhkZXAsIHJlcSwgLUVDT05OUkVTRVQpOw0KPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgZ290byBvdXQ7DQo+ICAgICAgICAgICAgICAgICAgICAgfQ0KPiAgICAg
ICAgICAgICB9DQo+IA0KPiBidXQgaWYgdGhlIGVwMCBpcyBpbiBkYXRhL3N0YXR1cyBwaGFzZSB0
ZWNobmljYWxseSBpdCBpcyBzdGlsbCBhY3RpdmUuDQo+IFdlIHdpbGwgdW5tYXAgdGhlIGJ1ZmZl
ciBhbmQgZ2l2ZWJhY2sgdGhlbiB0aGUgZXAwIGlzIGluIGRhdGEvc3RhdHVzIHN0YWdlLg0KPiAN
Cj4gVGhpcyBjb3VsZCBwb3RlbnRpYWxseSBoYXBwZW4gcmlnaHQ/DQo+IA0KPiBUaGUgaW50ZW50
IG9mIGEgc2VwYXJhdGUgZGVxdWV1ZSB3YXMgdG8gYWRkcmVzcyB0aGF0IHNjZW5hcmlvIHdoZW4g
dGhlDQo+IGRhdGEvc3RhdHVzIHBoYXNlIGlzbid0IGNvbXBsZXRlZC4NCj4gSG9wZSB0aGlzIGdp
dmUgc29tZSBjbGFyaXR5Lg0KPiANCg0KSSdtIHN0aWxsIHVuY2xlYXIgaG93IGl0IGNhbiBsZWFk
IHRvIHRoaXMgY29uZGl0aW9uLiBDYW4geW91IGxpc3QgdGhlDQpzZXF1ZW5jZSBvZiBldmVudHMg
dGhhdCBjYW4gbGVhZCB0byB0aGlzIHNjZW5hcmlvLg0KDQpGb3IgZnVuY3Rpb25mc191bmJpbmQo
KSB0byBvY2N1ciwgc2hvdWxkbid0IHRoZXJlIGJlIGEgZGlzY29ubmVjdCBjYWxsLA0KdHJpZ2dl
cmluZyBzb2Z0LWRpc2Nvbm5lY3Q/IFdoZW4gdGhhdCBoYXBwZW5zLCB0aGVyZSBhcmUgY2hlY2tz
IGluIGR3YzMNCnRvIGVuc3VyZSB0aGF0IGFueSBwZW5kaW5nIGNvbnRyb2wgdHJhbnNmZXIgd2ls
bCBiZSBTVEFMTGVkIGFuZCBnaXZlbg0KYmFjay4gQW55IG5ldyBjb250cm9sIHJlcXVlc3Qgd2ls
bCBub3QgYmUgcXVldWVkLCBhbmQgbm8gYWN0aXZlIGNvbnRyb2wNCnRyYW5zZmVyIHNob3VsZCBo
YXBwZW4gYXQgdGhpcyBwb2ludC4NCg0KVGhhbmtzLA0KVGhpbmgNCg==
