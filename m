Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B56576A7912
	for <lists+linux-usb@lfdr.de>; Thu,  2 Mar 2023 02:41:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229496AbjCBBld (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Mar 2023 20:41:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbjCBBlc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Mar 2023 20:41:32 -0500
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F5324BEA8
        for <linux-usb@vger.kernel.org>; Wed,  1 Mar 2023 17:40:54 -0800 (PST)
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3221VdbL028906;
        Wed, 1 Mar 2023 17:38:50 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=b+f5KhTLnilgu99LICSof+nA1Bn7rnVCELWyuN9LOsI=;
 b=qgXbs+DXzV4P2/sRpNgfYAtLfz/agJHm8ZnP7g2lNMRiAHUwRtksk98F9RTB5nMt3PHp
 vobL7h8egllQnDQChA79bsJvOmn+FdtuXCvlEs8rSke0+h6Mv8nX032Tpws5VEg+zJdX
 wMts7fERMGHUZQHR5DG6bj3wX542Y15x/UEkhQvMBe0h5QoH/Cgipylg0g8qwmBlecRQ
 QTCCrynVfkADNlL1D5Gk0B29cYOps294GENGz7fewCNnt4cmBFgeLLrC4VSY5ztowcgp
 ltgKXimfYB7MYElrhgJMGogy6fU0IolJK2/U0ZkrEMnBdxWyX+MgkVRsCaODihR5Qadw Yw== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3nyj51skr9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 01 Mar 2023 17:38:50 -0800
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 48891C00AF;
        Thu,  2 Mar 2023 01:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1677721129; bh=b+f5KhTLnilgu99LICSof+nA1Bn7rnVCELWyuN9LOsI=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=I4K1oMdCBQvopiWuT5lU0qeXBOw3N7qDBFlFPIzA8J7VyPRMZBKT/wRqJKZZhVmvH
         1VHR0wn1U74GI7hXh8A4EopkQxx39pI8V4zU333CojHOXqijcUuO514/Rj+ynGjWYS
         6OvmeZOMUFDrNSbux5gLTZSBSpH0URM88hDfCtshJYj3wzE2I01VPnXVXEIyLq1Ioj
         00EWCqUw/Gxz3f6krX6Bb8d5Z5cAQUGBaPE12leM4XXvio8FXU36+1/pHMn7a9XNPH
         O97Jfswl5aijssbPO/Ua7WGqhMzHkphA46VlItiX7Qmm4kL0RL9tTXED9N9nVVrUXy
         GjLRDb/4JK7Ow==
Received: from o365relay-in.synopsys.com (unknown [10.4.161.143])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 37B68A005C;
        Thu,  2 Mar 2023 01:38:48 +0000 (UTC)
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2040.outbound.protection.outlook.com [104.47.56.40])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 3EC7EA0022;
        Thu,  2 Mar 2023 01:38:47 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="ErmN91Yz";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AN3U2k9dwOp19q2rc+tEUTkM15oE4aNM5k+biCxMgNMpuifXa03fjLFVPBS/RkiVDZiSIQoXtLLGTB7r1MMB/fgEeBGSawOSs0X9hNOKpW7XxBElI2stqubp6aNcY5imLtIC0lxPmcUOBJKXi/eI54STwdK11TbBR2alBH7+muUp9A2lF4tJFNIx07db4yZ1pRJq10OtJwbuMxXIE5qRdbRYVSmKo1topMm49dmfH1F+cUDxS8Qkb9rF6f5wF1+qJg3wvcW3rLSv8wK0nkhsTppPbz1gbglhX6mk81LqXgq7nA/CpTFRkyNOUY47ZJNaiyzcQvnG1izsAFUkRluIGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b+f5KhTLnilgu99LICSof+nA1Bn7rnVCELWyuN9LOsI=;
 b=Yhwf6qejDH1e/bs1yyX4I4Td5krIcHCS/d7tYgQpptLejcKNWX7d7jy/eyaCGYUcBtPVuGIdSvyWKqjzlreBEszfyzW+jkiO+Gn4m0FVS5h7pMfk3R9FWvAAcqy93Qrrpyr54K6Llkq2MJydH2LHw6vBIw45FMJ4g1oPs9WGluEcEaNR6BMMuuNeW5Ys7mV4yjwjQe/PpVwDj2gbM9dldrL7j4ARLohhIzxQu2vlTMfICNfKfTQCQPFYfrRIdjmHv5HYok9kRt1ojYalC6R5o9uRIzLc7teN0hMLbSoMn1EwvyE2swfwbfbqLGPu/kM6izpgU9NyExMDw+FR+yzn8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b+f5KhTLnilgu99LICSof+nA1Bn7rnVCELWyuN9LOsI=;
 b=ErmN91YzQyRdeKtrMk4kWSy0yEO5ZMC8IPVNhAAQ8gFuKl0vX4EpbTKEl7CB16yiu15OQvV83MLSTaRNeh6zx42bKBXXef8a4M2f+6Ev1VBy7UxfouO54IuY88TgtwP2I6nMGEDes2QVURxSCs/3wE8PBdu3ssTnPGmOpYC9yNc=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by SJ0PR12MB8091.namprd12.prod.outlook.com (2603:10b6:a03:4d5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Thu, 2 Mar
 2023 01:38:44 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3161:c44d:8bb3:423f]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3161:c44d:8bb3:423f%3]) with mapi id 15.20.6156.018; Thu, 2 Mar 2023
 01:38:43 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
