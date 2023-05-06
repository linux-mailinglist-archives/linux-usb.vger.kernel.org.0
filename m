Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 764686F8E20
	for <lists+linux-usb@lfdr.de>; Sat,  6 May 2023 04:50:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231839AbjEFCuG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 May 2023 22:50:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbjEFCuD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 May 2023 22:50:03 -0400
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4937B4219
        for <linux-usb@vger.kernel.org>; Fri,  5 May 2023 19:50:02 -0700 (PDT)
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3460dCjZ010650;
        Fri, 5 May 2023 19:49:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=k3coAi2XSrxaRo6K3AR2za0N3y6x6XgLnXaIWfUolsU=;
 b=pmSw2yr23kquX8X+ZWCkQxTSQsWtM+yShhzI2yL48RI1mlShkfAJDut0KvXKSgw9DB09
 tdhEGHeK+fY48EAEtbjct8REM0EuEyG+Z7ksVOXLwt0tZ2vhdIA/Nj7YNc79Vxa1e7ff
 10kKp7YA4uMU9dpYh/FsSmvdV2KoyzkrSZBLBWyvM044HUyHvMGZYaTT0NVMqqu6qAce
 lMusE5zLTGJ1G1PcgLThRbS0tF+z/clQkdf7u71ybhUb4aCH2pe9FCZFnVNBW/+HcGyw
 c6eBsE9S7EJNRZ4GmwlA8bGL3QJCwtpKgAs7HAKWErh3VLlc2iX9Fq9Ll1eOjWY3JEzy tg== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3q928sxkqu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 05 May 2023 19:49:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1683341395; bh=k3coAi2XSrxaRo6K3AR2za0N3y6x6XgLnXaIWfUolsU=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=XxelFf/WJAJ9J2GzXd7z+WP+aWxu9lPqUiXkFMV7lOSIWbpy9Oj/BcKTvlBlMVGF0
         lXsknlZumKCCp4g4vw2UW+xFA8Jgsj0411KZw4gy7HlIpWFwUi2HCngxY7amv2zArg
         wQduptFC+5qriOTXIBJjgzCdhqcBLAaCZfBqVUm2V8e6yLFCAA/bVnMm14hE7SFue/
         K75fiGMoc3NH0eroo87+FCyQ8BGHsrp1xSRxPss8Ii6aVGvyl2u03R42t0KgC3unGR
         bEtKh0pVsWLxrScU3Dk7qoIwOfMIcX2t+xrO7MZabC16I1IY1g2d6VjsZP4dz42sx9
         rNHxOIaBcv9qw==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8090A40522;
        Sat,  6 May 2023 02:49:54 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 7FD16A0063;
        Sat,  6 May 2023 02:49:53 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=ME3WZwCH;
        dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id A4E2940605;
        Sat,  6 May 2023 02:49:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QLsxudVbP4wxFTOl+i7U7WHCqj2UcwphEgiHhhQUMKWrBkYcwxiAoty1/fEfJIdZoaQJkQdD+fo1/fs/s+N6ZXdsmLfAf8EBHIrYaNlFK4WGJGtooW8s2PEb2ae2wrNHx8fqmDZ9iobYwyq6Ixprt2TbEwzmYKogIsW0TJKX1OAGjodRKbf4Kfqux+Q5s3eNbT7zCDCBpefn/nte0v3r5GI50aJPZoMMiVVvSetrkaTGH7D4nKfx/0Em7DrtWzNKBLFf+lMn+i/7clX0eph88M+G96H9N0JpoDa5bWCIFFIrbwhC26AyyMtNR++i488Qk1M32Nwl+fCH1L4y/IEazw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k3coAi2XSrxaRo6K3AR2za0N3y6x6XgLnXaIWfUolsU=;
 b=gJhwZX2ZuHfJN0R+i+tr9r+c7cbFf0iRHqHavT70LHmF92ARgIcyeYDmnIYJAzIf/A6xXTt4/Czr47YaQdGeAlPaYHTOuPDKNsBXKOAl8bLW9ViCT9BleUMApICMhPLlRzzJ5xmedp3R4jH6+lsH3rQg94HJmxqac61Z2uQXy2j/B82/KmjIQhyJrwwSeWuZZZroEGMKsonsj49048iUHuIe1KkeV2ir9cq5S2lhgE3s6LxdgHqZdjKHQNMZIMR6hMbnqEt9ZWuFEIxBXfPau8toBxg+ndgbNVn6KnfgmcidUsTJVyDpZCU0SYkMhMdtkQMcSJHEwr79RjgpwtcDeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k3coAi2XSrxaRo6K3AR2za0N3y6x6XgLnXaIWfUolsU=;
 b=ME3WZwCHImhGYZqrDhudtw36nXj7Yqn29Y9as8yx46iCS5zVf8nfneynurg6VnZysoSAeN/K/xOH//cv/ayg+ubzOoXceevwlz/yjc616zLwrlVIZ8OByCZbDChA4zZgFmJRlIQBOvXl7qnkmANJI3S2/RB1KPcL2cmI/ZOMYnQ=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by DM6PR12MB4233.namprd12.prod.outlook.com (2603:10b6:5:210::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.27; Sat, 6 May
 2023 02:49:49 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::bb79:9aea:e237:688c]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::bb79:9aea:e237:688c%7]) with mapi id 15.20.6363.026; Sat, 6 May 2023
 02:49:48 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Avichal Rakesh <arakesh@google.com>
