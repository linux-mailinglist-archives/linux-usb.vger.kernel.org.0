Return-Path: <linux-usb+bounces-2948-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC387EEB24
	for <lists+linux-usb@lfdr.de>; Fri, 17 Nov 2023 03:40:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 916C31C2094B
	for <lists+linux-usb@lfdr.de>; Fri, 17 Nov 2023 02:39:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDD49808;
	Fri, 17 Nov 2023 02:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="LdMiEzSV";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="QnhCG/5f";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="qRuhwL9l"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C2841A8
	for <linux-usb@vger.kernel.org>; Thu, 16 Nov 2023 18:39:49 -0800 (PST)
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AH1089D004163;
	Thu, 16 Nov 2023 18:39:41 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=Ztdb5NFF+8jzgr1FvZ0ZD0sKPBFJcGKvdlyiFjtF7lM=;
 b=LdMiEzSVUEXdWT02TCIUD8hT+jwX/RL9JQjcwLxrOXi2sq83zd5bUI9oIER2lxXF5uyn
 N58lz9V0b8nuw3l7/pry9avVlf4btrHcpRD8p+opzl1dsVKHLQLVpfCoLkeinOlBhaAz
 p62w6ArynHS92Zn4WfZ5qSx2Cf65mWCZ6TWGHQxGilu0UyYBUeMLd+dI0v5CUksQB00L
 cuqC+XGKKi8M0p117iybPBitxD/BA1k7HJJo3bgJhmU2P0ssLxpreuBskiv5hxA+Pcx+
 YiuSDeFneutntLik2KBL5UYlTf2A7JpEjgVyCmYnHlRVJFv240jH8NCYGd75EC+TrAee 1A== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3ua9gsj5br-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Nov 2023 18:39:41 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1700188780; bh=Ztdb5NFF+8jzgr1FvZ0ZD0sKPBFJcGKvdlyiFjtF7lM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=QnhCG/5fKQmcVurLUk5+OBctAHGKhAVZg4fJkP9cRZRNp93Ms9fmbKLTN+AQMjzni
	 NmAcGsAt0LbQp5lZhSMakjdokdH7xKFMEpPr65JT+N/tZkGoW8PkJ8VxSOeKO19mSI
	 aoH0/n7Pd9qMguo4RVq0YXxB2R2SvgFMFcj1BawSRWqFJ9TmR+mm5NFTDoTz51vjJC
	 bHs1rWFflYoBbCZhuJjZx8VsMXwWt+CkKYKTVjyfJmzA8Wop6eMNM7iy7hV4LP0YWE
	 Qm5/siZ9UrUzhwLXO+LJWMHRDA5lrYVJgHbqwfeqZtdFUlDkVeO+jBQKEWPl2u6qJf
	 tLh3FevpswKPA==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 99ADE403B9;
	Fri, 17 Nov 2023 02:39:38 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 08FBDA00AC;
	Fri, 17 Nov 2023 02:39:37 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=qRuhwL9l;
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 0C2C9404AC;
	Fri, 17 Nov 2023 02:39:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OV5Y+20a/kMsIbve2I5c7ajhgIRDAJNXfcisX26C0bHYVt5t6AZJdaN8LVO0nm3ujoJU6AP8tgW/PKT11TLGqf+hhTJG8A+RIEhd+Ymx0XTtU4WmV3Dze4gx0qmsmWhq83JQTFWOekOwB4WnNuq8UeptkKnSGEHvmxsu2qoC19mRXP1rBCiggL5qSCu/i8T5DJEjU1YT2WZ9tEBzaBel9I521y51JYGAOFJ3DHhGV2tEUPEUDTCSEouHEsH6s/J/MzOG51Vvbw/aVxm9daeR0dnPk2TL0Qsu/OHoS7uDi4WxYaLk/jITfhu2mLOEbd7sWcEluiUTb1IqFTSHLniIfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ztdb5NFF+8jzgr1FvZ0ZD0sKPBFJcGKvdlyiFjtF7lM=;
 b=I61q4KNYt3mLHk7hiqN5H0/V4TqAY19728GsK5/RCDh+zYK4A6yHRcmxLceCidoAdkPAmBOQIbuSW73GGJIFIo2ORRpaC944qBZTy0netbo8eV8v21xHt90mcsDGvphG1N1NXtTmierlZHtOvnfLxAMqdfLzjqBfrye5/qBNEubBUj5Dp0zXuGpHkFdIjhuyCM/TrmqYegSANsjnYLmNYr1/B1zpsU5CU9hwTOJZ1L7O+c3JnBHiOC2pJTPQbj4k9UtKuZN0KeXa5PdjjDSJS3+KPb0hLBb2fiHFWbPsIUjUvZrQVuQwCNlf/AYP8EvYAmpsRuHeogomYfy6G4JemA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ztdb5NFF+8jzgr1FvZ0ZD0sKPBFJcGKvdlyiFjtF7lM=;
 b=qRuhwL9lTOrUah46tpnmr51pybudC1OUiuE4YR+0JaCuDoBclDruRAX+99vij6GngID3CjT0QDmbhCsUmyxrsHguErrokHYlU15ZJ8BFNu0lLXi/wXZT+vgWaR/dnDgyt+uUXnE8gzmmAGI41cdzXAv0p7JpL9CxYfaTxlkHmmM=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by SA3PR12MB8801.namprd12.prod.outlook.com (2603:10b6:806:312::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.17; Fri, 17 Nov
 2023 02:39:33 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::4e1a:5b9b:db11:b40e]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::4e1a:5b9b:db11:b40e%5]) with mapi id 15.20.7002.021; Fri, 17 Nov 2023
 02:39:33 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Michael Grzeschik <mgr@pengutronix.de>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
        "dan.scally@ideasonboard.com" <dan.scally@ideasonboard.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH] usb: gadget: uvc: reduce the request size to increase the
 throughput
