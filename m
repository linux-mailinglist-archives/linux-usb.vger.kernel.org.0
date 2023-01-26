Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AB4467D55E
	for <lists+linux-usb@lfdr.de>; Thu, 26 Jan 2023 20:31:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232040AbjAZTbp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Jan 2023 14:31:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232400AbjAZTbo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Jan 2023 14:31:44 -0500
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E81C4166E4
        for <linux-usb@vger.kernel.org>; Thu, 26 Jan 2023 11:31:42 -0800 (PST)
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30QBqMBv004705;
        Thu, 26 Jan 2023 11:31:39 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=HQP3zcRjOl51+WXwNyNKzB0wAL5Y8JXHehC++JpJv+Q=;
 b=oQDPgIhExT2mn2n7+dCR3fP63h0Mj8b8aoZNiJ/4wX+UF6jehyJlRW9pntk2M2WcRNvJ
 ZDko7ICL8vLnsm28LSQ4iah3FyocBdZbXPrIlfOcI8BPj7DG2WghtsFF8bkBxArlVuQE
 0SpSP3WEVN/DIlLck13gbpqXdei5XwR++x0B9MzmwoijDZaYm2JsJ54ClSudiZbXwwPW
 vJE6FBXIhVqLy4wzw+TIywtGSKzz5wmuZGvtFoLkVhnv+1oo1x5dYPc6V2FUTnEjeNFw
 Hv+eTKIO7Cc0TxkSeL++vZK2Cn6YQiwZJ783PPd1i4wGIFbTpwi1Ku/XUD7plaA05fdN bQ== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3n8fxrxgm0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 26 Jan 2023 11:31:39 -0800
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 294FCC0100;
        Thu, 26 Jan 2023 19:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1674761499; bh=HQP3zcRjOl51+WXwNyNKzB0wAL5Y8JXHehC++JpJv+Q=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=PX63QeiHotCbXLqJHoF7gR1FHJ5uIDJ6XLplAyVaYz2dPpzj5ShE31IVd4LDrZBXX
         9qVn42YoHzkd/taxOt5gZy72OUzDTNfG6O1If+jwSilPSSlOA0GUOi7Bxe4ZpB3Ldl
         AUCOfI3O+ssWuUV8J1zjv2DLd/qtlxfO7/M9j+6La2z5SDEG6pEQe+UJc2yVsDE4t+
         1IqosGVzaj+GP/6o7mcnb5yiz8fJNakJ0CrHMUYh6lBbuChb40aIl7cVOcJ0QQWXgo
         Vf3gRlPiQpGCsQujhqVn3Spi1K8ec5DiraIaZCKN4a9dUsQSEbMPuuxz7Eo1hjGB2H
         ZaEBdjdafmUMA==