CC:     "dan.scally@ideasonboard.com" <dan.scally@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "Eino-Ville Talvala (Eddy)" <etalvala@google.com>,
        Jayant Chowdhary <jchowdhary@google.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>
Subject: Re: UVC Gadget Driver shows glitched frames with a Linux host
Thread-Topic: UVC Gadget Driver shows glitched frames with a Linux host
Thread-Index: AQHZbxSLVlNfn9UhSEmoQu3rfa9UjK8viLiAgADE34CAABUTgIAARO8AgADVU4CAADP6gIAAJ4KAgABIVoCAAlnSgIAX7D2AgABFy4A=
Date:   Sat, 6 May 2023 02:49:48 +0000
Message-ID: <20230506024929.4sbrqvyu4kguxugh@synopsys.com>
References: <ZD1ObUuy8deAvupf@kroah.com>
 <3a9ee93a-b0ec-ac92-77ab-2956c1c4f434@google.com>
 <20230418024937.h6mipfdvdqomtz36@synopsys.com>
 <CAMHf4WKzU7uWj5HVHdcBnJ2ugK5cfkk=-38dn7=z1fCwXtegLw@mail.gmail.com>
 <20230418193951.zjwgg25cyhg3lsay@synopsys.com>
 <CAMHf4WKYzmmqO+7AsUBo+d8AHLKFXugxwh__NYi9grQAJk7VBA@mail.gmail.com>
 <47244f7e-feb5-4958-be14-7fd9f0814566@rowland.harvard.edu>
 <CAMHf4WL9dOWiw-+V2DQeQ=3jxmk3LHg5ONdWSwcp3Gx0AD17yg@mail.gmail.com>
 <20230420172011.GF21943@pendragon.ideasonboard.com>
 <0610f776-44c8-4372-975b-52c2a1f0af8d@google.com>
