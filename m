Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03E986FBAEF
	for <lists+linux-usb@lfdr.de>; Tue,  9 May 2023 00:13:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233893AbjEHWNg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 8 May 2023 18:13:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229690AbjEHWNe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 8 May 2023 18:13:34 -0400
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23C5419A5
        for <linux-usb@vger.kernel.org>; Mon,  8 May 2023 15:13:32 -0700 (PDT)
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 348JnYmZ025445;
        Mon, 8 May 2023 15:13:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=lcG9GszTisC4BLFd7YbT6ALtP+OggvpubY2ELXPB/Ao=;
 b=ley6HP6taHoEyW4AaT7Z5EAtv25ird6nerTTxezPKmfjaVclpe9Th0pov01mrmugX/Ff
 8iLdu+yl2huUlh/biqYc/oLyo3cVxYHJX3HDPC9mpFvgqDWDDbHo7UGY/YvZnRspCXNV
 omk3+5Rj4ZE1kmOAlkAG0f+aBKp93zZWQqEtkur9YeGcGQYzXh5QgtQyhXzYh3lbJwGX
 kmsq9vBKsE8Jnh/OdNzlMZin2PwwyIe8eadwW8QRxdR1NjQknQYl/PQO3wY4AsXFPch3
 ScWniLhvypq928X1cnpduGBJel+s/YVYTAE49KQ/f8sZ5Y4ux8a/pVqbNJlRhTAiNw0X bg== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3qf7700ntk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 08 May 2023 15:13:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1683584008; bh=lcG9GszTisC4BLFd7YbT6ALtP+OggvpubY2ELXPB/Ao=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=iUdadKbt0CVDdTOcvR765YYcRl9vJAVspebKbOAWWudG1fhibVpZPWM8ng4Wx0ag5
         kLvWIrci+jZzc4eHg0ytbAQfV99EyGG5g0tfSqYRNZwqpXkIEsX65Dk3gjaESV84rg
         hO3MRNBRXk2SEy46WhLNvdd1Fwl2NajqznMar7FnB3jO7B4TFMzqE4tOVqVnSYJkDJ
         4CiR6PCoeKhGTDeLN6AG+GbPzVA2dB4oeG0J54Im9PRs9n98IWH7ESQX3jy/ErvaUh
         OnCfMZYJZKNOserUlrycp31+PEnTH6Tns06didpG9EGYEVpXE4CMtMbOG7WF34Ia42
         Js4OmtaWCZ9zg==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C06C0404D1;
        Mon,  8 May 2023 22:13:27 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 25D89A006D;
        Mon,  8 May 2023 22:13:27 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=XHIHxFid;
        dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 795B740681;
        Mon,  8 May 2023 22:13:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M/wc6QE6AdXCGLE/HfttBRkosYE7fYFX1QVCnSSSEGnI5aBqxeZiv7ECDaOKkdu78cpQSmfMOZpuQAD2MM1qmNWI5+r2HUuTwVQEZAbOl+3ZOa+QBNwV50PokulggU7zF8WU2dREMvvcqm4vDlJJBdemwcy4dzL3tBPm4+1P1dj2RzAZGrPodcyoHJveAxyF2A58v6bPDebK8Iptb9rmeNVU00WZJbNa22u4eltYqoEmLdZY8cep05/GjAZFemuHiv1/Awt2/+F+e/5Aifx0d0MQRgDahm7LA2ZhNGlISJgRaTclw8EEXz3DJU/9JLB6FK+8tXH54sUk+PZ/Hkhptw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lcG9GszTisC4BLFd7YbT6ALtP+OggvpubY2ELXPB/Ao=;
 b=iRgLTNod9eYJGKB0dSxPtsDcEKGiTJ1MnvCGEyENWiG3tnPBrVDhC6y89N1jSqnalgLFhvTOdNlprnU33dOYDw6TTpPiu2Me3TG8gwAfD7yM6VMPvxwxJUtfxjoKsBdY4pcqi4ZCmdnX3HPNeJHAk34HQ/tT5W114As77P0lHJICG+Hm+LhCt0nKfYTKA1wfTUNZOixtpoxItdRakMoiLK/r3dYbf0oPBQ/m5S9mWI7pSzZbLyrmK8D57++hjBdLdABWRPkRYcGRXiJANwfwcusQHu6pDBG6tEpNP91JXeoS+aUPhcPrBZ9t44ZOzfHtd7DaFyCE19+vxy/i1B3Iug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lcG9GszTisC4BLFd7YbT6ALtP+OggvpubY2ELXPB/Ao=;
 b=XHIHxFidE8X4fGTejduZwW/h7+eHSQJZ1jSz+UiQS1Ujm5PQp+pVlnuG5t45d18oCja+SZPoNm4JyuStD7e8CcjyNT6ORh/jmBnx3nGMWn9nT92mmwaFyVVJnnY/tiSkeiU+JeG4v7pNAwsFENJnaSiC83LaIR6dHw4Zr6eTGvI=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by DM4PR12MB7669.namprd12.prod.outlook.com (2603:10b6:8:106::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 22:13:23 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::bb79:9aea:e237:688c]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::bb79:9aea:e237:688c%7]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 22:13:23 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v6] usb: dwc3: fix gadget mode suspend interrupt handler
 issue