Received: from o365relay-in.synopsys.com (unknown [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id AD9F0A0062;
        Thu, 26 Jan 2023 19:31:38 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 111B340109;
        Thu, 26 Jan 2023 19:31:37 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="vKr+Sx36";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AqzMp7jaBvu4pcHtxBKkQAgR5fKVnJOoqFa2gEjysQhtNrQQAl5Zw+fRLbuLJ+4pBMRgPgxaXZTRTUB/ZCwQq/mb97a+wFojK/fFnSyHu1JQiDPQsNkizLnUlAerOvdiJa6qkVZ0PHb2/bqffh90XXuNrD0CLe0QWUZsE3rVcXNzGmZYThHVTj0D65WUsvTLXPvI70qf37RLr11bfFlBuZY5yLEyPhU/BeaDfz/ZVHzy4wKPK9+PU3+1ppjIC8Mxbvx710dSx9YnzN00giQw7GLa02gEpI7zSUmxvwTso631qh9ZM0zAyanZE2wqtyMtHJXW7zjBKteWubJigQ5wmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HQP3zcRjOl51+WXwNyNKzB0wAL5Y8JXHehC++JpJv+Q=;
 b=G+QHPqPhC0oGY3+xeApm+0CQnRQ4BnEC6uNmm4jJisx+yboJIvsBXlIvCWyX9SIe2BTHVfYyr2HMbXdy63QvZC9at2VYl0Khj9jJh2Kcx3zzoEbaek9+h+ndc/5jbVKaOmnBqNHwcd4WrrI9XYo5ksRnzitNpbb/ppXpJqLFir081OVkSrWCe1595d3d7W+6LSUCDLzB2gA7hBclzDYtgR7VCtCS66ht0kaIDbS2LHxXACZfpb2gFNb+kg+RH9MnckpJgZJ5AmqjJB+YX9LR7Vq26tHsSfSoLMqQ/efL6jetZJkLsFOebJkqY8TSrbNH4di0L6GRwNhQ1mkK+mPi2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HQP3zcRjOl51+WXwNyNKzB0wAL5Y8JXHehC++JpJv+Q=;
 b=vKr+Sx36IxaLXFNw9f4T76Cqa2yoHGaXefbtfILs8EjwWaH3A1ok9pAsufhJdl6JDgSOtiyPqa5SrXFv2snRupR60M+PmW9AdeXye0qTnXBMyjZdI3GwxEzAjIZsOjoREb4ZbSPsx8k9UQdw7J0tZHemcj85CbyE0HJGznsVyB4=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by DM6PR12MB4387.namprd12.prod.outlook.com (2603:10b6:5:2ac::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Thu, 26 Jan
 2023 19:31:35 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::6f3c:bd8e:8461:c28c]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::6f3c:bd8e:8461:c28c%7]) with mapi id 15.20.6002.033; Thu, 26 Jan 2023
 19:31:34 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Dan Scally <dan.scally@ideasonboard.com>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Explicit status phase for DWC3
Thread-Topic: Explicit status phase for DWC3
Thread-Index: AQHZL//6d6BOk0ADk0qR28S95Y3SOq6v1++AgACqcgCAAJc0gA==
Date:   Thu, 26 Jan 2023 19:31:34 +0000
Message-ID: <20230126193131.ifaj7arsrrgesjh5@synopsys.com>
References: <9ce226b4-90c6-94c4-a5ad-bd623409bc51@ideasonboard.com>
 <20230126002017.tbxc3j6xdgplncfs@synopsys.com>
 <dda24f8e-8d74-c6c1-ae7c-e423bc50a143@ideasonboard.com>