In-Reply-To: <0610f776-44c8-4372-975b-52c2a1f0af8d@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|DM6PR12MB4233:EE_
x-ms-office365-filtering-correlation-id: 256ad6fb-0f7c-4a21-fe01-08db4ddc8ebd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hqdvYFpO81OHpTIAT93s8OeZJw5y6Bq8TY6myldB3bCf1orJD4XTr6SQ3S4cE7UtRz/vp8B+ACuD+uFHlaZBl4koOtItkUvxpk8S9GD5aiVUWoRkOrYW4lonk/zV0H2U+cR92s9jgCdACTcz617a+wVm2M/dfHaCTecF5kaQhET9VnhRRXq1S77ENHMrYAMfi1u+3VywLVTL+vM76mP2vxELAM5gO1QRX82g/niU8y7p4h16gzYTS4+p6EXRvZJcDj3RrhSuSkGOT3LTxgEC5udr1lCa2ssL5GqGpFsOCO/dOcNwHRUsUWvEj22fQ20im+epRUkl1+a3s6CplTrHKvi7ae4jhw6neiqjRjVfQA9afw+h+Gsj+b/3uYxeG1YWOFlcjXNFAF8DlrjThbik/ogru3PN8AuUtA3J+5r9mKlHAxknZxci7Y8z3GgL8dU1Nuu51cW1yxZBgbNsSar6FVi3ZnH1LBgY4Ons5Eo0v02PV+sp5Wo7FfjX0gAahu7cOyZNfKF9hdbHjUygZCmp2AKRjqszo6UuDVVMnkT95pNCNIpe8o+uofHBrUtYzpl/4WdQCcLGjRO++sWwHZZQHdv8JDMy9L8jQ5Mllc2bcqsVg09qZg7sDrmzXzmzWH3B
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(346002)(39860400002)(366004)(136003)(376002)(451199021)(71200400001)(6486002)(478600001)(36756003)(122000001)(38100700002)(2616005)(83380400001)(2906002)(26005)(6512007)(54906003)(6506007)(1076003)(186003)(53546011)(5660300002)(41300700001)(86362001)(8936002)(8676002)(64756008)(6916009)(66476007)(66446008)(66556008)(4326008)(66946007)(38070700005)(76116006)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SjJRSXQvMW15SENrR0pVZkcwMlpiQWZ0WmNReW5JYStzQWF2MEpXRjlrVGVP?=
 =?utf-8?B?MlNYcHltUFUrTUIvZWxPb3Y0Sjh3cG1TVGI3eDI3QVU2cTlHSGs3ZUtPZjNz?=
 =?utf-8?B?ZktjL2NOQkptS0I3TjRwSWUrUHVYU3FtSVZ0eXBTSXRnclJFaURPOXNYVVVm?=
 =?utf-8?B?TXZqWGZqanA1b0FSd0MzVDUvQmplWVVCS3lRVDk5MHhydDYxWWd2VnpPS0pm?=
 =?utf-8?B?WFY2Q2lIRmxjTEhiSFN1cVB5VUp6RWhJMS9vbzArMWI3d21aSnM3a2lsREdw?=
 =?utf-8?B?QkJGLzJXV3p5Q1hkMDNOOVVMUzZwMHlvZGM0dWxPYUZkYWpObituOFpQUzVu?=
 =?utf-8?B?TTR1ZHlCRTJ2dlhGa3hTRzB5ejFrUUJUTGxEY0xzTGRVNFBtdyszdCs1ZWwy?=
 =?utf-8?B?RnFGK01rTk44aFBSNXc4RGdnUjFBVDhtMnNzK2dvcGtLenpYMGwrYlluU0U0?=
 =?utf-8?B?SDFNQ3l1a3daN2ZoRXNnRFVuTVV5WTZUOHpER2dEUnhPd29qeUtDaVB4WjNk?=
 =?utf-8?B?OVQyVkVRamM2dXNSbkVCSnVoR2VBOHJhQTZwNmxRYmVGSlAxSXF4YW1Cd25S?=
 =?utf-8?B?MmhsenQ2Zk9NS2tVOWFnSjlrejF1RCtqd0Z2SHlyQTcrdEtGRGE5WCtFWXp1?=
 =?utf-8?B?ZGs2YmRXbU5Yb3VOL0JaeDUzMGNaREFFVjY5enRJZXZPa2VxblU5dU9RakZ0?=
 =?utf-8?B?NU5OS0ZFV1VwL2NiUkxlU3YzK2NNRjFheEdxVEY1QTE0dmR6ZDJyemxRUkM5?=
 =?utf-8?B?VS9TbHlhR2RSWWh4QWRGV2Y0QkcrcHhxb3hOa05FeVRSdWFVMUpidWF2eksw?=
 =?utf-8?B?VzVKZzhNd2x4MDZERlBXV1BDdU9WdFIvVGJuK3BZTHZKc3pYMjBEZC82bHF3?=
 =?utf-8?B?dE5wT0NRSVQ0REhPNm5uVUdNTWdmMEsxZ3I3OTFlSWsvQzBlOW11VlRGL25j?=
 =?utf-8?B?MC90dk52ZXN6cTVFbmZNK0s5RE5BdTBXd3NzVGF3aGpiMEozZnIzQ1JHMGZ0?=
 =?utf-8?B?NzBPTlBHQzBsNitpQXliMWpvWkRkQVNXU3B6elNRVWlmUlkyL3gzMmJZWVpW?=
 =?utf-8?B?Y2h4YVd1aGdTQVl0TUhWZUdGdTkwQkplZjVhYml3bUk2Z05sazZTYm1xdHFZ?=
 =?utf-8?B?WGhMcWlMQXZYZVRkcGg4WjZGTzlRalJsekFua0VWRUNHMkhGeU1INEk3R3Mx?=
 =?utf-8?B?akZNQlB1Y3pOTGZYOVc3dktpM0s3YkZMRlZXV0hHeGtCUDlWaUJrZXRYSXov?=
 =?utf-8?B?RXB1ZytJeEd6VGJsbDNNMkh0RTFOaGRuNWFDN0dwWDh2QmFPdDI2b1RuV0hY?=
 =?utf-8?B?ekwxd1dKNjdpeW1NVHJsbkFKVEExV1BER2hIWGo0VWx0QmtQRVNBaFB2UHRU?=
 =?utf-8?B?K3dTVDBlZXRINlB2d0FGeW5vUXdUcW5tNSs4MUF2Q3IrYlNEWVpUY2VseWdM?=
 =?utf-8?B?aElWNGNYQ01qSSt5aG1TQW1vUnp3MXRhWEs0U09FSS9tWlVUWHg5dTcvWWtF?=
 =?utf-8?B?eVQzL2wybjgwcFM3OFB5SjZOTVN6WXV2R3JJNXBZTFEvOFJ2V1M1Y3AvVGtX?=
 =?utf-8?B?NUE1MTZnNURrTVhzMXZ5VHhxeTBIR2FEbzFzb2F6Y1dNeDBqcWtLd2dTV3Uw?=
 =?utf-8?B?UzU1SWhuWHNyeHRUWnl4eUsrYjY5eXZTRi9yMVphTHJEeTV3SnNhOVFDdVVu?=
 =?utf-8?B?eVR3QmtnWENET0h3dm1ZY212djZDcjV1UnM5bFFNTFBobXJRK2tYbTRtSVVP?=
 =?utf-8?B?SkxkclEwTm5kKzhSY0RCbnpTWDdxdjBOUk9XSE16M1QzOUhKWWc2ZCtKWXJQ?=
 =?utf-8?B?OWlkMHE0Qk9LSXZhOTBvT3VVN1BmMTIzc2I4c2thOHd6cUowRVREaHVaQnZt?=
 =?utf-8?B?SmNDL3ZJQTY4RmNUWndFbDFZRzNvblczOHI3Q0VCMEY0S3JUeGtsUXlZTjQz?=
 =?utf-8?B?K0ZLZDZDK3dXempjMlRsVG14MHFKWnVleXVoMnJualpnQ2xMTXZSWFkwdjda?=
 =?utf-8?B?WDBZYi9NSkIrK3k1Z1YzQnNVVmxRcHpodXpIVUhJMTA1Sm9EWWZUVlNSWEdY?=
 =?utf-8?B?QTlmN2xXQ0tDUkFlQlRNa25JVHFyV2hYTUgvRDdQWjFaUEVkVWk3N2N4UjVL?=
 =?utf-8?B?cG9zZ3liSEN4Zm1UVVl2czM2ZFZCSmxKZEZodTlqV1lSV28ybEVoKy8rTEFo?=
 =?utf-8?B?WGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7321CDEA46EA7140AF0C12AD1B4B7C52@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?cWRFTER4SWFNdCtYZ1VuNE9aSXh4K0szcERDL2FHeDNzUjhaZXlQRHFLWXBk?=
 =?utf-8?B?dGdVYVNqMzlGTjBPR294eEpZQVNVTENBTUhjQ0p5QmVvbWlYeTlocjhjT2FT?=
 =?utf-8?B?TmpMaVVuK095RG9nSUJic3Q1c0RIVDhBb1NjMjdFS0xYMGFrL3lWNXZabmJy?=
 =?utf-8?B?MUlQRGxwVlpDek9BckJwMERyZTkzZmlPNCt3QkVkWTg1L3lIeXg3cnFXMGZP?=
 =?utf-8?B?OXhYNHN0bXpWSTFmTG9rc1JVQVpGNlFOTHlZNkdsTmFCMWhQbmxjRjlvM0xD?=
 =?utf-8?B?TDJmQmEvTlA0OVpyMFNrWDI5Y1kvOVQxeDFZMDZsU3p4ckRQQlZnVk9JTGx3?=
 =?utf-8?B?L1NPVHZVUlorbmxSUU5hRVpzZWFNR0R5K1B0NTRrT0dNYTUvZWpTQXc1Q2p1?=
 =?utf-8?B?Z25FME5tWG9zYzZzdGNuMVdibFM2cmlTNE5OTVRUZk1zZWtjUXZFZ2VFN3NS?=
 =?utf-8?B?bTNMenZnSEFxRi9Mbko2Z2gvWjZpRnN1Wll0YjZWd1FXWmhRWmFPcTZjZHNx?=
 =?utf-8?B?RG1wekNsVmdDVlhqVnEvMkVWclJ1TFhlTTJTeG1rQzNFWG9FcHJJV0s5Zy95?=
 =?utf-8?B?VDNYSnhkQndvY3M1WElQTTNadytPMXR2b3VpeE5vcEpiOVVUcHlHK1JXZU5R?=
 =?utf-8?B?NzJsbzRXTXdVVmJzUlU5TURPWFFVRVUzV2l3TUo5bDVpU24ybWFTV2lpejQz?=
 =?utf-8?B?WTFpcVk4OXluWVJTSmZ2YUFVMGZGdWZQb0FzVkNoNjlZTjhsS01kdzNkYm1V?=
 =?utf-8?B?djRPSXJ3aS9sMEtKenlQM2pzdkQxdzBhTU1tR25QV2VJV0xqUTdqRlFZTnd1?=
 =?utf-8?B?Y1hLVER1bkdmeG1JR3RYWXllMmRsUFBCTEd5UUNBdjhPSDg0RnpkRjE3Tk0w?=
 =?utf-8?B?U2Q2UEptSlJDcW8ySmRzNFlZc3h0UC9iN1VSM2J0a011MjMvdzhvdGtmQ09k?=
 =?utf-8?B?QUhHeXgwRlNhQm5ZMFRzeVZyZlZpT1JROTdta01wNjFhOFhKdTFLRDB3dWQw?=
 =?utf-8?B?M1FOZEhwV1pVaDdGSjhOcklDNDQzT1FyR0JZQnZDdTlkaW83VzRPWE82T2dB?=
 =?utf-8?B?SmhyWlFQeDM0NER2bG5mRWgzdlBYbThxZCtqdk5wb3ZuK2FEbitaUys0UVF5?=
 =?utf-8?B?U1p0M2ZCekdwczBFTE5jeEUzT0llRmFtUitqMGNUY2pESXJhQVZtWFgxVmF5?=
 =?utf-8?B?UnlmamlWMFE0ZGlKcHlCMFdjR2lUSU1lRDZseW14dmFTWnRnSVNTN3Y4bGwv?=
 =?utf-8?B?azZNVVRyR3pvWU1OMEl2ckxOVWZFeWNMb091bHMxSHVsdG9Tbkl0M2REVHRr?=
 =?utf-8?Q?Xn85DntWyUUUw=3D?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 256ad6fb-0f7c-4a21-fe01-08db4ddc8ebd
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2023 02:49:48.5846
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LTdkk7mphDWjfGvul0ClwXxEywZlvhzyakYtVnvRCVPEiIWxg8S5q8nZ4FPYpJeZ7OH5oXVZ90j8lURnSwjq8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4233
X-Proofpoint-GUID: nO8l8tcKzSfqVRZXEtP5YqFUAUQWvCKr
X-Proofpoint-ORIG-GUID: nO8l8tcKzSfqVRZXEtP5YqFUAUQWvCKr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-05_29,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999 impostorscore=0
 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2305060019
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gRnJpLCBNYXkgMDUsIDIwMjMsIEF2aWNoYWwgUmFrZXNoIHdyb3RlOg0KPiANCj4gDQo+IE9u
IDQvMjAvMjMgMTA6MjAsIExhdXJlbnQgUGluY2hhcnQgd3JvdGU6DQo+ID4gDQo+ID4gQXMgZmFy
IGFzIEkgdW5kZXJzdGFuZCwgd2UgaGF2ZSB0d28gd2F5cyBmb3J3YXJkIGhlcmUgdG8gYXZvaWQg
cnVubmluZw0KPiA+IG91dCBvZiByZXF1ZXN0cyB0byBzZW5kOiBzZW5kaW5nIGRhdGEgYXMgcXVp
Y2tseSBhcyBwb3NzaWJsZSAobWF4aW1pemluZw0KPiA+IHRoZSBudW1iZXIgb2YgYnl0ZXMgc2Vu
dCBpbiBlYWNoIHBhY2tldCkgYW5kIGZpbGxpbmcgdXAgd2l0aCAwLWxlbmd0aA0KPiA+IHJlcXVl
c3RzIGluLWJldHdlZW4sIGFuZCBzcHJlYWRpbmcgdGhlIGRhdGEgYWNyb3NzIHBhY2tldHMuIEkn
bGwgY2FsbA0KPiA+IHRoZSBmaXJzdCBvbmUgYnVyc3QgbW9kZSBmb3IgbGFjayBvZiBhIGJldHRl
ciB0ZXJtLg0KPiA+IA0KPiANCj4gSGV5IGFsbCwNCj4gDQo+IEFwb2xvZ2llcyBmb3IgdGhlIGxh
dGUgcmVwbHkuIE15IG5vdC1zby1sb25nIHdvcmsgdG9vayBsb25nZXIgdGhhbiBleHBlY3RlZC4N
Cj4gSSB0cmllZCB0aGUgMiAodGVjaG5pY2FsbHkgMywgYnV0IEknbGwgZ28gb3ZlciBpdCBpbiBh
IGJpdCkgYXBwcm9hY2hlcyB3ZSBoYWQNCj4gZGlzY3Vzc2VkIGFib3ZlIGFuZCB0aGUgImJ1cnN0
IiBhcHByb2FjaCB3b3JrcyBwcmV0dHkgd2VsbC4gSSdsbCBhdHRhY2ggdGhhdA0KPiB0byB0aGlz
IGVtYWlsLCBhbmQgc2VuZCBhbm90aGVyIGVtYWlsIG91dCB3aXRoIHRoZSBvdGhlciBwYXRjaC4N
Cj4gDQo+IFRoZSBmaXJzdCB0aGluZyBJIHRyaWVkIHdhcyB0byBzcGxpdCBvbmUgdmlkZW8gZnJh
bWUgb3ZlciAyNjYgZnJhbWVzLCB3aXRob3V0DQo+IGNoYW5naW5nIHRoZSBudW1iZXIgb2YgcmVx
dWVzdHMgYWxsb2NhdGVkLiBBbmQgaXQgd29ya3MhIEhvd2V2ZXIsIGFzIExhdXJlbnQNCj4gbWVu
dGlvbmVkLCBpdCBkb2VzIGFkZCBhIGZhaXIgYW1vdW50IG9mIGJvb2trZWVwaW5nIHRvIHNwbGl0
IGEgdmlkZW8gZnJhbWUgaW50bw0KPiB0aGUgcmVxdWlyZWQgbnVtYmVyIG9mIHJlcXVlc3RzLiBJ
IGFsc28gaGFyZGNvZGVkIHRoZSBudW1iZXIgMjY2IGZyb20gb3VyDQo+IGRpc2N1c3Npb24sIGJ1
dCBJIGFtIG5vdCBzdXJlIGhvdyB0byBmaWd1cmUgb3V0IHRoYXQgbnVtYmVyIGR5bmFtaWNhbGx5
LiAyNjYNCj4gYWxzbyBkaWRuJ3Qgd29yayBpZiB0aGUgaG9zdCBzdGFydGVkIHNlbmRpbmcgZnJh
bWVzIGF0IG1vcmUgdGhhbiAzMGZwcyA6Lywgc28NCj4gb3VyIGR5bmFtaWMgY2FsY3VsYXRpb24g
d291bGQgbmVlZCB0byB0YWtlIGNhbWVyYSdzIHJlYWwgb3V0cHV0IGZwcyBpbnRvDQo+IGFjY291
bnQsIHdoaWNoIGFzIGZhciBhcyBJIGNhbiB0ZWxsIGlzIG5vdCBrbm93biB0byB0aGUgVVZDIGRy
aXZlci4NCj4gDQo+IFdpdGggdGhvc2UgaXNzdWVzIEkgdHJpZWQgd2hhdCBMYXVyZW50IGNhbGxl
ZCB0aGUgImJ1cnN0IiBhcHByb2FjaA0KPiAoYXR0YWNoZWQgYmVsb3cpLCBpLmUuIHNlbmQgdGhl
IHZpZGVvIGZyYW1lcyBpbiBhcyBmZXcgcGFja2V0cyBhcyBwb3NzaWJsZSwNCj4gYW5kIHRoZW4g
cXVldWUgdXAgMCBsZW5ndGggcGFja2V0cyB0byBrZWVwIHRoZSBJU09DIHF1ZXVlIGhhcHB5LiBU
aGlzIGFwcHJvYWNoDQo+IHdvcmtzIHBlcmZlY3RseSBhcyBmYXIgYXMgSSBjYW4gdGVsbC4gTG9j
YWxseSBJIHRyaWVkIHdpdGggYSBMaW51eCwgV2luZG93LA0KPiBhbmQgTWFjT1MgaG9zdCB3aXRo
IG5vIGZyYW1lIGRyb3BzIG9yIElTT0MgZmFpbHVyZXMgb24gYW55IG9mIHRoZW0hDQoNClRoYXQn
cyBncmVhdCENCg0KPiANCj4gSW4gdGhlIGN1cnJlbnQgcGF0Y2gsIFVWQyBnYWRnZXQgZHJpdmVy
IGtlZXBzIHRoZSBJU09DIGNhZGVuY2UgYnkgZWZmZWN0aXZlbHkNCj4gbWFpbnRhaW5pbmcgYSBi
YWNrLXByZXNzdXJlIG9uIHRoZSBVU0IgY29udHJvbGxlciAoYXQgbGVhc3QgdG8gdGhlIGJlc3Qg
b2YgaXRzDQo+IGNhcGFiaWxpdGllcykuIEFueSB1c2JfcmVxdWVzdCBhdmFpbGFibGUgdG8gdGhl
IFVWQyBnYWRnZXQgZ2V0cyBpbW1lZGlhdGVseQ0KPiBxdWV1ZWQgYmFjayB0byB0aGUgVVNCIGNv
bnRyb2xsZXIuIElmIGEgdmlkZW8gZnJhbWUgaXMgYXZhaWxhYmxlLCB0aGUgZnJhbWUgaXMNCj4g
ZW5jb2RlZCwgaWYgbm90LCB0aGUgbGVuZ3RoIGlzIHNldCB0byAwLiBUaGUgaWRlYSBiZWluZyB0
aGF0IHRoZSBob3N0J3MgcG9sbGluZw0KDQpUaGlzIGlzIHdoYXQgdGhlIGR3YzMgY29udHJvbGxl
ciBleHBlY3RzIC0tIGtlZXBpbmcgdXAgd2l0aCB0aGUgZGF0YSB0bw0KdGhlIG5lZ290aWF0ZWQg
cGVyaW9kaWMgaW50ZXJ2YWwuIFRoYW5rcyBmb3IgdGhlIHRlc3RzLg0KDQpCUiwNClRoaW5oDQoN
Cj4gYW5kIHRoZSBjb250cm9sbGVyJ3MgJ2NvbXBsZXRlJyBjYWxsYmFjayB3aWxsIHJlc3VsdCBp
biBhIHNvbWV3aGF0IGNvbnNpc3RlbnQNCj4gY2FkZW5jZSBmb3IgdGhlIHV2YyBkcml2ZXIgYWZ0
ZXIgdGhlIGluaXRpYWwgYnVyc3Qgb2YgcGFja2V0cy4NCj4gDQo+IEhvd2V2ZXIgdGhpcyBkb2Vz
IG1lYW4gdGhhdCBhdCB3b3JzdCwgdGhlIG5ldyB2aWRlbyBmcmFtZXMgYXJlIHVwIHRvIDYzDQo+
IHVzYl9yZXF1ZXN0cyBiZWhpbmQsIGJ1dCBhc3N1bWluZyBhIDEyNXVzIHBlciB1c2JfcmVxdWVz
dCwgdGhhdCBhbW91bnRzIHRvIH44bXMNCj4gbGF0ZW5jeSBhdCB0aGUgd29yc3QsIHdoaWNoIHNl
ZW1zIGFjY2VwdGFibGU/DQo+IA0KPiBBbm90aGVyIGNvbmNlcm4gSSBoYWQgd2FzIGFib3V0IGhv
dyB0aGUgYmFjay1wcmVzc3VyZSBtaWdodCBhZmZlY3Qgb3RoZXIgVVNCDQo+IGNvbnRyb2xsZXJz
LiBEV0MzIGRvZXNuJ3Qgc2VlbSB0byBiZSBzd2VhdGluZyBhbmQgaW4gbG9jYWwgdGVzdGluZyBJ
IHNhdyBubw0KPiBFWERFVnMgb3IgZnJhbWUgZHJvcHMgb3RoZXIgdGhhbiB3aGVuIHRoZSBzdHJl
YW0gd2FzIGJlaW5nIHRyYW5zaXRpb25lZCBmcm9tDQo+IG9uZSBjb25maWd1cmF0aW9uIHRvIGFu
b3RoZXIsIGJ1dCBJIGRvbid0IGtub3cgaG93IHRoaXMgaW50ZXJhY3Rpb24gbWlnaHQgZ28gZm9y
DQo+IG90aGVyIFVTQiBjb250cm9sbGVycy4gV291bGQgeW91IGhhdmUgYW55IGluc2lnaHRzIGlu
dG8gbm9uLURXQzMgY29udHJvbGxlcnMsDQo+IGFuZCBpZiB0aGV5IG1pZ2h0IGJlIG5lZ2F0aXZl
bHkgYWZmZWN0ZWQgYnkgaGF2aW5nIHVwIHRvIDY0IHJlcXVlc3RzIHF1ZXVlZCBhdCANCj4gb25j
ZT8NCj4gDQo+IEhlcmUncyB0aGUgcGF0Y2gsIGl0IGRvZXNuJ3QgY3VycmVudGx5IGhhbmRsZSBi
dWxrIHRyYW5zZmVycywgYnV0IEkgY2FuIHVwbG9hZCBhDQo+IGZvcm1hbCBwYXRjaCB3aXRoIGl0
IGlmIHRoaXMgYXBwcm9hY2ggc2VlbXMgYWNjZXB0YWJsZSENCj4gDQo+IC0tLQ0KPiAgZHJpdmVy
cy91c2IvZ2FkZ2V0L2Z1bmN0aW9uL3V2Y192aWRlby5jIHwgMjQgKysrKysrKysrKysrKysrKy0t
LS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMo
LSkNCj4g