CC:     Mathias Nyman <mathias.nyman@intel.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Peter Chen <peter.chen@kernel.org>,
        Pawel Laszczak <pawell@cadence.com>,
        Roger Quadros <rogerq@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jack Pham <quic_jackp@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>
Subject: Re: [PATCH v2 3/4] usb: dwc3: change some trace event
 __dynamic_array() to __get_buf()
Thread-Topic: [PATCH v2 3/4] usb: dwc3: change some trace event
 __dynamic_array() to __get_buf()
Thread-Index: AQHZSlVwK8N3fabmCUWRjJ9il6hwFa7mur+A
Date:   Thu, 2 Mar 2023 01:38:43 +0000
Message-ID: <20230302013837.h2pemxypuvlsk4dg@synopsys.com>
References: <1677465850-1396-1-git-send-email-quic_linyyuan@quicinc.com>
 <1677465850-1396-4-git-send-email-quic_linyyuan@quicinc.com>
In-Reply-To: <1677465850-1396-4-git-send-email-quic_linyyuan@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|SJ0PR12MB8091:EE_
x-ms-office365-filtering-correlation-id: 93b5b0d4-e814-4160-927c-08db1abedbb6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nYRjVCZCMXSIJ/Y7QF1XbwZcHA0CiFVuO+wdQoZopSJgN7DOHHg9a4/D1c8TxhEX31Mr0ZUPgMa1M3rpIQG+rM04vR74BxzW/MrrnkftqKK36k4LxMjZHIytgn6JWIDkRb9X556OShn6XcMUqXwwXtPLeBSeXj3RhaeIoXzFPUyOfPqtgC6J3LTcyNrBbwTUA1cLzgNUWGA/BNU6GtrKI53w50KW3LoSAECwR6O5YOoWELlXQp4xoCRJnC43Cuh0CoQYyETYE29YEb7fdjwvfOkQcjbzV5f/oTHl/85wNNDTXQDyUk9CPG4Jj/Aqp58xKvOpuF+LaskzaK6xASTGeyhe4S9Wr/hvykJCkkNVS0dzLDoN7Q6IMgx1Snh+67MNS+gLUv3ewZIewiv5SQKUJAzwvjXRHtAxG+2p6NMT5SlGtEcnCqwEch2jxy0VElhbihVRQehFXRLdkVYgNPZrvpzZKnVDd55m2SYK64egndZxOYyO/8hGpGdTKxak858/m0I5lJa9ll6Fp2/uW2M5XFXKXqqoVAefUIWicUyxr7KkQ89D0V8RcRhcKJMUvNiFgbFmI8Nax6K7S0lNc49EN0RMH6iH94+LdQaR68kXbE/kZxzzBYiFkygjxSC0p1kYcwg6WO/TUI+AQNFVgip3dUuIiob0WmIFw22jOurG+W8GIIo1qW/PVPSXTG6Aa4CZnh3XYbaycO4E6pocF09UvA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(39860400002)(136003)(376002)(396003)(346002)(451199018)(38100700002)(8936002)(122000001)(38070700005)(86362001)(36756003)(66446008)(66556008)(41300700001)(66476007)(66946007)(64756008)(7416002)(4326008)(8676002)(5660300002)(6916009)(2906002)(76116006)(2616005)(186003)(1076003)(6512007)(26005)(6506007)(83380400001)(478600001)(316002)(6486002)(71200400001)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UmVydEk4T0VuK1BiU0dCUEhkbFZzOFRsUi96LzNHSElZa2JGYlNhTVEwWGxp?=
 =?utf-8?B?TjVjdXB4T203RE5nOEVqUnlwNXVwajR0TTNDTG90VzVzclp3NGwxYzBacmhL?=
 =?utf-8?B?M0g4TmdRbitydk9sYnJHemhNRGhRU2xtc0MrSDFHTUJ6eWZ4VnV1QUhkcGF1?=
 =?utf-8?B?R2laU05QTE1TWFlUS3NNREhVVmNHWXp5MWV1R3lJYSsxejFDVGE3b0JocGwx?=
 =?utf-8?B?czBOYklKQzhMb21YWXRJYlVsWjZNbHJTVjF6aVhHVkwzc3BzMWhRcUc5Z09u?=
 =?utf-8?B?MnlNcTBmUU9lS2lTZmVXbnUybUFkWElBNWVrOW53OEdkSkt5RkpuL3JVcGRu?=
 =?utf-8?B?OG14V3FjU3A5VlliQy9nbFljY21oODNpOWhNd2ZnSXlLWGhjdlB4VUJSS1Br?=
 =?utf-8?B?WUVWSGNMYTY5aHozSWg2RVVNUmZlTDlGVXczd2N3MDdTMTBhQVNoMW5QcUJJ?=
 =?utf-8?B?WmdvdVY3dmxNZmprWHVCRS9vcXh2Z2NzUmlDcUxzZERaZlRLckFsRGRHQ21n?=
 =?utf-8?B?T3owT3VKNVVLeDJNc29SOEpXQ1orZitacUNNZGRpNW9xVXlESDJ5Z0hrTTNK?=
 =?utf-8?B?QWEyeXhRMHRnUU11aFZMUTVVYWRFSnJpTlJFMml6UVhzdHA5L0k3QkZaajI5?=
 =?utf-8?B?bFZrUlhMYTY5NE53bEM2S3p0NzRuMERRZXVBSFBiTE9PUFgwWGR3dFcwcUNr?=
 =?utf-8?B?ZW5UTm5pL1JTVnZOSVM1cEU2RzlRaGVxZldLMzBIY2phWnIzR2hNemc5VENv?=
 =?utf-8?B?aTdIL25nbjR3RlJvTzVTc2pBVWdwK05DNVRrSzE1dGJyM2FiT3psSHBHMkx2?=
 =?utf-8?B?dUg1MmlGVlNVZVU5YnJJckx3RE0xaW03WWQvODMxdFoyWXp1ekg3NW9JZmdE?=
 =?utf-8?B?UGQxSzdpQWl1MVdEdGRPTGRZOFk1c0VjcUtKSFJKOWdmZTN3M2Q3RVphVXdn?=
 =?utf-8?B?aXBKY0xldElzTE5adDlTWlJpeE1obEVoRzlYYndNWTlJUThKajNQczFSWmlI?=
 =?utf-8?B?ZmZKTlM2SFFKQkI3bER3MEJiVlg2ek9TbWJTWk9rZVlDdklMNnFMVWFOdDdL?=
 =?utf-8?B?VndBd1hNMXN4NjM5TlEreGMvMkFlT05yYk1CRnJ3ajlUVjdremhDUVBod3dL?=
 =?utf-8?B?MmJXcEpXaGtHYjRSVlRZYTkxWVY1N3FVeEYwUEsvaHVVcys0WEFxd0RCamU4?=
 =?utf-8?B?NDNmb0xuUC8velFVUUpqZnYxTlRZQTNpdWI1YWNldDFwVU9LZGlsdTA0ZEND?=
 =?utf-8?B?UzZyWThSK1FCWVNiU1BYOHU4MVREQ01QQ0JjUVV5d2RNSUJHRmw0TFUwWEtN?=
 =?utf-8?B?YzZaRVprQTJsdy8rQUtqRnppWitKYW1ubTkzcVJVN1FZTVhLNmRRcGVwNUZn?=
 =?utf-8?B?TlVCOXNVRWUxLzVRSmFwczFSRW1xcURhZitNcXErLzhmdGcwWWVWWnVjeTBY?=
 =?utf-8?B?aXFEdlhWZEVQcWx0alhIYkYwYWJMd2pERERueG1uK09sbFl2dWFoVDhDUUg1?=
 =?utf-8?B?NVRGcU5FMVNncDdLakREYmYzcWFEaEduSjAzdCt0anZPQWFpU3FLSWVGd1Yy?=
 =?utf-8?B?UmtFcmNHNmNaSWR6ZUJjRytnTDhUNjNDd01pbXFYYzBHcDFKajdOOFdHeUhS?=
 =?utf-8?B?d0M1ay9WR2NQTEREaTRlK25QR3VTWU1MczZOYURnUTFYdDljMDY1NDNlVGtR?=
 =?utf-8?B?U3Vod29xdnU3ajR6UzZnbExHOXkzVFpUaiswaTl5b1BITU9yaXhZeTE2Y0tx?=
 =?utf-8?B?NEgvekk5K0VSc0pqdkRCa0ttTkkxaS9FWmFCRFVibTVWckZpNHBYVlRLUXgr?=
 =?utf-8?B?UUpKemJLSDFEeVRvajZIUVFhWEVmWHRjbXBoR2xTMWtNYmViZEF2NjlxMDl2?=
 =?utf-8?B?OTdBUE1tbHEzMnNHOUZHMmpTVjJkY2xFaDByeEN0TlhlOVptMGhST045ZFNP?=
 =?utf-8?B?V2dkME1UUVp1T3p4ZHk3UXNuMStYZ2tnRE5SZDBZckZDUXIvVVYrcFFEdGJa?=
 =?utf-8?B?dEEyZWVDVXV1UnphMG45YVkvOVU4QXV4TkxkNmJzUnhEQWFTS0RuWmRWM253?=
 =?utf-8?B?VFphUEhHT3NXb1hmb0ZaRjI2QXNrQnM0Y1dianhTZlo1VEpxS1BCK3V4R3Jq?=
 =?utf-8?B?aU5kMWswWTYyMWVxcWNEbXFBcnlDb1pnWE5wTmphRytnODlyVm0xNjA5LzMx?=
 =?utf-8?B?bVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5353B352C0EF994EB46DCDD6C6A7BAEB@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?cXpKaG9iVE9tUnJ1YUsyeDRWMENycnl2OHhNQUM1YS9IQ2lhUnkvMFRaMjNX?=
 =?utf-8?B?T3dPQUxMVFNwdUZlSERPOUV1NEJiODlZN3hnaWJrS1NRWjIvaFFRdnkvTC9N?=
 =?utf-8?B?U0NKR3Y5NDk1VmZObkYzRmo4UkkwUElBUUhFd05lbk4yRlZ2dGs3ejI2L2R5?=
 =?utf-8?B?NnNUM2NpSnFCbXlLM05Ibys5ZTR5WEtuR2M2RW5qRXVQS1dDMlVJSzNERnpP?=
 =?utf-8?B?b2pDODFYYkdGVGE1Y1VOa20yYUQ3U3pncXRreHBQYW5RaW54NlRIK1JPTE5p?=
 =?utf-8?B?QzExSTVjNXFPYi9RdVdLZnVRTER4b09nb1ZGNEtMWVBkcFlLcHpML0ZBMWxJ?=
 =?utf-8?B?TDA3Tzk0QmJGblZkeVpWQURKK1BTSDQvNitLVXFZd25EZkNhM2FxVnBQbTQ3?=
 =?utf-8?B?dnVSZnRGM2F5WFpoUGNXUzZYQUpXdURlVjlLT0xEb2RmbXZ0YjN0T2VTWWgx?=
 =?utf-8?B?NjVOTTg1Y2x1QmRkTmIwUjJsc1ZZN0pISEtZdlFKWE5BaXIzbmduZWtGQ2o4?=
 =?utf-8?B?dTJ1REpyOEh6OFJvTlBuL0lJZUN2YWs3SE1HMmtKTm8xYUFGTmQvdXZ2MGhI?=
 =?utf-8?B?N3EraGRUUENINEY4RUNGUkRiSnlIaG1rUkF5YzRraVpnazM4bU5GNFJKKzUz?=
 =?utf-8?B?SWEycWd1Ky9WNEFTUXFKeUtjY29tbkpmVjJvRnJ3YjBhQ1A3eUlkQThRSEQz?=
 =?utf-8?B?d0d6ZXBLNkJ2QjNCR1hxbkhRalluTVhoMlFDNnFXK3ZnenppZHhNTkpiZFdo?=
 =?utf-8?B?VFlIWVNKbkl2SzVjQmJObDRzcjlybU11MHVhWUg1QWlEWE13dmV3dUtObzJ5?=
 =?utf-8?B?US83QnhHbmZHKzZEdDNPMmFkenBsZ0d4MmFHTnJXVTFpQ0Z2bHkxU2JWeDJK?=
 =?utf-8?B?dmcwZ24vcnZsWDdFV01NcG1Uc0phdWlRYnF6WS83Um9NdUNyV3Yvbm5sbzVM?=
 =?utf-8?B?WmN6a0ZWcHRKMHlNQmlDTS9BRXdUYk81dFp6U0lJVEpQYU85SnIvdG1ScFUw?=
 =?utf-8?B?dWxrcnErVjF4by9WZHNTMC9vNStESDltNnNWQkQ3MEhDQ1Y3ZFp2TVNqVkZj?=
 =?utf-8?B?bWlBRHZqRzVPSDErZ2tWNmU4OGNiejAwM0NQbTNEOCs3RXBiWnhNaW9TMXNN?=
 =?utf-8?B?RHJRTm1yU0tnS0UrNTIzbmlhRFVZcTU4SUVSdzJhbGZudXJEQlZpWnhKTW1k?=
 =?utf-8?B?ejZQbkRTcDBQYmkwZkgwQVhPTi9qWG83bEJPWEROenVFM2U4ZTBydjY5VENG?=
 =?utf-8?B?YWI2MGxmSDlrRWlKRjZ2RWJ6SGUvZEM4SXFNTmtLbXRwT1phR0JWU2Iwak1o?=
 =?utf-8?Q?OuiwoWYDwXO0k=3D?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93b5b0d4-e814-4160-927c-08db1abedbb6
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2023 01:38:43.5184
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DmRda8e8t3l5kzQb5FCFBsx69XauuVtCEArKBnTgBrNDG73b+qjJPDrbGxgQfEX77MJPNqC/RLyYFK5b78rg9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8091
X-Proofpoint-GUID: KKcsuWd5SJZOsBRKCPpnYWHauXaaqt2h
X-Proofpoint-ORIG-GUID: KKcsuWd5SJZOsBRKCPpnYWHauXaaqt2h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-01_17,2023-03-01_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 phishscore=0 mlxlogscore=795 lowpriorityscore=0 mlxscore=0 clxscore=1011
 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 spamscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303020010
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gTW9uLCBGZWIgMjcsIDIwMjMsIExpbnl1IFl1YW4gd3JvdGU6DQo+IHNvbWUgX19keW5hbWlj
X2FycmF5KCkgYnVmZmVyIHdpbGwgb25seSB1c2VkIGF0IHRyYWNlIGV2ZW50IG91dHB1dCB0aW1l
LA0KPiBjaGFuZ2UgdG8gX19nZXRfYnVmKCkgd2hpY2ggd2lsbCBhbGxvY2F0ZSB0ZW1wYXJ5IHRy
YWNlIHNlcSBidWZmZXIgZm9yDQo+IG91dHB1dCBwdXJwb3NlLg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogTGlueXUgWXVhbiA8cXVpY19saW55eXVhbkBxdWljaW5jLmNvbT4NCj4gLS0tDQo+IHYyOiBu
byBjaGFuZ2UNCj4gDQo+ICBkcml2ZXJzL3VzYi9kd2MzL3RyYWNlLmggfCA2ICsrLS0tLQ0KPiAg
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gDQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL3RyYWNlLmggYi9kcml2ZXJzL3VzYi9kd2MzL3Ry
YWNlLmgNCj4gaW5kZXggMTk3NWFlYy4uZDI5OTdkMSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91
c2IvZHdjMy90cmFjZS5oDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvdHJhY2UuaA0KPiBAQCAt
NTQsMTQgKzU0LDEzIEBAIERFQ0xBUkVfRVZFTlRfQ0xBU1MoZHdjM19sb2dfZXZlbnQsDQo+ICAJ
VFBfU1RSVUNUX19lbnRyeSgNCj4gIAkJX19maWVsZCh1MzIsIGV2ZW50KQ0KPiAgCQlfX2ZpZWxk
KHUzMiwgZXAwc3RhdGUpDQo+IC0JCV9fZHluYW1pY19hcnJheShjaGFyLCBzdHIsIERXQzNfTVNH
X01BWCkNCj4gIAkpLA0KPiAgCVRQX2Zhc3RfYXNzaWduKA0KPiAgCQlfX2VudHJ5LT5ldmVudCA9
IGV2ZW50Ow0KPiAgCQlfX2VudHJ5LT5lcDBzdGF0ZSA9IGR3Yy0+ZXAwc3RhdGU7DQo+ICAJKSwN
Cj4gIAlUUF9wcmludGsoImV2ZW50ICglMDh4KTogJXMiLCBfX2VudHJ5LT5ldmVudCwNCj4gLQkJ
CWR3YzNfZGVjb2RlX2V2ZW50KF9fZ2V0X3N0cihzdHIpLCBEV0MzX01TR19NQVgsDQo+ICsJCQlk
d2MzX2RlY29kZV9ldmVudChfX2dldF9idWYoRFdDM19NU0dfTUFYKSwgRFdDM19NU0dfTUFYLA0K
PiAgCQkJCQlfX2VudHJ5LT5ldmVudCwgX19lbnRyeS0+ZXAwc3RhdGUpKQ0KPiAgKTsNCj4gIA0K
PiBAQCAtNzksNyArNzgsNiBAQCBERUNMQVJFX0VWRU5UX0NMQVNTKGR3YzNfbG9nX2N0cmwsDQo+
ICAJCV9fZmllbGQoX191MTYsIHdWYWx1ZSkNCj4gIAkJX19maWVsZChfX3UxNiwgd0luZGV4KQ0K
PiAgCQlfX2ZpZWxkKF9fdTE2LCB3TGVuZ3RoKQ0KPiAtCQlfX2R5bmFtaWNfYXJyYXkoY2hhciwg
c3RyLCBEV0MzX01TR19NQVgpDQo+ICAJKSwNCj4gIAlUUF9mYXN0X2Fzc2lnbigNCj4gIAkJX19l
bnRyeS0+YlJlcXVlc3RUeXBlID0gY3RybC0+YlJlcXVlc3RUeXBlOw0KPiBAQCAtODgsNyArODYs
NyBAQCBERUNMQVJFX0VWRU5UX0NMQVNTKGR3YzNfbG9nX2N0cmwsDQo+ICAJCV9fZW50cnktPndJ
bmRleCA9IGxlMTZfdG9fY3B1KGN0cmwtPndJbmRleCk7DQo+ICAJCV9fZW50cnktPndMZW5ndGgg
PSBsZTE2X3RvX2NwdShjdHJsLT53TGVuZ3RoKTsNCj4gIAkpLA0KPiAtCVRQX3ByaW50aygiJXMi
LCB1c2JfZGVjb2RlX2N0cmwoX19nZXRfc3RyKHN0ciksIERXQzNfTVNHX01BWCwNCj4gKwlUUF9w
cmludGsoIiVzIiwgdXNiX2RlY29kZV9jdHJsKF9fZ2V0X2J1ZihEV0MzX01TR19NQVgpLCBEV0Mz
X01TR19NQVgsDQo+ICAJCQkJCV9fZW50cnktPmJSZXF1ZXN0VHlwZSwNCj4gIAkJCQkJX19lbnRy
eS0+YlJlcXVlc3QsIF9fZW50cnktPndWYWx1ZSwNCj4gIAkJCQkJX19lbnRyeS0+d0luZGV4LCBf
X2VudHJ5LT53TGVuZ3RoKQ0KPiAtLSANCj4gMi43LjQNCj4gDQoNCkFja2VkLWJ5OiBUaGluaCBO
Z3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+DQoNClRoYW5rcywNClRoaW5o
