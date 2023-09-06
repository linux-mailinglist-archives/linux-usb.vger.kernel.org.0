Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9705E7946CA
	for <lists+linux-usb@lfdr.de>; Thu,  7 Sep 2023 01:05:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233998AbjIFXFj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Sep 2023 19:05:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232142AbjIFXFj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 Sep 2023 19:05:39 -0400
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D214E7C
        for <linux-usb@vger.kernel.org>; Wed,  6 Sep 2023 16:05:35 -0700 (PDT)
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 386IGQXG025949;
        Wed, 6 Sep 2023 16:05:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=7yLmadyGGsbjOppTECS1HJ9EYR0VB4G8IYWcog0cPVo=;
 b=SdOfeXXPcNfd3AFpeuHoUUSkTurgFNryLfCUrEYSSGBUkiA24hC5RdfWHjYRPNcs4jas
 Lh+Fb5580PJGx7wO/tEXOezueCPTG0Yz81e1Pkx0hEt8Rmrs0NX+BAxZdSFVn7Nz3iQj
 nz2/rx1Rc7ADkZMtb1ybSPdNz1CiSCJF4N8DFz/5S0u2P3wTn4Ws4+uDH7XWLKjEurBQ
 s/axm3wRQmh7hDFUGuXMhJkSzKS8iX7svb+cW7wSEtNpLO04jgSUgJtVHHlF1iTWFEQV
 3qPUHkUmMbvfd7B6VBKYAaMiVxbwFM0mNEYT7m3cXsBhg3McSKvtpb56UeBIcgj/0Wbe +g== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3sv42mu9ym-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 06 Sep 2023 16:05:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1694041529; bh=7yLmadyGGsbjOppTECS1HJ9EYR0VB4G8IYWcog0cPVo=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=QXp4geuhlWqDAEKZ1tyvRK22y/B4N1cioCOBgulW9RzzblEQ6Gu2Kr2y4/HrBQPRh
         +7Jyi4UfkgLBSAsQ4owdTR/MQKCPWK4uyOh34R8xLmj8tR/cbBdLP2w+6wMB6RXKEj
         bUSadli/7IOdYoQXvYSktssPy9xrBh8rv0vnS0/CkXbqY+IcqVe/u/ejFsoj01kJ5b
         5j3iRDRnpVSv9k9+WzTm49XEwTXeS4OUYU2h/eCVURXg3lsU4szvQ363zo7MHvAHLX
         skQkvTYYNZw9jGpC2LmJ+35ka4cxTYMfuF6+7r+3SMUsHqMelF0eMs6JqvIXq4uoaO
         C5P2TIqWsTyKg==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E4A404012B;
        Wed,  6 Sep 2023 23:05:28 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 68D37A008A;
        Wed,  6 Sep 2023 23:05:25 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=REx1gAtY;
        dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 1469240145;
        Wed,  6 Sep 2023 23:05:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mqul2JAHpMZ2OFWF1MSC2Vq7491gU4UJ39+TFAmeUbu4cubMxkGJ5Iivbk6njPAVDC48MgN1v3Cgn1AIaOTMnCwnh8Qfk5rMYGrCaDl9KGzw+FxM8XGfsHhjiiTcfDgfwbbSUvQ1R1Zuwcnw/lLPMENproL7VI2gVQ4g1t3o32+xyWFWk9E1VFtifYtNVhcjEJysRlGnwqC6Edetj5g0atnqNrsAcg46fhmOdc58l5QgFfte27z2WUChunka0p3gS4PJ2V2t/0MI0wfSoBc5MZDEJ8DfvBgjmz2WFit8un2K5Y71LdaxCfzs+sJn5IFCOqUykuiNdMsovQfXJtlyrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7yLmadyGGsbjOppTECS1HJ9EYR0VB4G8IYWcog0cPVo=;
 b=ekDAfWnRqiSaeYVdZGcPtiGHgtbsJY9fskmvkSsXh5edwkOvd1LZ7bSYxzK3fT+bd723iTCbegwuN7Ym27xWJxDLzNe4wflUJ00EfQWbn7CCTuJyvPzNfg8pxW5kJGF6AjtOdXpcZ4/Es4RlSIHop8kZPUafZdTI94nw0N/6jOfayNJZhdurq/Y2Rw2bgxqhW0L5sshQh4oj8PcaHh+HLqzBjiz4NayG3NjsLR9OiIyXxW/NY5mNpJzUL2lRixIVIdVQtTSCM4wH/yB5Xd65CYYxncAFfHEfju6Nej8OzLpCky70tqPJtTDyFzbL6nVsMCyCUc6tSZuVXmYupwpO+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7yLmadyGGsbjOppTECS1HJ9EYR0VB4G8IYWcog0cPVo=;
 b=REx1gAtYYu9SyEluhpci2+wto6j5sMF9Rz3jZ2QMe2Lw2u9wcvj+/VbZKx2z3a9i61nlIO+DRodH0ZLH5wQYcj2SS2/3ANwgLg7MzETJGboYdWJPNzueDLXgOz0e1MAeTgXwXaa3444+fEro72PtAHvk774xq2EHlnUB3Q0pas0=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by DM6PR12MB4124.namprd12.prod.outlook.com (2603:10b6:5:221::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.36; Wed, 6 Sep
 2023 23:05:22 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::548c:ae3:537f:ca2f]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::548c:ae3:537f:ca2f%5]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 23:05:21 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Michael Grzeschik <mgr@pengutronix.de>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: DWC3-Gadget: Flickering with ISOC Streaming (UVC) while
 multiplier set on Superspeed