In-Reply-To: <dda24f8e-8d74-c6c1-ae7c-e423bc50a143@ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|DM6PR12MB4387:EE_
x-ms-office365-filtering-correlation-id: e73b6071-6552-4dbf-113a-08daffd3ef85
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WA6U6RBSCCyZsqyF8HoRDkr6CmQqf+3JCqmcDL+HSYDco+ZMHgMB/9bfBPyxS9id4km4dQtWn+w93ElwXELLSGOAVZJI0RYvmCGVd18OSjXVFN3OoXqyqtMdAvJSBRs3pgLlqc4p32scB4+hFSBa/O6Dyy+M+N5qVj5tA4jifjhmQLKnO92J+1Vg1+LTLkIGqhMgnBHr9tYOPtabIBNSrQgPKRkGJ+nhW+XOcbHMasNcdNO+Ef6+R5l0sL2JY5XoE+ny78vp+lqqVjweEtjEqCRwpDT8C3KutroO6O5l8NEYj5v4mEgo0MCh9CuumUdZJy/vvYPTF09VySz6pHf6Ts0QrKE14YIwYrtMZKZu4wANarzLVGKsPaX+2qKm98bezP3DFwyzeMnK70NYgxHmXKI5qPCA8s8ahfpojsUooM2c/6DHMQMC/aJl/4DRuYs4eANyg+6FcZGxyvipuEs7BYwnBPHoE5p9/Z+9AjD8x2KnKfpUdy3pb1to7fJa0RFeIBogPPPErZoMskkc+nv0shRgnB/8znyvSZplqU8/bjgk3nDOczWXjXs61ffwY4+Imvj/L+hzMHCRur8/m5qgfCaf9f6C1v7EeOwkONERzFGFk8SeUrqfpgsCU1fZNF1X+Ayqhd2Y2hOcjVBLShdhKcYLoh+zZ7HXM388xm1XCuLlDgt++6Ub8+R74/ZVcQeoSnzIeeYVRJ4MkqsOGQXNRpb6WqBlgR8LC8BaWWgl0ZI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(366004)(346002)(376002)(396003)(136003)(451199018)(71200400001)(8676002)(36756003)(38100700002)(122000001)(38070700005)(2616005)(83380400001)(86362001)(6512007)(26005)(966005)(186003)(5660300002)(66946007)(478600001)(316002)(54906003)(6506007)(6486002)(1076003)(53546011)(64756008)(66476007)(41300700001)(66446008)(8936002)(66556008)(6916009)(2906002)(76116006)(91956017)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eVpmaFF6Y2dLSkMybkhPSFlZS1l3QllqUzhtK0IwbUltS3VTUDF5ekNQcUFw?=
 =?utf-8?B?QXBJUmRJaitUd01adE9nSnJhemQ0bzJBMjd4d3hJV0FGYzJXcENicWF1ZXNv?=
 =?utf-8?B?dTJwN2U2NzB2dTdmNm84SklPdjVVdGhNZlkrdkk5VkVhT1NSTUNUT0hRQ3ln?=
 =?utf-8?B?ZndmWFdWVXRTWTEydmpLSDRybUtLTFlISFpKYzBrb3RlMW43MkVDODgydXRX?=
 =?utf-8?B?ZzBDTWpoVnB0Q0dwTXFUZjJTRHdaUDJUb1Y5VnIwNUxyTVFkU2xESUhraU1T?=
 =?utf-8?B?d3FnUXYzK0E1QWZsblA3WWJYMDlsd0pwZldNajZPZnZlL0tMVEVGREZOWkRl?=
 =?utf-8?B?blZoMHpJek8wWjAzL04xVDFneHpUaDAybWovTlVxS2NNWEErWU1HUG9GMEdt?=
 =?utf-8?B?Nk5XWmZwMHVIdEhvZWZoUSt1a3gyZTRjdGxJWDQvWURMczE5cTRYTzlSWk5z?=
 =?utf-8?B?b2lxM1BqbHdKM1VYN2xkWG4xMTRvaW5rNmNMeXBiTVZuUGR6WWhGdkIwTlA0?=
 =?utf-8?B?ODNqM2ErS0NHZ3RUWFhqTERNMW9PQmRwait2bTBBcFBGdHBjT2FuV1VyVmtN?=
 =?utf-8?B?dWVWNE1sMUM5V1BRZzh5MTlIclJVL3VoSitvWkU1MnFJYWU4SCtKcW85aUJo?=
 =?utf-8?B?UWh0ZzA4TjhYSUlQQXlhMW42VS9QalFuMFczWGJrQ21mSUJKRlNlS3ZBbkZJ?=
 =?utf-8?B?K3RYQ2FLTW53bW9BMUhSN2E0QmNHeE0vcnhEMEZpYkdUTmtRUCs3U09sYm8z?=
 =?utf-8?B?VTZFRUNxR1Nrb3NncXVoOEthUk1nREVFVHgxcVhPTVA5Y0tidWFrdFloNUh3?=
 =?utf-8?B?Q2w3R3F6VVpyb1I1c0hWVFJ5MytBeVZpSVcvcytENDdMT2l4dDczMldXa0J6?=
 =?utf-8?B?eGdiZjhoNnFFTUVPVXJHVmt4b3hVMW5GUHkxMCtUc0NZbnR0dVkrTldOalBx?=
 =?utf-8?B?Ni9hSm5GcHFEd0R4b2hOWll4RVJwaEIraUozZ05CTEgySjRZc1k1UXRTa1Fk?=
 =?utf-8?B?VTZZeS84cEZGOTJCZjl5QkdvSEZqZHVobUFpU3A2Y0pvWFVmVjBmS2NDQ1Q1?=
 =?utf-8?B?WkZ4YVpJRVlGZWI2RUp0Yk9FNjF0NVZIbzhuclRleWdxOURNWDZldDZoMng2?=
 =?utf-8?B?MHRpSWpISmNwSUs4Yit5b0cvamFIWWNYTnF1cGM2Zkh5YUFJTnNCeGswd0tm?=
 =?utf-8?B?VkNvZGpFRTI4dHZUWXZ6SWFoWk9lOWowN3RFcGxpUUN6VDM5cWtVYWV1ZG0z?=
 =?utf-8?B?RlRJMWZodzBuRXdSanc4U0ZXcDB0SGs1REpjSUkrdjlrOGRTd1g5dWNrdENk?=
 =?utf-8?B?UVl2MFZCRlFlWGNjZUd5ejFsTE10UGJZc3ovaFRCUTZIRldaU3pkanh1SERw?=
 =?utf-8?B?cGtZRXAxbTdMaisyUFJNcmIvbFNEaFltcFRaTVNpd2dySzdoNkdJVEZDcjkr?=
 =?utf-8?B?akZ3VC9KTXZoSXdDRzVhV0FSckg5M2FCQlFKN0t3a0R2YmNJdzVjcHl6L3RG?=
 =?utf-8?B?SXh0UG9Eai9vbjZxYUZCL2hrRC96SXByUzMvbkpnd2FvdFA1Q3ZrVWQwY2Vq?=
 =?utf-8?B?a2tVSjZwVTR0TnNVM1plWEtCbFV5bWpaRWF2MnVQejBqNEh5WHlKMnlxamlJ?=
 =?utf-8?B?N1d1ZmpOWno5eEJrWTZmcG1QNXVreWdCTnk4SGpYK25UOWgrNkNMcG9BUDdM?=
 =?utf-8?B?b0YxSFNiZ1E3Sk5HUFU2U0hsN3E2eHdFZGZoVzJJcE9uUFNrSForY1FwaTdU?=
 =?utf-8?B?dWRBNkY5TjJ5TjBFR1hGcWZta1NYTG00Vm9MTDlwaWtJOFZuYW4rM2ZFa3h5?=
 =?utf-8?B?Ym1LbFo5dG1KTWxtcjhIS081RFdyZFdTeDAraTYzeDByYnRjdDIyY0JmQVVz?=
 =?utf-8?B?L3pYNlFwWXgwRjJ3dGRlYllRd2o4T1ZvWWg3dHdULzRkSmJOU2NrN3pZcDJ0?=
 =?utf-8?B?VjVRYVVMT0FxK1ppZFJOUis3OXBFenBvU2lFSlo1aDh5MGVHeFBnNFZsQWVt?=
 =?utf-8?B?VVVuSy9MeHVMMk1XNjdZc0ZOdmJuSkxwL0tLSUMrbHlRTHZKUFNHcHBSZmo0?=
 =?utf-8?B?N2tWVDUxenlkREJlRUNpeXNaVGF4SmRYMkx5WS93TEdYN3ZONGNrNUtWcUpD?=
 =?utf-8?B?eVRrcnBTVnZYZ01paERySHIvMU1DUFdFWXJXYjA3Vjd0bzVTdW03am5STXRW?=
 =?utf-8?B?V1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5BC437B0103D3E4BAC3F3B8B20FBE3D8@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: QJheMwMPtBhLCu/+/+OCc+dMtLO79QpyXZJuJUoYQH/mQdFvqVs/Xb9uBJfD47EG5wwLrFuNBoBERapS8in1OcoeMEufS/DAnO2RTO1SkkTWAK2IX5SHWfgJVnkhsJUPa4T2q9xn8Oq6n5VKIWp/qP+vR8qJVomX1EjttsY5e9nrNA+F0UrOw6IINMfY2gPqlhyGhpbz4abTaWPdMDRxw12XBcniVscFJsPHYspbZrRufEL2V5Nny6IIvSpWtey+NM9URGGVH0dBoektFfZPbL+j+XSlVQwzHZWTn55bi5CG1o9FD9cjPD2MirZSpnZY4ThALW10YjfGsBnhVkJLzxPGrjtneIn4RUGAjgP29DGM3YhyiRuQKNFco5VFRLpkE7fogKlZEioQrvFsJUeoJaxhEMNHCMe/p1QjNnCXBTvwkFe/t6XA+9RrMsxnB8KStAqX8AuYTfS9KCGXz/C6qV1Hmm8lwXNpKTtKsWpl+AlKMCmQk+4xfiYOkAlbAlz3vHsKF3o3Frhbp8qZupJKLbbTOWctWP/aUIyLQ670x6e0BPyfjCm59QdzGXf6F1Le8rO12mVYAzoaTK2CY/92qcghg40x7etviVik3qoWUhS0MaENrVNtQoeOz+qqrwBVzMNJel/3dh4Pv89XB0Gm1XcAvrS8AitmNLxrIPkTrVs9OPi8gIjaxzAmPjvKYvK5/hs4kuVoYTFw/sDjffyyI4gKRdsWS8ZKqeQDXBoFcDOjs4tDMcCoWnCjpQYW5Fora+sREkt2j3ssT6J+eCtEUmGsLVmWs1e8IJ3gvumHC1AcFzbcN976cwrzhFN41zmMLpiMk9vsOfdeJoVNOviRL/4UPBTxoogyhTvt1pEq3eQ=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e73b6071-6552-4dbf-113a-08daffd3ef85
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2023 19:31:34.7691
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VobuM1xKuniaayJ8pCxiaKhtN+WeXxS4DqelcxPuFko5ULgAPkXEBJDJTEs7hFDw26yMf/6HOYumoLsbl3JUBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4387
X-Proofpoint-GUID: jFIXVoGCZslaUdQti2ARp4RekNdRk-9Z
X-Proofpoint-ORIG-GUID: jFIXVoGCZslaUdQti2ARp4RekNdRk-9Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-26_09,2023-01-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 mlxlogscore=975 spamscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301260182
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVGh1LCBKYW4gMjYsIDIwMjMsIERhbiBTY2FsbHkgd3JvdGU6DQo+IEhpIFRoaW5oDQo+IA0K
PiBPbiAyNi8wMS8yMDIzIDAwOjIwLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4gT24gVHVlLCBK
YW4gMjQsIDIwMjMsIERhbiBTY2FsbHkgd3JvdGU6DQo+ID4gPiBIaSBUaGluaA0KPiA+ID4gDQo+
ID4gPiANCj4gPiA+IEknbSB0cnlpbmcgdG8gdXBkYXRlIHRoZSBEV0MzIGRyaXZlciB0byBhbGxv
dyB0aGUgc3RhdHVzIHBoYXNlIG9mIGENCj4gPiA+IHRyYW5zYWN0aW9uIHRvIGJlIGV4cGxpY2l0
OyBtZWFuaW5nIHRoZSBnYWRnZXQgZHJpdmVyIGhhcyB0aGUgY2hvaWNlIHRvDQo+ID4gPiBlaXRo
ZXIgQWNrIG9yIFN0YWxsIF9hZnRlcl8gdGhlIGRhdGEgcGhhc2Ugc28gdGhhdCB0aGUgY29udGVu
dHMgb2YgdGhlIGRhdGENCj4gPiA+IHBoYXNlIGNhbiBiZSB2YWxpZGF0ZWQuIEkgdGhvdWdodCB0
aGF0IEkgc2hvdWxkIGJlIGFibGUgdG8gYWNoaWV2ZSB0aGlzIGJ5DQo+ID4gPiBwcmV2ZW50aW5n
IGR3YzNfZXAwX3hmZXJub3RyZWFkeSgpIGZyb20gY2FsbGluZyBkd2MzX2VwMF9kb19jb250cm9s
X3N0YXR1cygpDQo+ID4gPiAocmVseWluZyBvbiBhbiAiZXhwbGljaXRfc3RhdHVzIiBmbGFnIGFk
ZGVkIHRvIHRoZSB1c2JfcmVxdWVzdCB0byBkZWNpZGUNCj4gPiA+IHdoZXRoZXIgb3Igbm90IHRv
IGRvIHNvKSBhbmQgdGhlbiBjYWxsaW5nIGl0IG1hbnVhbGx5IGxhdGVyIG9uY2UgdGhlIGRhdGEN
Cj4gPiA+IHBoYXNlIHdhcyB2YWxpZGF0ZWQgYnkgdGhlIGdhZGdldCBkcml2ZXIgKG9yIGluZGVl
ZCB1c2Vyc3BhY2UpLiBBIHZlcnkNCj4gPiA+IGJhcmVib25lcyB2ZXJzaW9uIG9mIG15IGF0dGVt
cHQgdG8gZG8gdGhhdCBsb29rcyBsaWtlIHRoaXM6DQo+ID4gPiANCj4gPiBXZSBzaG91bGRuJ3Qg
ZG8gdGhpcy4gQXQgdGhlIHByb3RvY29sIGxldmVsLCB0aGVyZSBtdXN0IGJlIGJldHRlciB3YXlz
DQo+ID4gdG8gZG8gaGFuZHNoYWtlIHRoYW4gcmVseWluZyBvbiBwcm90b2NvbCBTVEFMTCBfYWZ0
ZXJfIHRoZSBkYXRhIHN0YWdlLg0KPiA+IE5vdGUgdGhhdCBub3QgYWxsIGNvbnRyb2xsZXJzIHN1
cHBvcnQgdGhpcy4NCj4gDQo+IA0KPiBNYXliZSBJJ20gbWlzdW5kZXJzdGFuZGluZywgYnV0IGlz
bid0IHRoaXMgaG93IHRoZSBVU0Igc3BlYyBleHBlY3RzIGl0IHRvDQo+IHdvcms/IFJlYWRpbmcg
IlJlcG9ydGluZyBTdGF0dXMgUmVzdWx0cyAoOC41LjMuMSkiIGluIHRoZSBVU0IgMi4wIHNwZWMg
Zm9yDQo+IHRoZSBzdGF0dXMgc3RhZ2UgaW4gYSBjb250cm9sIHdyaXRlIGl0IHNheXMgIlRoZSBm
dW5jdGlvbiByZXNwb25kcyB3aXRoDQo+IGVpdGhlciBhIGhhbmRzaGFrZSBvciBhIHplcm8tbGVu
Z3RoIGRhdGEgcGFja2V0IHRvIGluZGljYXRlIGl0cyBjdXJyZW50DQo+IHN0YXR1cyIsIGFuZCB0
aGUgaGFuZHNoYWtlIGNhbiBiZSBlaXRoZXIgU1RBTEwgb3IgTkFLLiBJZiB3ZSBjYW4ndCBkbyB0
aGlzLA0KPiBob3cgZWxzZSBjYW4gd2UgaW5kaWNhdGUgdG8gdGhlIGhvc3QgdGhhdCB0aGUgZGF0
YSBzZW50IGR1cmluZyBhIGNvbnRyb2wgb3V0DQo+IHRyYW5zZmVyIGlzIGluIHNvbWUgd2F5IGlu
dmFsaWQ/DQo+IA0KDQpNeSBjb25jZXJuIGlzIGZyb20gdGhlIGRvY3VtZW50YXRpb24gbm90ZVsq
XSBhZGRlZCBmcm9tIHRoaXMgY29tbWl0Og0KNTc5YzJiNDZmNzQgKCJVU0IgR2FkZ2V0OiBkb2N1
bWVudGF0aW9uIHVwZGF0ZSIpDQoNCkl0IHNob3VsZCBiZSBmaW5lIHdpdGggZHdjMyBjb250cm9s
bGVycy4gRGlkIHlvdSBsb29rIGludG8NCmRlbGF5ZWRfc3RhdHVzPw0KDQpCUiwNClRoaW5oDQoN
ClsqXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2
YWxkcy9saW51eC5naXQvdHJlZS9kcml2ZXJzL3VzYi9nYWRnZXQvdWRjL2NvcmUuYyNuMjU1