Thread-Topic: [PATCH v6] usb: dwc3: fix gadget mode suspend interrupt handler
 issue
Thread-Index: AQHZfvPS7HdhOwEuuEGw/l7NE0fH5q9MZmKAgAM8pgCAAVOoAA==
Date:   Mon, 8 May 2023 22:13:22 +0000
Message-ID: <20230508221320.m5donpfzn5dcnha6@synopsys.com>
References: <20230505014902.27313-1-quic_linyyuan@quicinc.com>
 <20230506003149.obpauq727sgmiobe@synopsys.com>
 <fb2162fb-f3b4-0af1-387b-b07770a4c39e@quicinc.com>
In-Reply-To: <fb2162fb-f3b4-0af1-387b-b07770a4c39e@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|DM4PR12MB7669:EE_
x-ms-office365-filtering-correlation-id: cbc520de-86bd-48ed-8f50-08db50117043
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dVJzDUiyFRQA4nTUxGWgLgRIBVvLh/lLxzsf6yitmtS+5Wbr7FJ+8P+rqI0LfJhGF2CXba2IySZfLBu3lsjGzypAq3keBh1DsLayqZZMSZKxoJo9Tx3K1Ld3HtLSNAoMN9RqCrAppF+wQxwV5pcW1VJ9FG4HsTvnZz8uvZCwqPbd5ujJ1M95SaU8penJ0nnvFruKOAnfMmDtr+XHDBgZrcYkwaYlyPbOBv0Twog/S9qV3y+F1y0maskO8O5HLPWuv6DXaVz8iJCpyygDCnSkN3+yWeV8JL39HAta3hEDbj+9pe0R13cvyUE1yQubNvf5AJ9kvG/JV2WMxUjtOUzy8XLXL9FV8cNQEQXeh44lUCCqTmOdG5EYteIivRZJ96WiCiXM4/bjX2DbQVOR+i/QCUKDCQzwme8nri3VvGWtGDvrjHBw4xJOCjSq8gcFPBuWwFdN/G2Rrmm2ZIOomZMPZXFVIYlVbAmmamJTgZgGpOPHRbT8e9yccxW1cr9zCrhiYocHdRyaXSg9r5E5sSdtIoTYIiQo+uMNF84PIPplXigPJJzohsCyaS5Sn190Yz3jYx1eS7KlrKnvpCERZgl/NaqXuw2E5kPz0W+vsW4Uy46PWMaDyF9gf77vvYREGkJngaP8Wrg248Hu3uWS0gvglQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(396003)(366004)(376002)(39850400004)(451199021)(6486002)(6916009)(66476007)(66556008)(64756008)(66446008)(966005)(66946007)(4326008)(76116006)(316002)(54906003)(36756003)(86362001)(83380400001)(2616005)(1076003)(6506007)(186003)(26005)(6512007)(53546011)(41300700001)(71200400001)(5660300002)(15650500001)(478600001)(8676002)(2906002)(38070700005)(122000001)(8936002)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S2xNRFM1OUtsT3MzaDlnbzdsWjJuM2VrOEMyVm5qOGxnN2VKMThiQ2hGRXVX?=
 =?utf-8?B?b1BCUnlhcC9OdHQyNGcvSnEvTUtyTE14NUpQTnloOGJMb2MybXFldXFMOFpk?=
 =?utf-8?B?SWVZdkczTDVrM0J4bHpzb294NGVCMFV6VW9WZGVSVmVvVkgxellad3ZIengv?=
 =?utf-8?B?eDZ6U2VhR2ZLRTdBVDVwb2p2a240dzAvNDlMTmdCZUtnOHBQckdPVTZnZGp3?=
 =?utf-8?B?OVQ2K3U5bkZ3VnM3NWdjUWtMM1dJeXhYd1o2K1dXa09PRkVFZ2VCRUlvQmRX?=
 =?utf-8?B?WmlQK3VWMjJRYUVrZG9YdFAwbDlOeFdiY1JmUmJESG00NUZPcnpqZ1pmTTh6?=
 =?utf-8?B?bXFvWFRTSVdxWWxLcEJSNi9NS1RZbG1JRUlIRnZEMU5FdGV4TTJQWHRHaDdV?=
 =?utf-8?B?UnZ6MmtOMlhVaC9CNDh0UDBIY2ZYQllhLytiSlJPemNZZWYrODVGRE9lTGw2?=
 =?utf-8?B?WlBsajViUXpzL2NqeVRRRHZZUXpGNUtrbFkrRGRpWE8rNEl5VStiZGRlUVVa?=
 =?utf-8?B?MWJZdFhSV1FlM1pTVFBuc2hCNkRpS1BlL1ZUWTN6RGY0RE9uQ1NyaWdLZ0U4?=
 =?utf-8?B?M0ZNYzY2aktkM01IZ2pUQXFHZnE0Y2IxQkZnNXFYNkZtS2lrdXVKVzRWanRF?=
 =?utf-8?B?L0FsdnRrdWZ1QngzV0ZXU2tqWmthdzdXTDJ3a0VxckMyeWJnYjAzN0l3bWNG?=
 =?utf-8?B?YW1pUjFSSGE2bUd2TDdmOE5RWFFjT2NkWDh3TVk4NzRKbHFuZldRakgzS0hL?=
 =?utf-8?B?cFpNdDRMUG8wdkJJSmJueDJZd2FFaml5MWRmaWlBRkI2am8vc20weDkvSDBw?=
 =?utf-8?B?OE5ONE9Wbmczcko3ck11YkhQM3VpaEYreUlzeFJmZm5HRXZPZ0toNjBtUXpH?=
 =?utf-8?B?VG0zanJpUkFQTXlQNjRTdmRWaEdIRlJKcG9Jd25FTEJoSW92ODBVdjZOM01B?=
 =?utf-8?B?WEcxWStOWDRHRkRleGpWR0w4Y1BHT2Y2UnhCV0VIZzdNM05mdzFONkhvdnVq?=
 =?utf-8?B?d0c1V1VlVFNrRVAvaHZrZmZEMWJaTWc4LzNjV1AwUlI0WVB2dkxRYzY0YjRM?=
 =?utf-8?B?c0pJYjVuK3lqWVA2eG1mZTRnYUNQbVFNcnpUVlJRc2pTZWpCeXpyREN3dS9h?=
 =?utf-8?B?ZEYwRDhtaEg3ZlJJSE9OMURBUVNiNkdpNGFuRlhpTnpNYmFCd0ZDbW9sVG52?=
 =?utf-8?B?ZEVMeThvM0JROWprQTNmam45SUFaYldwUnZMSjZvRGZyMjBzbDFDR2F1azJp?=
 =?utf-8?B?Nm1KbXppWkF4ZkRVWDgxUFZvbHlkOVhWaVNidWhtWnJjVDBET1l2REhNWk5X?=
 =?utf-8?B?L3l0MVFobkF3NG05NG5NcWtWRUJJY2NUWHhqZmZYWHZzM1NpaHA1OE15eWd3?=
 =?utf-8?B?K3JHSHo5aElqZXdwU28rSTB2KzBqUXBVaGJBUlVJM0llL29tQjJZQndwcUFz?=
 =?utf-8?B?Ty9ISzhhRFcxZWlFRG1TOHNNUVptUER0TklYQUVINkc3NDdHYXBEOG9na2R2?=
 =?utf-8?B?TnJQNndFaXQxUHJTZU04b0FEeTJ1bUJxSkFOWS9SSlAyaHJZK0M4N0xQM25B?=
 =?utf-8?B?c3ZjbHZkUTg0Z1h6WXlsTEhOdVlKZ3NCMHliN3VwSm44S3VyTVpWRmFsbURF?=
 =?utf-8?B?Z3BjTnlacWkwSnFPODVBVFpab1ZXR3RscnpibVljYWIrejliZ3NnVzBJQS9Z?=
 =?utf-8?B?WVlINzFnMmJxUEtPYm9sQkNuK2JYc0lMQ0hoYWk2QzBpOWRsVjY1QnYxbHhI?=
 =?utf-8?B?aDd6Z2g0dWNySGxncFRtZVZSSDFvbkJPQWJjWXQyNnZ3NmNwcnBhSHc3RjBW?=
 =?utf-8?B?YTBVa1ZqZVhFVUZ2UlpsMHVwTys4VmQvSEVlV3NUaExzRVF1Wi9VZjhuY2pm?=
 =?utf-8?B?RmxweEZtMVI0OWRKVVhQSUtWZ3Q1WVJkdTNEdVBnN3IwTXROK1B3MThLNEdZ?=
 =?utf-8?B?V28zbUtxQi9sQ1ZDNW9oNENyN3BoRjcxbTVkWlpENG5VSWdCNWZCMHVKRG45?=
 =?utf-8?B?TytvY3JoY0sxYWgwOVQyYS9tcEYzZGV4SlJOTDRWVjJjc3Q2NENteUxrcHpv?=
 =?utf-8?B?TUpjMXNVRFk1dzJub0NDcGhiY0lRSk5XeGdsMWQwc25UUEFHQVlqcGNtOS9B?=
 =?utf-8?Q?ufwcWgli59/e4vr73k8/CU2Cs?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <77F99C3B5C31CF47A587E33AF53E122D@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: EZmO+6F2+HVYZ3jDEES+cRl5kbwIlGc093Y+6/MOff5mTzhmMbYCppIrCdKJ0kW7IU5W9/ZMZrRfhsQBA6hAFOOiNtKeuMa6xIn2pUOeuGt93JJNTkE88mCc7v4a26efGF1LMBdy2Zp5+HiJ6PAKGSRHjgIbSGKo8YPlON2cfYTB8h+jc9vkiZejf8qxt24FgzAqSQ6e2t3pYuQzJqyj+rGp25PAlSH6o9b5WSXX7uHkdNO1SqRJUGGnStT7m7hFKJpK795v26cGu/F2Wy9zDTSklkRcahQaQGo9naz0f48W49bRL3q69wr5O4/Xk1HNyZfIAaXVwJVgzmtIZo8AGuwaUGfqw3C/71eVnOgg/FC5XwdTq7GI9y0/HMVmrNGPM6oDpBjb2WSdMqXD280Sgm80WjP1C3rtYbHg/2zBWJ1JcKyYdM/Gk7+XsaApr5EA5nQM9817Rd3CRH/VUWVk4OiN8XuqnQYFDnetYGKMuHy9OrlBbE6+x4F3X6AZC9iHGTKY+KIHPjLs5PzyYyxq8wTNQLVb5FNy2/NfEkrBLNSaCzbJT5aLAqvKZXVzo6kyvedA+rBjnvCa6ZUhFvxwf/c6viW8Mt9kNx0MRPcAhjY0heIL3KxSj/uHM+ou/9MWs840Djl2wxVmhtgsJQobjzj6Mx8N3kndY4Ko0dQH66WpyXmMDfokSD5a9r1GwjEPVLcBBsWJjwcZlMmwo9H9N9KtnEnAgkGlwPPTkZVBTDiuWbHAB/hPJ8AHpPqAYIJqza7MDPIWpiLRs89v36i8r43xP9TlvKZHtxDc5Sp3pcacCbckXFMwdiNG9bXreQMrKV9IP8hbMCSvCd7167suq9d2XhFm3uUIcvblpjO8SUKkmjS8GqtEOiFgGXZkthMJ1k3F0DHptjjN5gJyzJizdA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbc520de-86bd-48ed-8f50-08db50117043
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2023 22:13:23.0747
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RJpSQoAuOpjHtDMXCrv1pbcCX7Xl2gytZe4f2EjuBZxRPPRILgJJv3rCJUX2xlbydLFoLPRCD4fOvoKbCt6mLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7669
X-Proofpoint-GUID: qMXC9zDr5d5ruOuRZX3I7pVIBi1cVVt8
X-Proofpoint-ORIG-GUID: qMXC9zDr5d5ruOuRZX3I7pVIBi1cVVt8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-08_16,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 mlxscore=0
 impostorscore=0 mlxlogscore=999 clxscore=1015 phishscore=0 suspectscore=0
 spamscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305080147
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gTW9uLCBNYXkgMDgsIDIwMjMsIExpbnl1IFl1YW4gd3JvdGU6DQo+IA0KPiBPbiA1LzYvMjAy
MyA4OjMyIEFNLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4gT24gRnJpLCBNYXkgMDUsIDIwMjMs
IExpbnl1IFl1YW4gd3JvdGU6DQo+ID4gPiBXaGVuIHdvcmsgaW4gZ2FkZ2V0IG1vZGUsIGN1cnJl
bnRseSBkcml2ZXIgZG9lc24ndCB1cGRhdGUgc29mdHdhcmUgbGV2ZWwNCj4gPiA+IGxpbmtfc3Rh
dGUgY29ycmVjdGx5IGFzIGxpbmsgc3RhdGUgY2hhbmdlIGV2ZW50IGlzIG5vdCBlbmFibGVkIGZv
ciBtb3N0DQo+ID4gPiBkZXZpY2VzLCBpbiBmdW5jdGlvbiBkd2MzX2dhZGdldF9zdXNwZW5kX2lu
dGVycnVwdCgpLCBpdCB3aWxsIG9ubHkgcGFzcw0KPiA+ID4gc3VzcGVuZCBldmVudCB0byBVREMg
Y29yZSB3aGVuIHNvZnR3YXJlIGxldmVsIGxpbmsgc3RhdGUgY2hhbmdlcywgc28gd2hlbg0KPiA+
ID4gaW50ZXJydXB0IGdlbmVyYXRlZCBpbiBzZXF1ZW5jZXMgb2Ygc3VzcGVuZCAtPiByZXNldCAt
PiBjb25uZG9uZSAtPg0KPiA+ID4gc3VzcGVuZCwgbGluayBzdGF0ZSBpcyBub3QgdXBkYXRlZCBk
dXJpbmcgcmVzZXQgYW5kIGNvbm5kb25lLCBzbyBzZWNvbmQNCj4gPiA+IHN1c3BlbmQgaW50ZXJy
dXB0IGV2ZW50IHdpbGwgbm90IHBhc3MgdG8gVURDIGNvcmUuDQo+ID4gPiANCj4gPiA+IFJlbW92
ZSBsaW5rX3N0YXRlIGNvbXBhcmUgaW4gZHdjM19nYWRnZXRfc3VzcGVuZF9pbnRlcnJ1cHQoKSBh
bmQgYWRkIGENCj4gPiA+IHN1c3BlbmRlZCBmbGFnIHRvIHJlcGxhY2UgdGhlIGNvbXBhcmUgZnVu
Y3Rpb24uDQo+ID4gPiANCj4gPiA+IFNpZ25lZC1vZmYtYnk6IExpbnl1IFl1YW4gPHF1aWNfbGlu
eXl1YW5AcXVpY2luYy5jb20+DQo+ID4gPiAtLS0NCj4gPiA+IHY2OiAocmVmZXIgdjUgaHR0cHM6
Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXVzYi8x
NjgyNDc2NzgwLTIzNjctMS1naXQtc2VuZC1lbWFpbC1xdWljX2xpbnl5dWFuQHF1aWNpbmMuY29t
L19fOyEhQTRGMlI5R19wZyFkSVEyVkhjY21aVFhwMS01OWhURmZFaGM2NVcwZ2F0ZjFuMndtQmZz
NVliMGlwakhrc0RfRVNRU21nWGt5MW8xc2M0d0VaNXFwOUpLVjdJS21rNUttNGJKemkycEdnJCAp
DQo+ID4gPiAxKSBjaGFuZ2Ugc3ViamVjdA0KPiA+ID4gMikgb25seSBrZWVwIHN1c3BlbmRlZCBm
bGFnIHJlbGF0ZWQgY2hhbmdlDQo+ID4gPiANCj4gPiA+IHY1OiAocmVmZXIgdjQgaHR0cHM6Ly91
cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXVzYi8xNjgy
MzkzMjU2LTE1NTcyLTEtZ2l0LXNlbmQtZW1haWwtcXVpY19saW55eXVhbkBxdWljaW5jLmNvbS9f
XzshIUE0RjJSOUdfcGchZElRMlZIY2NtWlRYcDEtNTloVEZmRWhjNjVXMGdhdGYxbjJ3bUJmczVZ
YjBpcGpIa3NEX0VTUVNtZ1hreTFvMXNjNHdFWjVxcDlKS1Y3SUttazVLbTRaWG1zS1N2USQgKQ0K
PiA+ID4gMSkgcmVuYW1lIHN1c3BlbmRfaXJxX2hhcHBlbiB0byBzdXNwZW5kZWQgYW5kIGRvY3Vt
ZW50IGl0DQo+ID4gPiAyKSBhZGQgb2xkX2xpbmtfc3RhdGUgZm9yIGxpbmsgY2hhbmdlIGludGVy
cnVwdCB1c2FnZSBhbmQgY2hhbmdlIGFjY29yZGluZ2x5DQo+ID4gPiANCj4gPiA+IHY0OiAocmVm
ZXIgdjMgaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xpbnV4LXVzYi8xNjgyMDUzODYxLTIxNzM3LTEtZ2l0LXNlbmQtZW1haWwtcXVpY19saW55eXVh
bkBxdWljaW5jLmNvbS9fXzshIUE0RjJSOUdfcGchZElRMlZIY2NtWlRYcDEtNTloVEZmRWhjNjVX
MGdhdGYxbjJ3bUJmczVZYjBpcGpIa3NEX0VTUVNtZ1hreTFvMXNjNHdFWjVxcDlKS1Y3SUttazVL
bTRhcVdOVWgtUSQgKQ0KPiA+ID4gMSkgcmVtb3ZlIGxpbmsgc3RhdGUgY2hlY2tpbmcgaW4gZHdj
M19nYWRnZXRfd2FrZXVwX2ludGVycnVwdCgpDQo+ID4gPiAyKSByZW1vdmUgdHdvIHN3aXRjaC9j
YXNlIHRvIGlmIG9wZWFydGlvbg0KPiA+ID4gDQo+ID4gPiB2MzogKHJlZmVyIHYyIGh0dHBzOi8v
dXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC11c2IvMTY4
MjA0MjQ3Mi0yMTIyMi0xLWdpdC1zZW5kLWVtYWlsLXF1aWNfbGlueXl1YW5AcXVpY2luYy5jb20v
X187ISFBNEYyUjlHX3BnIWRJUTJWSGNjbVpUWHAxLTU5aFRGZkVoYzY1VzBnYXRmMW4yd21CZnM1
WWIwaXBqSGtzRF9FU1FTbWdYa3kxbzFzYzR3RVo1cXA5SktWN0lLbWs1S200YlJtbjBITkEkICkN
Cj4gPiA+IG5vIGNvZGUgY2hhbmdlIHNpbmNlIHYyLCBjaGFuZ2VzIGNvbXBhcmUgdjEgYXMgYmVs
b3csDQo+ID4gPiAxKSBhZGQgYSBmbGFnIHN1c3BlbmRfaXJxX2hhcHBlbiB0byBzaW1wbGlmeSBk
d2MzX2dhZGdldF9zdXNwZW5kX2ludGVycnVwdCgpLA0KPiA+ID4gICAgIGl0IHdpbGwgYXZvaWQg
cmVmZXIgdG8gc29mdHdhcmUgbGV2ZWwgbGlua19zdGF0ZSwgZmluYWxseSBsaW5rX3N0YXRlIHdp
bGwNCj4gPiA+ICAgICBvbmx5IHVzZWQgaW4gZHdjM19nYWRnZXRfbGlua3N0c19jaGFuZ2VfaW50
ZXJydXB0KCkuDQo+ID4gPiAyKSByZW1vdmUgc3cgc2V0dGluZyBvZiBsaW5rX3N0YXRlIGluIGR3
YzNfZ2FkZ2V0X2Z1bmNfd2FrZXVwKCkNCj4gPiA+IDMpIGFkZCBkd2MzX2dhZGdldF9pbnRlcnJ1
cHRfZWFybHkoKSB0byBjb3JyZWN0IHNldHRpbmcgb2YgbGlua19zdGF0ZQ0KPiA+ID4gICAgIGFu
ZCBzdXNwZW5kX2lycV9oYXBwZW4uDQo+ID4gPiANCj4gPiA+IHYyOiB1cGRhdGUgYWNjb3JkaW5n
IHYxIGRpc2N1c3Npb24NCj4gPiA+IHYxOiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtdXNiLzE2NzUyMjEyODYtMjM4MzMtMS1naXQtc2Vu
ZC1lbWFpbC1xdWljX2xpbnl5dWFuQHF1aWNpbmMuY29tL19fOyEhQTRGMlI5R19wZyFkSVEyVkhj
Y21aVFhwMS01OWhURmZFaGM2NVcwZ2F0ZjFuMndtQmZzNVliMGlwakhrc0RfRVNRU21nWGt5MW8x
c2M0d0VaNXFwOUpLVjdJS21rNUttNFpCbl9UUEV3JA0KPiA+ID4gDQo+ID4gPiAgIGRyaXZlcnMv
dXNiL2R3YzMvY29yZS5oICAgfCAyICsrDQo+ID4gPiAgIGRyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0
LmMgfCA3ICsrKysrKy0NCj4gPiA+ICAgMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkNCj4gPiA+IA0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3
YzMvY29yZS5oIGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmgNCj4gPiA+IGluZGV4IGQ1NjQ1N2Mw
Mjk5Ni4uZWZhY2FhY2JiZWIyIDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9j
b3JlLmgNCj4gPiA+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5oDQo+ID4gPiBAQCAtMTEx
Niw2ICsxMTE2LDcgQEAgc3RydWN0IGR3YzNfc2NyYXRjaHBhZF9hcnJheSB7DQo+ID4gPiAgICAq
IEBkaXNfbWV0YXN0YWJpbGl0eV9xdWlyazogc2V0IHRvIGRpc2FibGUgbWV0YXN0YWJpbGl0eSBx
dWlyay4NCj4gPiA+ICAgICogQGRpc19zcGxpdF9xdWlyazogc2V0IHRvIGRpc2FibGUgc3BsaXQg
Ym91bmRhcnkuDQo+ID4gPiAgICAqIEB3YWtldXBfY29uZmlndXJlZDogc2V0IGlmIHRoZSBkZXZp
Y2UgaXMgY29uZmlndXJlZCBmb3IgcmVtb3RlIHdha2V1cC4NCj4gPiA+ICsgKiBAc3VzcGVuZGVk
OiBzZXQgaWYgc3VzcGVuZCBpcnEgaGFwcGVuIHRvIGF2b2lkIHBvc3NpYmxlIGNvbnNlY3RpdmUg
c3VzcGVuZC4NCj4gPiBDYW4gd2UgcmVwaHJhc2UgdG86ICJzZXQgdG8gdHJhY2sgc3VzcGVuZCBl
dmVudCBkdWUgdG8gVTMvTDIiDQo+IA0KPiANCj4gdGhhbmtzLCBzdXJlLg0KPiANCj4gDQo+ID4g
DQo+ID4gPiAgICAqIEBpbW9kX2ludGVydmFsOiBzZXQgdGhlIGludGVycnVwdCBtb2RlcmF0aW9u
IGludGVydmFsIGluIDI1MG5zDQo+ID4gPiAgICAqCQkJaW5jcmVtZW50cyBvciAwIHRvIGRpc2Fi
bGUuDQo+ID4gPiAgICAqIEBtYXhfY2ZnX2VwczogY3VycmVudCBtYXggbnVtYmVyIG9mIElOIGVw
cyB1c2VkIGFjcm9zcyBhbGwgVVNCIGNvbmZpZ3MuDQo+ID4gPiBAQCAtMTMzMiw2ICsxMzMzLDcg
QEAgc3RydWN0IGR3YzMgew0KPiA+ID4gICAJdW5zaWduZWQJCWRpc19zcGxpdF9xdWlyazoxOw0K
PiA+ID4gICAJdW5zaWduZWQJCWFzeW5jX2NhbGxiYWNrczoxOw0KPiA+ID4gICAJdW5zaWduZWQJ
CXdha2V1cF9jb25maWd1cmVkOjE7DQo+ID4gPiArCXVuc2lnbmVkCQlzdXNwZW5kZWQ6MTsNCj4g
PiA+ICAgCXUxNgkJCWltb2RfaW50ZXJ2YWw7DQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91
c2IvZHdjMy9nYWRnZXQuYyBiL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4gPiA+IGluZGV4
IGMwY2E0ZDEyZjk1ZC4uMmM3NTA1MzRiNDA1IDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy91
c2IvZHdjMy9nYWRnZXQuYw0KPiA+ID4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYw0K
PiA+ID4gQEAgLTQzMDMsOCArNDMwMywxMCBAQCBzdGF0aWMgdm9pZCBkd2MzX2dhZGdldF9zdXNw
ZW5kX2ludGVycnVwdChzdHJ1Y3QgZHdjMyAqZHdjLA0KPiA+ID4gICB7DQo+ID4gPiAgIAllbnVt
IGR3YzNfbGlua19zdGF0ZSBuZXh0ID0gZXZ0aW5mbyAmIERXQzNfTElOS19TVEFURV9NQVNLOw0K
PiA+ID4gLQlpZiAoZHdjLT5saW5rX3N0YXRlICE9IG5leHQgJiYgbmV4dCA9PSBEV0MzX0xJTktf
U1RBVEVfVTMpDQo+ID4gPiArCWlmICghZHdjLT5zdXNwZW5kZWQgJiYgbmV4dCA9PSBEV0MzX0xJ
TktfU1RBVEVfVTMpIHsNCj4gPiA+ICsJCWR3Yy0+c3VzcGVuZGVkID0gdHJ1ZTsNCj4gPiA+ICAg
CQlkd2MzX3N1c3BlbmRfZ2FkZ2V0KGR3Yyk7DQo+ID4gPiArCX0NCj4gPiA+ICAgCWR3Yy0+bGlu
a19zdGF0ZSA9IG5leHQ7DQo+ID4gPiAgIH0NCj4gPiA+IEBAIC00MzEyLDYgKzQzMTQsOSBAQCBz
dGF0aWMgdm9pZCBkd2MzX2dhZGdldF9zdXNwZW5kX2ludGVycnVwdChzdHJ1Y3QgZHdjMyAqZHdj
LA0KPiA+ID4gICBzdGF0aWMgdm9pZCBkd2MzX2dhZGdldF9pbnRlcnJ1cHQoc3RydWN0IGR3YzMg
KmR3YywNCj4gPiA+ICAgCQljb25zdCBzdHJ1Y3QgZHdjM19ldmVudF9kZXZ0ICpldmVudCkNCj4g
PiA+ICAgew0KPiA+ID4gKwlpZiAgKGV2ZW50LT50eXBlICE9IERXQzNfREVWSUNFX0VWRU5UX1NV
U1BFTkQpDQo+ID4gTWlub3Igbml0OiBzcGFjaW5nIGJldHdlZW4gaWYgYW5kICguDQo+IA0KPiAN
Cj4gdGhhbmtzIGZvciBwb2ludCBpdCBvdXQuDQo+IA0KPiANCj4gPiANCj4gPiBXaGlsZSB0aGlz
IG1heSB3b3JrIGJlY2F1c2UgdGhlIG5leHQgc3VzcGVuZCBldmVudCB3b24ndCBjb21lIHVudGls
IGENCj4gPiByZXN1bWUvcmVzZXQvZGlzY29ubmVjdCBldmVudCBvY2N1ciwgbGV0J3MgY2xlYXIg
dGhpcyBvbmx5IG9uIHJlc2V0LA0KPiA+IHJlc3VtZSwgYW5kIGRpc2Nvbm5lY3QgZXZlbnRzLg0K
PiANCj4gDQo+IHNlZW0gb25seSBjbGVhciBvbiB0aGVzZSB0aHJlZSBldmVudHMgaXMgbm90IGNv
cnJlY3QuDQo+IA0KPiBob3cgYWJvdXQgc3VzcGVuZCAtPiB3YWtldXAgLT4gc3VzcGVuZCBpbnRl
cnJ1cHQgc2VxdWVuY2VzID8NCj4gDQo+IHRoaXMgaXMgbWVudGlvbmVkIGluIFYxLg0KPiANCj4g
DQoNCkkgbWVhbnQgIldha2V1cCIgZXZlbnQsIHRoZXJlJ3Mgbm8gcmVzdW1lIGV2ZW50LiBXaGVu
IHRoZSBob3N0IHNlbmRzIGENCnJlc3VtZSBzaWduYWwgYW5kIHRoZSBkZXZpY2UgaXMgYWJsZSB0
byBwcm9jZXNzIGl0LCB0aGVuIHRoZSBkcml2ZXIgZ2V0cw0KdGhlIFdha2V1cCBldmVudC4NCg0K
VGhhbmtzLA0KVGhpbmg=