Thread-Topic: DWC3-Gadget: Flickering with ISOC Streaming (UVC) while
 multiplier set on Superspeed
Thread-Index: AQHZ3FhJKJr5gUY68kuSvYhFApjTyLAFL1EAgASHkoCAA0Y9AIAAbtcAgAEIgwA=
Date:   Wed, 6 Sep 2023 23:05:21 +0000
Message-ID: <20230906230510.vi7d4wnjeiapgtyk@synopsys.com>
References: <20230831221242.GC20651@pengutronix.de>
 <20230901013118.iqpegkklfswdkoqc@synopsys.com>
 <ZPULnRSVgd5S3Cao@pengutronix.de>
 <20230906004144.4igr4akglxxqahc3@synopsys.com>
 <ZPgnwlOV1XP82kAY@pengutronix.de>
In-Reply-To: <ZPgnwlOV1XP82kAY@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|DM6PR12MB4124:EE_
x-ms-office365-filtering-correlation-id: a696f07c-2400-4485-783d-08dbaf2dbeee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zq3B+BximqC5HikD7YuYtWXQ0sPvBbzebmDEbF09W4WutDZY3OV8M3WvEC5ey65l189lSVPNNVy90D8UIAq+GB8obSCJcXbu4X15wtQLvoliaE/cF6mmsUWeO5xDwUq+NlWuNYZXLkhY8969ZU2IcqIdWntju7l4rqeb9PeSKv2RwKU1DtkkLPzrrFJscFkr2MuCmHvyCHosnSRBNITquLrroCLqmhUxPguDVAsz3zhIHPMyxiTpAKjcTs4urJOSGIcr/mgEMekpFtFDJGeRYvdAJCpfliOXP08s9zqYrmYFlz9YbEEIk2DobjijRqD17ZSMNlEyhID1cdwQy4HLdC0ktHI5C//a90DHAD8spJropcXGEwYXecTqEgtT8Omeg7hL3Ihq3+YK9fFvt4b/4GFVwErTrTuEt787ZZa75tqdfgf27unIuwrfQyACXRWJdRsDKPuhmU/8wA/iaVfJw1sYuHENMoYmZpol6WtrrIqlHsJldZ3qTrQvT01zH1v7jcUbKMCc2oDZCveYblZ7OH1Ym/wSymQc2EXcXAKrlBaMzuwUR5d85xe+i0xTdkhXmTjmBX2aFdTBTubX52R5nu+CJUnx95vvhq0QDeXsTZph/JuZzPcKDi6uiRhTvvr3
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(39860400002)(366004)(396003)(376002)(186009)(1800799009)(451199024)(122000001)(2616005)(38100700002)(26005)(38070700005)(1076003)(6486002)(6506007)(6512007)(36756003)(83380400001)(4326008)(478600001)(66446008)(8676002)(4744005)(8936002)(66946007)(66556008)(76116006)(5660300002)(66476007)(64756008)(86362001)(6916009)(54906003)(316002)(71200400001)(2906002)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bHZUdGF3UUNudlN3YUYrUUtPOCtZc0tVYzJvcC9FbkZwUFZoWG4zZHdBMGd0?=
 =?utf-8?B?ZWRDcERGbnM4bXN2WWlIUEFCVGhFWFFaR0NHVWVQZGlmQkJpMm5Qb2xTNmFL?=
 =?utf-8?B?VjM3V09VY0xuK3JPOHBUSzM3bG5oUHV1RUMyUnVkaWlwbEZwSVJER05NWXRU?=
 =?utf-8?B?WlpZSGxQUm0rUCtlOUVNM0ZqcHUzdDhIbzNTMVgzaWFGeUtQN3NveHptMnFq?=
 =?utf-8?B?N2wrSVFyUWo5b0VCQ2xYR29MNjJyeUhrYmFDSGhlSXA2VklLL1liOVhiOXRY?=
 =?utf-8?B?YmxObXAySDhHUW1vcDNOUHhJR0NrUytMYytwQm9KaHpDeHF3VHpXd25pRGFK?=
 =?utf-8?B?NTNsa2ZvRlEyMDFlaFdTOXMwblBxeUdEUHNSUVJWOEhRSzFHOE9hSmZjSzQy?=
 =?utf-8?B?MmticzlVWTRpZzdEZklTaU1VQlZjRjI2d3VWRzJ0K053bTBkemJMWVdiR2l6?=
 =?utf-8?B?R1JBOElzMFNyRXpsY1dNdWJ1M1g3WHh5NzhSRUloSTgyV1BuUzFiU0NYVThM?=
 =?utf-8?B?Nkg3aFhIQjlwcEhoOGhJQkRBQVNVRmFTai9IMFZLNTY5bEN1Z2ZnWGRyUWpG?=
 =?utf-8?B?SE1uSVRxT2ZOQU44aGFPM1JuQmJRazZhdVRNTmc3dzJueTNJNlEzUTAvUFRn?=
 =?utf-8?B?OGVvbTkxeXlaTERsNkd2T2pkcGFiT0xQYnFiVFhZSG1qUitaY2FiZUk0Vjdj?=
 =?utf-8?B?UnVlK05uU3VZN2VXTlVEeHNpS0VtaXk3WmJaY3E2a3BHdDhjc2RIWnY0Q0Zk?=
 =?utf-8?B?RG1oN0ZJd1dYc1ZuL3lpNW1relV0UHBYMjBnU0VVNUZadFpBVEtKZFk2V2cw?=
 =?utf-8?B?YkFvZERKRkFJZFBkWk15L2hDSjZYN2l3TlNBeVJaVTMxcjJpK0FNdzBXdUMz?=
 =?utf-8?B?NzFHUFhidWRtU25oeTF5S0xIWkcyV3VLalBEcnNVT2hiR1Q2enZOekt4d3hD?=
 =?utf-8?B?UjZoQTJ6OWw2U2xLbWdobW1qR0JmY0RaMHZrTHdCSTdUWlRNTmFLa2NhS1VM?=
 =?utf-8?B?YlU3Nm1qcnRPeHBNVmZsU1JxSU1LQlErd2lsQm5xcnZIaklzQkdGdkIrMVNU?=
 =?utf-8?B?cERpNHpqOHl3UmtUQTlwNHNXTUMza0FJRmdpYWFydXFXeGNUaGJkamVqR2N0?=
 =?utf-8?B?c3VCcVhMdDJDNmlzK3h2KzNzTzZrUE9GQzRFT1R0d3pNM2pCem9mVXVEYnJS?=
 =?utf-8?B?OE5yYUEzeU00c2NRczBzbmd0dXJ5Q0JzQkJjUzhVRkRjZEwrT0hsZi9CdU93?=
 =?utf-8?B?dlNyNnNqVm1HUW9SUUFyOTlPc05CT282Y1BEdXdWYmlSa3cyMDl6UHFYT1pn?=
 =?utf-8?B?b0JIMjB4UlM2clpyODlHb0ZiZXlud3FsVHB0RENpSUl4eHdqdFFxeGJvb2dZ?=
 =?utf-8?B?eWJmVFZXcU9IYVVNcGlSajgxZllnb1VLeXR2VTRXSnEzNU8xWjFpU2FSUFJH?=
 =?utf-8?B?WjN6QVN4cHU3bElydW1wZi9YaGdkU0MzbkpBOGtsMzJHTGwraXVaeW1JejNp?=
 =?utf-8?B?bVpzWW9BY0dROWtCNVBmc2RsY2xBZXh3Z3psdE02T0VGNU5oWDVDMVJBczBr?=
 =?utf-8?B?SUhkbFFhVUlMYVF0bHZvdHF1L0VocW1IWkViR2lFQnc5NXJRbE1VNVZ5V0lO?=
 =?utf-8?B?dGxiMmNIK3VVSDVuTjNGdjVyR1p2SVBzYzVTTUE0UWI1OFEwM1RNdVYzMmQ3?=
 =?utf-8?B?VDlNb1JiVEtkNU1iQUFtcUFUbUdNRzQ0Y200a2srd0JMUllRTk1SVXBqQUU3?=
 =?utf-8?B?WXVGVnR3OFh0UDk2eDNwMHRTK3VCU0N4RDVlLzJKRmowb3hpTG9tMUVxVHpR?=
 =?utf-8?B?VWdDRThnbXhTNkVwNW5ROSs5b2liNTQwVmJVc2Uyc2ttL3hlNXJsbXdjMGRG?=
 =?utf-8?B?Q2d0TU1JZEpkRFBzeE5BVXlKcld5U2YwQ2VTQVEwVkdZaHk5Z3NRVkREaUZO?=
 =?utf-8?B?dXAxS0VwaFNjNmR3MHNGVnozSk43eFdlcTdmaXdkcmhDbDVpbGtjQmJFK2c0?=
 =?utf-8?B?ZlVQQnMvVHprWStvNXdmZWVJb2hYOTF6d2dkc0g1ck5VRzB1dDJTMmx3Y2Vr?=
 =?utf-8?B?Wlh5Q1I0SXdnb05wNjZZdlJ6cXBhWTR1b1ByNjZLeWpLalhEbzgwMWNMT3dv?=
 =?utf-8?Q?EuSd44m6FmMPGXjzL6TnHKi76?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3691B74AA6E11F4B9ABB87A701722C62@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: lgqGdGp92yFtdWtRkURqK+ndZNO6dGi3PGUyOHFRqGHffuR6YBq1jO5MjxbeZoq93a+H1yrTtqKgVwOVaVEKuw5vTxI2v7CYImfHhmymexBlPk5alSUw5/9sdr8htMWkO05qH/+GV+Ckb4y71HKIimqze42PNzbJwoYQjLuWtC5haKDkRwUkZTE7M2ZM8VtKjO3BRuQbi5jQSHgy6jHA8uLYUXkFrEaBTPODuYR2bwPrWM3Zv9B/6vormVI32Tnu2bO6UExq8YyjzMr9fKrdWGuKyT7nWOjbWny9KveK0R8Sipu6ScEP33u4cABIGCEAwe75ai8SO2NrFHVq2yu2aiWOaY+XP2lanXRjzh14P3ABGGMPsB4hnJ7bcy+Y9WTxCZZcJAuN3sIjyw8B4GGpUGzs5Cl/mKcQNisfbJaAboMuykFk4+gVZ6sZpj2ahIGPwNER+fEErMzZLbDDdyJyiL3wO+e77TNAqN2MehamZLaBW9mLsZoK+Zgss046bVTZMe60jDclnE99kWhu7qA34kl2Bhb139rzvjimvf4y5XdlrKsJ9K9UgpDCVvdlHocnPq7UstqEMoTgl5KHiQDGguz/xjgcptbeTIEJfVXFboWOS1UUp3QZS/Mez0cmGtQsGP0s3wxVITaT/iRaHFLtPb3z3SWe8m/VeO2Pmr58Bd/0XYc2CDSUaiMyZgbAoE2ObHTXxwuTJzaU6L1f9mbHIEUPHBp1qL+a9t72gECPIcp5owL5zRQ+nE+iJCHmWQ+l7sbZFpwmIq638gfMp6fCdbMpWaOwMw3tRkpMcyPqGynGKgXdz4QXmoLqK8x6SufMsWWcZ2mMjXKQ7JT+4P7Ojw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a696f07c-2400-4485-783d-08dbaf2dbeee
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2023 23:05:21.4467
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0+jX33alxLSuhUiOjQ3hLKk89jTpLEDecgngU9iCEYOYrqiglOFnKRWG+6DHVw5DeM23MXECy5+zrIwZBcWSrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4124
X-Proofpoint-ORIG-GUID: 3XIkL_gV1s3HHTYDQAeh4CytLSHEtHo-
X-Proofpoint-GUID: 3XIkL_gV1s3HHTYDQAeh4CytLSHEtHo-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-06_06,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxlogscore=450 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2308100000 definitions=main-2309060199
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gV2VkLCBTZXAgMDYsIDIwMjMsIE1pY2hhZWwgR3J6ZXNjaGlrIHdyb3RlOg0KPiANCj4gPiAy
KSBCdXJzdCBzZXR0aW5nDQo+ID4gCUkgdGhpbmsgdGhpcyBpcyBzZWxmLWV4cGxhaW5hdG9yeS4g
TGFyZ2UgZGF0YSByZXF1ZXN0IG5lZWRzDQo+ID4gCWhpZ2hlciBidXJzdC4NCj4gDQo+IEkgd2ls
bCBoYXZlIHRvIGZpbmQgb3V0IGlmIHRoZSBidXJzdCBzZXR0aW5nIGNhbiBiZSBjaGFuZ2VkIG9u
IHRoZQ0KPiByazM1Njggc29tZWhvdy4gVGhpcyBzb3VuZHMgdmVyeSBsaWtlbHkuDQo+IA0KDQpU
aGUgZHdjMyBkcml2ZXIgY2hlY2tzIHRoZSBlbmRwb2ludCBkZXNjcmlwdG9yIGZyb20gdGhlIFVW
QyBmdW5jdGlvbg0KZHJpdmVyIHRvIHNldHVwIHRoZSBidXJzdC4gU28ganVzdCBzZXR1cCB0aGUg
bWF4IDE2IGJ1cnN0cyAob3IgMTUgaW4gdGhlDQpkZXNjcmlwdG9yKS4gVGhlIGR3YzMgY29udHJv
bGxlciBzdXBwb3J0cyB0aGF0LiBXaGV0aGVyIHRoZSBob3N0IHdvdWxkDQpkbyAxNiBidXJzdHMg
aXMgYW5vdGhlciB0aGluZy4gTm90ZSB0aGF0IHRoZXJlJ3Mgbm8gIm11bHQiIHNldHRpbmcgZm9y
DQpTdXBlclNwZWVkLg0KDQpJIHJlY2FsbCB0aGF0IFVWQyB0cmllcyB0byBwYWNrIGEgbG90IG9m
IGRhdGEgaW4gYSBzaW5nbGUgcmVxdWVzdC4gQWxsDQp0aGUgd2hpbGUgc29tZSBpbnRlcnZhbHMg
aXQgd291bGQgc2VuZCAwLWxlbmd0aCBkYXRhIGJlY2F1c2Ugb2YgaWRsZQ0KdGltZS4gSSB3b3Vs
ZCBzcHJlYWQgdG8gbW9yZSByZXF1ZXN0cyB3aXRoIGEgbGl0dGxlIGxlc3MgZGF0YSB0byBnaXZl
DQp0aGUgaG9zdCBhIGxpdHRsZSBtb3JlIGJyZWF0aGluZyByb29tIGFuZCBiYW5kd2lkdGguDQoN
CkJSLA0KVGhpbmg=