Thread-Topic: [PATCH] usb: gadget: uvc: reduce the request size to increase
 the throughput
Thread-Index: AQHaE2U8RRnQzJTjj0ugR2ED8ucRQbBy0SiAgAUjFwCABeNRAA==
Date: Fri, 17 Nov 2023 02:39:33 +0000
Message-ID: <20231117023842.tup2qbzlv4q6m22l@synopsys.com>
References: <20231031231841.dbhtrgqounu2rvgn@synopsys.com>
 <20231109233341.2461129-1-m.grzeschik@pengutronix.de>
 <20231110021655.cgj2lk62p4ez7zhp@synopsys.com>
 <ZVHhxJWkesokGU3o@pengutronix.de>
In-Reply-To: <ZVHhxJWkesokGU3o@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|SA3PR12MB8801:EE_
x-ms-office365-filtering-correlation-id: e150a7ef-4785-4669-e265-08dbe7166ed1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 vESyEesiUGvseEl8Qr8JfQTsWkm6vqwuIwshn8H1UgnqsWYZzKPGf5K/IRn64YxQ9TjkdKfmQ/8SgbL1IpVJmSGv8G4HyswbmwTd5TzebF34CHmFps/zIzJ8+lrCVffgu1Ot0MKssdmKof8HXxFXSCaxageVDiPqaJqesJxaP93lFUh3eITG8FACw/is63AE078NQu6m1AaSg6jx0qsxoTxbmz0Iu5J94tX5MazPF1afZiRrQut6cVl0Hqrc/Yke1toiPr3oFDzaxEH65a9GVCfhVUbYuhKoFZKuSCyFWtqq3lSafs5LwtTSiIw9E5UvW/1AZI882s8SUoFHNrCZxu3Adae7wMY73pSVJB/avnlEo3VkctRcsLMYQNqhE474CiPGePv/OFLdI1/51s9wmo/u9T9AVfukfSwmzVwsqQjjnpr5FoU/x2Egd6tTzNQZisS9EfDdNST8t2k9FdAyLG3vcNhzOfJ7iQaXxviBRr6UfozTBrdOw44o7YjAUANOzXwE6edAB586vW9dNx9IvQMu67wjH+8JcJcyPF/O6xfckWNpg9n7bc4KfKHJkelIDGHvQmui1wcdxDlO2bpxmSehEmCfjhJVe8ZzIUdT65Ju4D2PRObljFBegOszvdtT
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(366004)(136003)(346002)(396003)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(2616005)(6512007)(1076003)(122000001)(26005)(38070700009)(478600001)(6486002)(36756003)(8676002)(4326008)(66946007)(86362001)(2906002)(41300700001)(5660300002)(66476007)(76116006)(66446008)(316002)(6916009)(66556008)(8936002)(54906003)(64756008)(71200400001)(6506007)(83380400001)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Rk9TanVGN0V3NnF3RzdxczhoOW1TS0pqNWp5ZURJNGphbWtLVzhPMDRHemFU?=
 =?utf-8?B?YTU5Z044aGo1R2tnbmRmS2cxWU1TTVFGbDNwU0NuTDJDZEZwc2xXbUN0dUJM?=
 =?utf-8?B?dmk0UTBET2FEUTcwd0kwY0N6WTAyOWFiTko2S1B6R3ZiMTlOV3hjSjJlNnA5?=
 =?utf-8?B?c2NvSmdPaGJPNGp0a2d1b3NTVGllUDVROEwwVDNpKzlzOG82T2VWZ1NzY1dl?=
 =?utf-8?B?bnVReVRGaWVXN0hyQXFyVG1YZzZLOTRvZXdZeGdjTllyQ01RbDJFQ3FqcmhM?=
 =?utf-8?B?TTVzMmljM0xPWnFyWGdrZ203U2tFSHdaUXgvTEtOSVZvQWh1N2MybHhoWjJu?=
 =?utf-8?B?Yml1aUdMUmdQTURIZU5oTWJuY0ZpUXhPU2dTRGh3ZnBCN3BHVmNsZVRwU1Vt?=
 =?utf-8?B?RVNoSHV1M1IraXdtOEovRTY2V0d4LzFlYjR5QTRpSk1UaE1JT2t4UnpsVWVi?=
 =?utf-8?B?bFF2R1ozZ21VdENmUUhOWkZjRDJTM1QxU3RVbU1DdkNQMk04aklaTy9vak1z?=
 =?utf-8?B?MVRBSTkxRFhad0VPWWlONjB1ckozRlJLMXVVZzlubDN6R1N5bDhYdldjWml6?=
 =?utf-8?B?R2xkS2RwTk1HVXk0STZVcUFYU2NPcjZ0bFBOM1R1VDVBeWcvQ1ZZUzExbjhG?=
 =?utf-8?B?Y3lZcnNOa3RRS2RZSno1R2trQUpEcXVkemtvZUFvMzlZR2IzU1NWL0dWQ1hX?=
 =?utf-8?B?NEtKUFBUb0hDeENTVEdMOS9PZkszVzVvNkFiODBHc1NjUitJdGRCS2xxbGdw?=
 =?utf-8?B?dUZlMXZkam00bGVyR0JHbHFVY1F1WnZWdis3K2xSL1JhYzVMMlRQTHhiVmxQ?=
 =?utf-8?B?anJWcTNzMmVBMEJGY0w0b1Y1clk5Y2hvK3MwRG1ML2RvSHFWdGg5WmtSRko3?=
 =?utf-8?B?eFJnWFNkQ1BBM2c0aWZJaER0SnVNM2tUZ09ubkkydUpRbnFkR2N4VGwrczZI?=
 =?utf-8?B?RUo3L3dwMmhQYzdjWGhjY1BmdVVkdWs4QkpPcVloSjRERktuMmFGOHVKcnJn?=
 =?utf-8?B?Yjk3ajREUXM1VXZIcUN3Rk9BYnVpK3MxYXI0aG0waThHdVo3cnhuRHVNcE5M?=
 =?utf-8?B?RlVUVTlBUzk0WW9xajNZcC9FV0JZSU81RzZBL294YmcwNWFwT2ZQeVBKbU1X?=
 =?utf-8?B?KzZuT1Qvc3RnbE8vM3FnWno1aDRoVGdrcGZNUVVtZTBSTGhYVEI0SWdMVG1G?=
 =?utf-8?B?c0k0ckJIZ1l2K1lwcGJzTU9kYndVek9ZMktRTkw3MlZ3d1plSDVLMEIrQ2xt?=
 =?utf-8?B?Zk5OcU9zNEJ2ODhQT0RXSTZvcXZZWHBVQm1NVkdWN0FqV0F6S1NZYVBTQWll?=
 =?utf-8?B?TVVlQnBabmI1Q0FXY2ZJSklZNnNXblIwR0xITDlyR0dhdTRMMkFESWM2alVj?=
 =?utf-8?B?WGl2M2dwN2d1QmVNYVRNWVE2WG9sSG80aVhWRGpXSFNNQzA2MnJ4aTZTeGxN?=
 =?utf-8?B?Y3ZYV1lyZU1NRDJicmZpMU5GRkxjakhWVTZEdDdjQ0pEY2V1MENSNFNvd0NV?=
 =?utf-8?B?ZlBZTlNZQVo4aWRzVkI4S3I1cUE0NS9JTTZZdEZvUndOaXhpL2hlN095ZlR5?=
 =?utf-8?B?Vi9NRDNwb0RxclhBZmI4OWFWdlN4YmJ1Nk5RdDJPYllVRjhkZHp2cGJtTVgv?=
 =?utf-8?B?NHlEbnZDV01CYjRsdDZXWkpMampVTVExWGJ2cFgrenNjNTZ3aDJYRUN0b1pn?=
 =?utf-8?B?WUhTZTg1ZUNNbUhvVlB2eHRQak96Y1R0b2RQYjVmNldkdW9RZXdmNFQ3S1dS?=
 =?utf-8?B?dFkxUWN3cTJEakVOODRBODJYR0JDSjJ1MHFzYXZMbkpLZEh1aEsrMXJEK2hz?=
 =?utf-8?B?blBaOVZob2FqYUEvNUhYdm05SFMzZEY4Y1Q0UkRDTE9pR2FmakY1c21adEpv?=
 =?utf-8?B?eDR3aXd4MEJMdllvTjlWY3BROGFvaTJnbmhUekxCaEdoYmtBOXMxUXZOM3Rz?=
 =?utf-8?B?TVlvZGI2WXFNRzE3MTI4cGlRRE13WjZSWENlbzg3ZUpRRFVqOTBrMWNiNnZQ?=
 =?utf-8?B?UGZuUzBkcStnSG1JOENyWTJELzJJYmMxMnBvUXNJV0lnODNGSEZzL2VDZEhw?=
 =?utf-8?B?elpTcUZKbi9vTmNpRmgzbGpTS3NMYkN3TllRL1FNZEx3SWtlTis1emdvcUZG?=
 =?utf-8?Q?waZUgMsviijWj11hwUWNdL5wO?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C16AD3F07BA40E4FB5593C0F3BC94369@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	=?utf-8?B?ZlRZT0VNNmtUQnE4ZEhOSHZCSEtsRnZoS2M1dmRwSkY3dXh3eDByKzAwZjVN?=
 =?utf-8?B?WU9uZmhBeXhTQ01FKzBQVmUxR1pZZFpsT2FvaXBDbS9qUjdGU3AyWlU1cVZL?=
 =?utf-8?B?K0RsN1FEdE5PK1h4TEVVU20zdER2TmlpNDZydVNGTzBxVWdyUldIbWF2YVJP?=
 =?utf-8?B?MDV6NUtuK3ZXM1ZGTkgvanRqTy84SmhMb2RWNkUvQ3B5RmM2eDJNTVJGVlho?=
 =?utf-8?B?aHNNTzhabFo2OW9BR0RQQkRUQkNPUHdJTmFiV3o0Q05tYmtMZDgxemxGVmdq?=
 =?utf-8?B?bjd3eDUvYnFaZHczazhjZHM4ZjJXK3lhUEI5bHdjYW1jQlZzT3Z2bHRybmtV?=
 =?utf-8?B?N0ZsRXpFWDdacjU5N1dFSENVNHlZMVRBeUtWZFA2OTN6dDVhUm40eHNKZ2xw?=
 =?utf-8?B?RzFReFZKc3MrU3k2cHpPemkwOEFveXdOdWVHdmgyMnAyeUw3dCtCdEl6ZXA2?=
 =?utf-8?B?QTh3VkJjcEF3MWxFbk54SFhSejZMb0llSEtHMDY1Ti9YRDBXdXhxTjNYQis1?=
 =?utf-8?B?MTdyVnliQVhaTEs5SGdyVkc0QTc4c1NWNVZIM0ZDSXVnODRsM21VZWU4SjZF?=
 =?utf-8?B?UnRGTVFGdnp0WS8rbWNKQytRWDJvajh1ZTdJY05DWS9pb0xhbjlzRmZXbTlq?=
 =?utf-8?B?cVVNMmFsNUE2VUFnVExha1hwVE10UDM4NzZaSjlxWml6eEVFTzJhR2xFT2tP?=
 =?utf-8?B?SE5zSU1mb1haU0pWS2ZYOWZWZ1JLN3gzTXdGZG5EK0tMQ1REUkcyZ3R6Y1Fo?=
 =?utf-8?B?MEZmcnBpMnJQS3VRK1ZzSjFZcFd5bE9zRFRnUVQwNlhZK0pkM2oySk16VCs3?=
 =?utf-8?B?bEFtR3daSVZpYXhyRS9tQlFQZ0VNTStBRU9KSU9CZGpmNld6MlZJNk1YbEFT?=
 =?utf-8?B?SWs3WU40Y2M1d1Z4KzZ3L1NFb1NpL2FyRjUwNGVWT3YrNEgwdXRtcm5LNWRk?=
 =?utf-8?B?ZUFRRDI3ZmdsNGl2MVRXZU9MZmRNZWpFS0J3TGIxZGJmeEdzQnFiVmNWNGJx?=
 =?utf-8?B?akJQRi8xV3BuK1JvUUhucUdqSmg1ZmZuZDNiaUY3QUNHcG1UbVZqT1orTmtQ?=
 =?utf-8?B?UnpNRENNU0pXSEpRR1RCOHNabzZTRitIUHc1Z2lRZWNocHZMZTFHQXdTcVdY?=
 =?utf-8?B?MkZxdndwNWkrcTRMZURJVFdPZ0VqdUQxRTczQ2EvallwUFp5VnR6b1NVZ1BO?=
 =?utf-8?B?NjFyeHcvQ0xFcGVzczZFbk8vY2t6TFBrYm9CRzNSbWl2ajQrdUdFQmlyWXdX?=
 =?utf-8?Q?PWvY062aYvjYVMg?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e150a7ef-4785-4669-e265-08dbe7166ed1
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2023 02:39:33.7017
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kg0Yc9bFQmuxR4N5MgtMCigTPsQwhpArd3Zdrd3VaFXtVl8qf/X7rA2I0AVJ/VBr2jWcN69aUEkgaE20ZyEJzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8801
X-Proofpoint-GUID: xQNsFwMT-CsZYeDVnjBO-D_FTXJ6KLnu
X-Proofpoint-ORIG-GUID: xQNsFwMT-CsZYeDVnjBO-D_FTXJ6KLnu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 lowpriorityscore=0 mlxlogscore=999 phishscore=0 mlxscore=0 bulkscore=0
 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311170018

T24gTW9uLCBOb3YgMTMsIDIwMjMsIE1pY2hhZWwgR3J6ZXNjaGlrIHdyb3RlOg0KPiBPbiBGcmks
IE5vdiAxMCwgMjAyMyBhdCAwMjoxNjo1OUFNICswMDAwLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+
ID4gT24gRnJpLCBOb3YgMTAsIDIwMjMsIE1pY2hhZWwgR3J6ZXNjaGlrIHdyb3RlOg0KPiA+ID4g
T25lIG1pc2NvbmNlcHRpb24gb2YgcXVldWVpbmcgcmVxdWVzdCB0byB0aGUgdXNiIGdhZGdldCBj
b250cm9sbGVyIGlzLA0KPiA+ID4gdGhhdCB0aGUgYW1vdW50IG9mIGRhdGEgdGhhdCBvbmUgdXNi
X3JlcXVlc3QgaXMgcmVwcmVzZW50aW5nIGlzIHRoZSBzYW1lDQo+ID4gPiBhcyB0aGUgaGFyZHdh
cmUgaXMgYWJsZSB0byB0cmFuc2ZlciBpbiBvbmUgaW50ZXJ2YWwuDQo+ID4gPiANCj4gPiA+IFRo
aXMgZXhhY3QgaWRlYSBhcHBsaWVzIHRvIHRoZSB1dmNfdmlkZW8gZ2FkZ2V0IHRoYXQgYXNzdW1l
cyB0aGF0IHRoZQ0KPiA+ID4gcmVxdWVzdCBuZWVkcyB0byBoYXZlIHRoZSBzaXplIGFzIHRoZSBn
YWRnZXRzIGJhbmR3aWR0aCBwYXJhbWV0ZXJzIGFyZQ0KPiA+ID4gY29uZmlndXJlZCB3aXRoLiAo
bWF4cGFja2V0LCBtdWx0aXBsaWVyIGFuZCBidXJzdCkNCj4gPiA+IA0KPiA+ID4gQWx0aG91Z2gg
aXQgaXMgYWN0dWFsbHkgbm8gcHJvYmxlbSBmb3IgdGhlIGhhcmR3YXJlIHRvIHF1ZXVlIGEgYmln
DQo+ID4gPiByZXF1ZXN0LCBpbiB0aGUgY2FzZSBvZiBpc29jaHJvbm91cyB0cmFuc2ZlcnMgaXQg
aXMgaW1wcmFjdGljYWwgdG8gcXVldWUNCj4gPiA+IGJpZyBhbW91bnQgb2YgZGF0YSBwZXIgcmVx
dWVzdCB0byB0aGUgaGFyZHdhcmUuIEVzcGVjaWFsbHkgaWYgdGhlDQo+ID4gPiBuZWNlc3Nhcnkg
YmFuZHdpZHRoIHdhcyBpbmNyZWFzZWQgb24gcHVycG9zZSB0byBtYWludGFpbiBoaWdoIGFtb3Vu
dHMgb2YNCj4gPiA+IGRhdGEuDQo+ID4gPiANCj4gPiA+IEUuZy4gaW4gdGhlIGR3YzMtY29udHJv
bGxlciBpdCBoYXMgdGhlIG5lZ2F0aXZlIGltcGFjdCB0aGF0IHRoZSBlbmRwb2ludA0KPiA+ID4g
RklGTyB3aWxsIG5vdCBiZSBmaWxsZWQgZmFzdCBlbm91Z2ggYnkgdGhlIGludGVybmFsIGhhcmR3
YXJlIGVuZ2luZS4NCj4gPiA+IFNpbmNlIGVhY2ggdHJhbnNmZXIgYnVmZmVyIChUUkIpIHJlcHJl
c2VudHMgb25lIGJpZyByZXF1ZXN0LCB0aGUNCj4gPiA+IGhhcmR3YXJlIHdpbGwgbmVlZCBhIGxv
bmcgdGltZSB0byBwcmVmaWxsIHRoZSBoYXJkd2FyZSBGSUZPLiBUaGlzIGNhbiBiZQ0KPiA+ID4g
YXZvaWRlZCBieSBxdWV1ZWluZyBtb3JlIHNtYWxsZXIgcmVxdWVzdHMgd2hpY2ggd2lsbCB0aGVu
IGxlYWQgdG8NCj4gPiA+IHNtYWxsZXIgVFJCcyB3aGljaCB0aGUgaGFyZHdhcmUgZW5naW5lIGNh
biBrZWVwIHVwIHdpdGguDQo+ID4gDQo+ID4gSnVzdCB3YW50IHRvIGNsYXJpZnkgaGVyZSB0byBh
dm9pZCBhbnkgY29uZnVzaW9uLCB0aGUgaGFyZHdhcmUgVFggRklGTw0KPiA+IHNpemUgaXMgcmVs
YXRpdmVseSBzbWFsbCwgdXN1YWxseSBjYW4gYmUgc21hbGxlciB0aGFuIHRoZSBUUkIuIEl0IHNo
b3VsZA0KPiA+IGJlIGZpbmUgd2hldGhlciB0aGUgVFJCIGlzIGxhcmdlciBvciBzbWFsbGVyIHRo
YW4gdGhlIEZJRk8gc2l6ZS4gVGhlDQo+ID4gaGFyZHdhcmUgZG9lcyBub3QgInByZWZpbGwiIHRo
ZSBGSUZPLiBJdCBqdXN0IGZpbGxzIHdoaWNoZXZlciBUUkIgaXQncw0KPiA+IGN1cnJlbnRseSBw
cm9jZXNzaW5nIChJIHRoaW5rIHlvdSBtYXkgYmUgbWl4aW5nIHVwIHdpdGggVFJCIGNhY2hlKS4N
Cj4gDQo+IFdoYXQgSSBzZWUgaXMsIHRoYXQgYnkgdXNpbmcgYmlnZ2VyIFRSQnMgdGhlIGhhcmR3
YXJlIGlzIG5vdCBhYmxlDQo+IHRvIGtlZXAgdXAgd2l0aCByZWFkaW5nIGZyb20gdGhlIG1lbW9y
eSB3aGVuIHRoZSBzeXN0ZW0gaXMgdW5kZXINCj4gaGVhdnkgbWVtb3J5IHByZXNzdXJlLiBUaGlz
IGlzIHRoZSBtYWluIHJlYXNvbiBmb3IgdGhpcyBjaGFuZ2UuDQo+IA0KPiBTaW5jZSB3ZSBmb3Vu
ZCBvdXQgdGhhdCBpbmNyZWFzaW5nIHRoZSBGSUZPIHNpemUgaGFkIGFuIGVmZmVjdCB0byBob3cN
Cj4gaGlnaCB3ZSBhcmUgYWJsZSB0byBzZXQgdGhlIGhhcmR3YXJlIGVuZHBvaW50IGNvbmZpZ3Vy
YXRpb24gb24gb3VyDQo+IGdhZGdldCBzaWRlIChwYXJhbXMucGFyYW0wKSwgdW50aWwgd2Ugc2F3
IHRoZSBpc3N1ZSByZW9jY3VyLg0KPiANCj4gU28gdGhlIElkZWEgaGVyZSB3YXMgdG8gaGF2ZSBh
IHR3ZWFrIG9uIGhvdyB0aGUgaGFyZHdhcmUgaGFuZGxlcyB0aGUNCj4gZGF0YSBmcm9tIHRoZSBt
ZW1vcnkgdG8gdGhlIEhhcmR3YXJlLUZJRk8gd2hpY2ggc2VlbXMgbm90IHRvIHVuZGVycnVuDQo+
IHdpdGggc21hbGxlciBUUkJzLg0KPiANCj4gPiBUaGUgcGVyZm9ybWFuY2UgaW1wYWN0IGZyb20g
dGhpcyBjaGFuZ2UgaXMgdG8gcmVkdWNlIHRoZSBVU0IgYmFuZHdpZHRoDQo+ID4gdXNhZ2UuIFRo
ZSBjdXJyZW50IGNhbGN1bGF0aW9uIGluIHV2YyBmdW5jdGlvbiBjYW4gdXNlIDQ4S0IvdWZyYW1l
IGZvcg0KPiA+IGVhY2ggcmVxdWVzdCBpbiBTdXBlclNwZWVkLCB0aGUgbWF4IHNpemUgZm9yIGlz
b2MgaW4gU3VwZXJTcGVlZC4gSSBrbm93DQo+ID4gbWFueSBob3N0cyBjYW4ndCBoYW5kbGUgdGhp
cyBraW5kIG9mIHRyYW5zZmVyIHJhdGUgZnJvbSB0aGVpciBoYXJkd2FyZS4NCj4gPiAoZS5nLiBJ
dCBnZXRzIHdvcnNlIHdoZW4gc2NoZWR1bGluZyB0cmFuc2ZlcnMgZm9yIG11bHRpcGxlIGVuZHBv
aW50cyBhbmQNCj4gPiB1bmRlciBtdWx0aXBsZSB0aWVyIGh1YnMpLg0KPiANCj4gSSB0aGluayBJ
IGRvbid0IGZ1bGx5IHVuZGVyc3RhbmQgaGVyZS4NCj4gDQo+IFdlIGNoYW5nZSB0aGUgb3ZlcmFs
bCBidWZmZXJzaXplIG9mIHRoZSB1c2JfcmVxdWVzdCBhbmQgdGhlcmVmb3IgbGltaXQNCj4gdGhl
IHNpemUgb2YgcG9zc2libGUgVFJCcy4gVGhpcyBzaG91bGQgZXZlbiBvbmx5IGhhdmUgbW9zdCBl
ZmZlY3Qgb24gdGhlDQo+IHRyYnNpemUgZm9yIHRoZSBtZW1jb3B5IHBhdGgsIHNpbmNlIHRoZSBz
Y2F0dGVyIGdhdGhlciByZXF1ZXN0cyBhcmUNCj4gYWxyZWFkeSBzcGxpdCBpbnRvIG11bHRpcGxl
IHRyYnMgd2hpY2ggaXMgY2FwcGVkIHRvIHRoZSBtYXhpbXVtIG1hcHBhYmxlDQo+IG1lbW9yeSBy
YW5nZSBvZiBQQUdFX1NJWkUgKDRrKS4NCj4gDQo+IE90aGVyIHRoZW4gdGhhdCwgdGhlIHBhcmFt
ZXRlcml6YXRpb24gb2YgdGhlIGVuZHBvaW50IG9uIG91ciBnYWRnZXQgc2lkZQ0KPiBpcyBub3Qg
Y2hhbmdlZCBieSB0aGlzIHBhdGNoLiBUaGUgZW5kcG9pbnQgY29uZmlndXJhdGlvbiBpcyBzZXQg
YXMgZm9sbG93czoNCj4gDQo+IHBhcmFtcy5wYXJhbTAgfD0gRFdDM19ERVBDRkdfQlVSU1RfU0la
RShidXJzdCAtIDEpIHwNCj4gICAgICAgICAgICAgICAgICBEV0MzX0RFUENGR19NQVhfUEFDS0VU
X1NJWkUodXNiX2VuZHBvaW50X21heHAoZGVzYykpOw0KPiANCj4gU28gYnkgY2hhbmdpbmcgdGhl
IHJlcXVlc3Rfc2l6ZSB0aGVyZSBzaG91bGQgbm90IGJlIGFueSBvdGhlciBjaGFuZ2UgaW4gdGhl
DQo+IGdhZGdldCBzaWRlIGhhcmR3YXJlIGNvbmZpZ3VyYXRpb24uDQo+IA0KPiBIb3cgaXMgdGhl
IG92ZXJhbGwgYmFuZHdpZHRoIHVzYWdlIGFmZmVjdGVkIGJ5IHRoaXMgY2hhbmdlIHRoZW4gb3Ro
ZXINCj4gdGhhbiB3ZSBoYXZlIG1vcmUgc21hbGxlciBwb3RlbnRpYWwgdHJicyBpbiB0aGUgcXVl
dWUuDQo+IA0KPiBJZiB0aGUgSW50ZXJ2YWxsZW5ndGggaXMgbm90IGNvdXBsZWQgdG8gdGhlIGFt
b3VudCBvZiB0byBiZSB0cmFuc2ZlcmVkDQo+IFRSQnMgaW4gYW55IGNhc2UsIGl0IHNob3VsZCBu
b3QgaGF2ZSBhbiBlZmZlY3QgdG8gdGhlIGJhbmR3aWR0aC4NCj4gDQo+IElmIEkgYW0gbWlzdGFr
ZW4gaGVyZSwgY2FuIHlvdSBwb2ludCBtZSB0byBzb21lIGNvZGU/DQo+IA0KDQpNeSBwb2ludCB3
YXMgdG8gY2xhcmlmeSB0aGF0IHRoZSByZWR1Y3Rpb24gb2YgcmVxdWVzdCBzaXplIHdvdWxkIG1l
YW4NCm1vcmUgdGltZSBhdmFpbGFibGUgZm9yIHRoZSB0cmFuc2ZlciB0byBnbyBvdXQgd2l0aGlu
IHRoZSBnaXZlbiB1c2INCmJhbmR3aWR0aC4NCg0KQm90aCB0aGUgaG9zdCBhbmQgdGhlIGRldmlj
ZSBzaWRlcyBjYW4gYWZmZWN0IHdoZW4gYW5kIGhvdyBtdWNoIGRhdGEgY2FuDQpiZSBzZW50IHdp
dGhpbiBhbiBpbnRlcnZhbC4gVGhlIGhvc3QgaGFzIGl0IG93biBjYWxjdWxhdGlvbiBvbiBob3cg
bXVjaA0KdXNiIGJhbmR3aWR0aCBpcyBhbGxvY2F0ZWQgZm9yIHRoZSBkZXZpY2UgYW5kIGVuZHBv
aW50LiBTb21lIGhvc3RzIGdpdmUNCm1vcmUsIHNvbWUgZ2l2ZSBsZXNzLiBUaGUgbW9yZSBkYXRh
IGlzIHRyYW5zZmVycmVkLCB0aGUgbGVzcyB0aW1lIGl0DQpoYXMgdG8gc2VuZCBvdXQgYWxsIHRo
ZSBkYXRhLiBZb3VyIHR3ZWFraW5nIG9mIHRoZSBGSUZPIHNpemUgYW5kIHRoZSBidXMNCmJ1cnN0
IGhlbHAgaW1wcm92ZSB0aGUgcGVyZm9ybWFuY2Ugb24gdGhlIGRldmljZSBzaWRlLg0KDQpJIGFs
c28gd2FudCB0byBub3RlIHRoYXQgdGhlIHRyYW5zZmVyIHNpemUgb2YgdGhlIHVzYiByZXF1ZXN0
IGlzIHdoYXQNCm1hdHRlciBzaW5jZSBpdCBhY2NvdW50cyBmb3IgdHJhbnNmZXIgb3ZlciBhbiBp
bnRlcnZhbC4gSWYgeW91IHVzZSBTRw0KcmVxdWVzdCwgdGhlbiB5b3UgbWF5IGhhdmUgbWFueSBz
bWFsbGVyIFRSQnMuIEZvciBuZXdlciBjb250cm9sbGVycywgdGhlDQpwZXJmb3JtYW5jZSBzaG91
bGQgYmUgZXF1aXZhbGVudCB0byBhIHJlcXVlc3QgdXNpbmcgYSBsYXJnZSBUUkIuDQoNClJlZ2Fy
ZGluZyB0aGUgcXVlc3Rpb24gZWFybGllciwgY2FuIHlvdSBjYXAgdGhlIHNpemUgb2YgdGhlIHJl
cXVlc3QNCmRlcGVuZGluZyBvbiBob3cgbXVjaCB2aWRlbyBkYXRhIGlzIGV4cGVjdGVkIG92ZXIg
YSBnaXZlbiB2aWRlbyBmcmFtZQ0KaW5zdGVhZD8NCg0KVGhhbmtzLA0KVGhpbmg=

