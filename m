Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7452864A640
	for <lists+linux-usb@lfdr.de>; Mon, 12 Dec 2022 18:52:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232753AbiLLRvu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Dec 2022 12:51:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232706AbiLLRvs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Dec 2022 12:51:48 -0500
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26A98E0BF
        for <linux-usb@vger.kernel.org>; Mon, 12 Dec 2022 09:51:47 -0800 (PST)
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
        by mx0b-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BCHIjmT030898;
        Mon, 12 Dec 2022 09:51:32 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=damh8UkgwyJ2BbCwsrr1EMwsLqa1OJNcbDxk3hBgWiA=;
 b=EB3ftVJJAE/OHUdPIoLbMhwSBlT7OCPW77rejEbl6WW4V5mCfHLh7e/hJ3LMafx2eFYG
 WfL1kxePBcABNKnurEHUWojw9A9PjX/HuAxCHKc5Esbkfu26dnKgimX7bvlNPGrbw6mg
 biDd9zcENZe5iRXrEDFXPK4/curVir6qHPNx1NcZbPZl2RE2JPyZ+97Xxbihwvi4zCfW
 XExWc4iBgm8FsjG4POnlEKYqyVrp6tBoU9tDZZ+VSR5Vd2LP5IrIp19Dfk+P4nwNm064
 AQ2QcciS0v8mUuako+VC6qOjsfJYy4ArP2hfOg7IqT+ENYIp7kqOIS0xaBWjMJNIxbJ/ Ag== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3mcsmm3ub5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 12 Dec 2022 09:51:32 -0800
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B4E2C40020;
        Mon, 12 Dec 2022 17:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1670867491; bh=damh8UkgwyJ2BbCwsrr1EMwsLqa1OJNcbDxk3hBgWiA=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=jxYpOnT/kZD+uCf0uN2hXzpuE7xzxv0LYolAp7EtSss9eHj3cmr5BozA+HxYwn5VE
         XID0bjHFh/XPhl1hwZwjiW7HVRA0RFUmKGdyPM8yiwi6Wr/7KqAEj4q1pgF6pQHT9v
         O8g9VB/9nroaFKFnq+IFbb3aDWwctPix9UFOrtbdOAjUeVyZ3wTIksrUa70UEx9slF
         obPsptooCSsFLy/3hknheItMwENKU+TcFEZp02TTu0P1QIq5sJQXjB4ZXs70sEyj3b
         tccitadD6xZjTkYDn7LXSsHtij6+G6HUQCgcUf42N2SUI/MAFylfkFTxHiOHbWpeTO
         jIWhZYVdOpgcw==
Received: from o365relay-in.synopsys.com (unknown [10.202.1.143])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id D14A0A005C;
        Mon, 12 Dec 2022 17:51:29 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2109.outbound.protection.outlook.com [104.47.70.109])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 995D1A0161;
        Mon, 12 Dec 2022 17:51:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lNPbEBk+GToSrMdoluUNLF+ntAw53VkY5Zwfu56kmdXY9mVg1zc+Yop4S4xRs4HPmUu3ZChwAzM/FeB1j2lYFw0SNnxp8iP/NGR2LD00ImEwL6Sa3cKiKUJTja/CV+dbPf83iteyq9z7+3460U9wj38F+vEQOECNF60rIBLIUMv+oaGdlrx3rAG2wnjy5PzMCjusck0QxisfCCQXaSXEUEeMd8JrUqGf4pYUwYlcsvzEpHQD4SzepuoGgGc336rJH95hAgnPpN+/OqPwlwDn7I0/3DuHzvIO5ke2JcBiPuxufrGZ+sE92g7aj5mWK47rZaefuRED08akcD9rb6BX0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=damh8UkgwyJ2BbCwsrr1EMwsLqa1OJNcbDxk3hBgWiA=;
 b=fEVfcXYsc81x6+jJSHu/4h71T/Wo7txge1u+FTa/DvmTig/14dArUb4L/D0c85/pXVrQP+8kZrthOXSNwbd0dTGQATX1oOXeJDivsCiX9LnZnL5MVaCNftkGSHwW+C0xRQB/jzS0QdG6b0UiSmVFWbQHFbwST7t/XkssG9NbYRXfP4h6XfRgQ2DSCsVfGf4eF6ib9Gvf+fgahlxThCCZp2ACFUxlGVWd08vf6j+ttDvrDu/l9T6+HqbVRJY9NCWTmbFtyO7O0ZCxTL7JvQMELiPf9REUtGMPF8mjfuPB0UbHseE6DpEx8VIiatW98dgAEqMdxM7JTCpILTgZFmVMIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=damh8UkgwyJ2BbCwsrr1EMwsLqa1OJNcbDxk3hBgWiA=;
 b=Gjzp3xnkl0ZU++8lekC2pnQ1zkIv9B9/OKz81DnhDsFd6w47DxDYbMesiPs9wTvonqXSkf69zAaS9CxcytJTwXpnNmOXaltkuaSfHU/O/SRtAuAkdcpwvMD0Epu5y9zkfB+whMDPvWGdLc39QFRuz25vPsLy7hrEACE8/sjtQK0=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by SJ1PR12MB6313.namprd12.prod.outlook.com (2603:10b6:a03:458::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Mon, 12 Dec
 2022 17:51:25 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::e395:902b:2e90:b7ee]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::e395:902b:2e90:b7ee%4]) with mapi id 15.20.5880.019; Mon, 12 Dec 2022
 17:51:25 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>
CC:     Dan Scally <dan.scally@ideasonboard.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: dwc3 38100000.usb: No resource for ep1in
Thread-Topic: dwc3 38100000.usb: No resource for ep1in
Thread-Index: AQHZCkg1Gzqyg8qb6EqnMIaYqEus0q5jgyeAgAAawQCABTo8AIABuAKA
Date:   Mon, 12 Dec 2022 17:51:25 +0000
Message-ID: <20221212175127.lx2a2ayo5makrklc@synopsys.com>
References: <1c187708-be86-0391-6cbd-3466cf0478fe@ideasonboard.com>
 <87a63ymnlw.fsf@balbi.sh>
 <f7196abb-d92e-ab47-6c7e-bea686f402c4@ideasonboard.com>
 <87edt63qbf.fsf@balbi.sh>
In-Reply-To: <87edt63qbf.fsf@balbi.sh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|SJ1PR12MB6313:EE_
x-ms-office365-filtering-correlation-id: 03f77049-1ec4-4394-3d76-08dadc697d33
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eJBK3ut9CPOQqa6Z8B+KfXyLnPZUxpaoA6FEZ/Lg0y8oD11jLOqp39CCI2Q88xnGe2o3MDB1dm2YotpY4qKZzrCAZdhVMG9bvIHqQS8UDx1wW61HCSw357dz+nM3LQMMZKcvdr6HKH1PQCb6Pbi10cSBzFEW9AZf/K3Kl+QuOa8vyFlJFLsCef4GIKSopEVLVQQJhq02x2mMAr/mgBwollGj6Hf9OBKmECa0dJ4JVx+SLYuvuZSB7hZvmKJ9Ne+2wlNH086lOn2ABpo+Sv6RyykPtFwTsddVuOqD5BTkqRMjIvHkkhF2WjE8U/HH9+y+HhjJjfTaMiPUabaht5FsnpACOh5wTiOQufEvGiNlkv4M+o/Qf0Ik5jTRpRJhb8CEXR0FIzt20Ac6AKg1Sgdr3DgvpCpIpXO2F5/80XVRaBycGCslQbkQnEMOTI30fyiVWd8uCwRGy03CBt4Bom2TaALNIej+S5Yx24TBjjuSPLNaqB+2Z0scODEYdUjY28uI+5doVZz6PuRj10xgpahnDs2xaSYvsJk+M135ubXnEBwZI6DuRQLYoaduUfYflFohMVzmda94/iWv/l3d/3F4u0Hg/rVt5tgYXa4OSlBk40rhg9wDhJFv/zuu9vQWABk940/hUulIzW0g2bly/cRFCWTxsgpI1XedKIdZr4hO9++nJ7cjj3PmGKnXgugNCPrJ1ogE8nvpb6qgarX0OS+rXUdm1jJHc0lZFF7TRF0gthLSALivcu5FrpYQVG3oCl7U
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(376002)(346002)(136003)(366004)(39860400002)(451199015)(122000001)(966005)(38100700002)(86362001)(38070700005)(6486002)(8936002)(478600001)(71200400001)(41300700001)(66946007)(66476007)(8676002)(66556008)(4326008)(6916009)(64756008)(76116006)(6512007)(54906003)(316002)(2906002)(83380400001)(186003)(26005)(6506007)(1076003)(2616005)(5660300002)(66446008)(53546011)(36756003)(32563001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UmNPOGNvUUh1WER6NDFSNFNweERBN3lqdXk5ZHJKeE1ZV3lpV3pIRXpzTG9i?=
 =?utf-8?B?eUx3eVRTQzdEU3pHK1VHa3J2UWE3WDBpbzRPUHpyUFhVbWZPUlArYnNvMFpz?=
 =?utf-8?B?WnNHVDB6UFRZZ2dkZWJxdUhwdFpPV3BEdG5pWkdFOFJOUlVvaWxWQkpHc2JV?=
 =?utf-8?B?MmtpWHcxK2NxZkJCVVB3dHd3SStMYVhxaHFyVlJBdEtlZys3WXRXa0xVVVl3?=
 =?utf-8?B?Q2FyQ1ZPYW9UdWhSRGZIWWtTL09IU2ZNWTlndVFvZU5JQkEvRWc0ek9qOFRi?=
 =?utf-8?B?c1Y0UVRMaVRWcUpyOW5aYktzRWsxd3JVcElyZGhpeEY2N3hFSWcySW1ONUlS?=
 =?utf-8?B?cWdvNGVPRlpkV0FpN1NqeElybkZ1UE5kNXN4aExRMnhUTWVjekViWXpYckY4?=
 =?utf-8?B?eFJSbnljOWdLcHJ0Ymlob05xMmtiaGRNQk56aExaN1pmMXlRSEQzZXZVYlNH?=
 =?utf-8?B?blpYOENBMlFZVGxnNlZhdGN4SnJCTmJSQnJ3aklrV094My9mLzNWejNkMFZC?=
 =?utf-8?B?Z3ZGMDIxSkdkUmhuZ2VMOHRmWXc5TGU5ZVJaTWNVUjNDRlFSeWJqd3pPVSth?=
 =?utf-8?B?UTQ0MEpYd3EyOWNKUG8vZ3paREJPV1owU2pHQnlPcllYV01ONlB6QkZJR2xS?=
 =?utf-8?B?VVA5ZDY4T011VDYwdkVxKy8vWVRZaEhnbUZkYkROZ2Q1TXpMOTJnZ0xFTlBp?=
 =?utf-8?B?S1lBNmhmcWNEZDBWSHM4T1F2UmFxZFRKN2NzRy8reDBLY2NXa0FjVWQvMUhh?=
 =?utf-8?B?OWpHMGw0YXVUaldtVCtacVc0bWVFYUFHeXJRNkFqaHczV1p5dTFWamRCVi9N?=
 =?utf-8?B?a3gzdFJtbDl6THpEMUtRcUhQU0FWL3VHY0ZJZU5LSUxscTlaQi8yNFVnR0Nq?=
 =?utf-8?B?c0g2U2YzTzBBbC95SUFoUkJEU20xSlNEcmVWbXpBdHNJb2xnWER3WW5zZStj?=
 =?utf-8?B?M0F6bi9OM09ac2xCeURzVDJQV0plS3R5bWYzeWFDUE1heGZwQmFJMUF4MzFU?=
 =?utf-8?B?YWlabUgyYWQ3ZnA3dk9OTnZnVkpLVUVQQ3J6SnlmUUVkMG9kQjBtZWV2WEJp?=
 =?utf-8?B?TnpteTBMNHVOb3VQZyt1V2dCVEZCcnl5TkpmQXd0dUlPdDdFeFZmVW9aRmVr?=
 =?utf-8?B?NGI0RDhxbW5tc2RXZWdZZk1jUWtVZHJTT1hKbUlva2JIb1NKa2JzRm5yWStl?=
 =?utf-8?B?SGRISFAzY092TVlUY2RxK0ovRExPNlFwOFRWY0orWTdYai8zSDhoWmF0SSsv?=
 =?utf-8?B?NGhYUlJtUGdNVUk2VUt0OEZrTERWU1lwdGM0WDZRWHRMMDg4aWtJYVVsOEw1?=
 =?utf-8?B?MDlLT1crYzgyTzlZM3VVc0piY1dFVFFWaVBaZitSWnZtOU0xR0FJRW9QUjVO?=
 =?utf-8?B?ZkdXbG00U21OL1RnT3A3N3NnZDBhcmczb0cxWnJYMUx5Z2Q3cnFwOU4vR25o?=
 =?utf-8?B?MTZMemxrTVBIR3R3NUtjYXVxOEFjQ2JYL1RJNFRJTWZpTkh5MGx1Um1FWnJi?=
 =?utf-8?B?eHM1MDBFbjRESjZrNXRiUkxWY1ZicUhWUXZOSFdTL0hheEN4Y3ZVVXNKakNU?=
 =?utf-8?B?SjdPc05vZVdjWjNJUmJ3eGxIZjdEWkdtMWR5YVp6VXB6N3R6V2ZLdDZWVGFp?=
 =?utf-8?B?MmRjWUFHNjEySDRMTWI1ZjEwOW9SZnEvQ1YxOS9MdUxLdTJuSVpzaXJvMzdz?=
 =?utf-8?B?em43dFFGUk44L0FHazdHVGplUVlwMHBMRnJYZG5rNVZPSVhRNi83NXpCWkds?=
 =?utf-8?B?ZkRSZVJERldMLzNEeDdFQktwd3hwUjdOSHBhT3M1Q3ArRC9GRFFQNjFUZDlr?=
 =?utf-8?B?aXVERmEvQWJYSUh6eUJ4VCswY2YzbTgyRlJ0dlVVc2VWMzJER2h3azlCclNN?=
 =?utf-8?B?NllkK2VHdjluaFdhRXBKN0NhclBHbVZvdTgxeVpPcGE2L1R5NnVMZWhtN0NQ?=
 =?utf-8?B?N09KNERYRWZHM1NRM2x6U2RZblk0NGpuN3ZuZG9oZ3BDWUxmU1pQNnBoazVl?=
 =?utf-8?B?ZnhkUXpCQzlFdzhCdDl2Unc2MmNPY2hjUnVzeFBSSGJ2Z3lpS0o0aHNlcHFH?=
 =?utf-8?B?QVZGaVRxTmhEUjZrM1U0Mkp2eTZwUHFkL2ZkWnFycWJia0lmU2Zvb3VNUm5S?=
 =?utf-8?Q?YhUsigu0kqZyM7n1Lvl9lqMnR?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3D7CCE3F710C7C4CBE1C9855F177F7EF@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03f77049-1ec4-4394-3d76-08dadc697d33
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2022 17:51:25.6064
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2J8cNNRhqH2mdRIIajkCwsKv4jbTD99FPkrZLcka6wVk7YOJXCPbDG+cK3U5tJBu0FRva2SifVJToCPxx+Hh7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6313
X-Proofpoint-GUID: bkbCay92G4rWSrSgSNIFC_HZ5yLiv5E5
X-Proofpoint-ORIG-GUID: bkbCay92G4rWSrSgSNIFC_HZ5yLiv5E5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-12_02,2022-12-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 clxscore=1015 mlxscore=0 impostorscore=0 adultscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 mlxlogscore=668 bulkscore=0 suspectscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2212120161
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gU3VuLCBEZWMgMTEsIDIwMjIsIEZlbGlwZSBCYWxiaSB3cm90ZToNCj4gDQo+IEhpLA0KPiAN
Cj4gRGFuIFNjYWxseSA8ZGFuLnNjYWxseUBpZGVhc29uYm9hcmQuY29tPiB3cml0ZXM6DQo+ID4g
R29vZCBtb3JuaW5nDQo+ID4NCj4gPiBPbiAwOC8xMi8yMDIyIDA2OjExLCBGZWxpcGUgQmFsYmkg
d3JvdGU6DQo+ID4+IEhpLA0KPiA+Pg0KPiA+PiBEYW4gU2NhbGx5IDxkYW4uc2NhbGx5QGlkZWFz
b25ib2FyZC5jb20+IHdyaXRlczoNCj4gPj4+IEknbSBoYXZpbmcgYW4gaXNzdWUgd2l0aCBEV0Mz
IHdoaWNoIEknbSBob3BpbmcgeW91IG1pZ2h0IGJlIGFibGUgdG8gc2hlZA0KPiA+Pj4gbGlnaHQg
b24uIEknbSB1c2luZyB0aGUgVVZDIGdhZGdldCBmdW5jdGlvbiB0byBzdHJlYW0gdmlkZW8gZnJv
bSBhbg0KPiA+Pj4gaW14OG1wIHBsYXRmb3JtLCB3aGljaCB3b3JrcyBqdXN0IGZpbmUuIE9uY2Ug
SSBoYXZlIHN0b3BwZWQgc3RyZWFtaW5nDQo+ID4+PiBob3dldmVyIGFuZCBhZnRlciBzb21lIHRp
bWUgaGFzIHBhc3NlZCAodGhlIGV4YWN0IGR1cmF0aW9uIHNlZW1zIHRvIHZhcnkNCj4gPj4+IHF1
aXRlIGEgbG90IGZyb20gMS0yIG1pbnV0ZXMgdG8gMTUrIG1pbnMpIEkgZ2V0IGEga2VybmVsIHdh
cm5pbmcgbGlrZSBzbzoNCj4gPj4gQXMgR3JlZyBtZW50aW9uZWQsIHBsZWFzZSBhZGQgVGhpbmgs
IHRoZSBuZXcgbWFpbnRhaW5lciwgdG8gdGhlIGxvb3AuDQo+ID4NCj4gPg0KPiA+IEFwb2xvZ2ll
cyB0byBib3RoIG9mIHlvdTsgZm9yIHNvbWUgcmVhc29uIEkgdGhvdWdodCB5b3UgaGFkIHRha2Vu
IG92ZXIgDQo+ID4gZnJvbSBUaGluaCByYXRoZXIgdGhhbiB0aGUgb3RoZXIgd2F5IGFyb3VuZC4g
VGhhbmtzIGZvciB0aGUgaGVhZHMgdXAgR3JlZy4NCj4gDQo+IG5vIHdvcnJpZXMsIGl0IGhhcHBl
bnMuDQo+IA0KDQpJIHRob3VnaHQgRGFuIGtuZXcgdGhhdCBmcm9tIGhpcyBlbWFpbCB0byBtZSBh
IHdoaWxlIGFnbzoNCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXVzYi83ZDQwMjI3NC1h
N2ZlLTEyNTQtYzY2Mi02NTcxODhkYjVhODRAaWRlYXNvbmJvYXJkLmNvbS8NCg0KDQo+IA0KPiBA
VGhpbmgsIGxvb2tzIGxpa2Ugc29tZXRoaW5nIHlvdSBzaG91bGQgcGF0Y2ggdXAuIEFsc28sIHlv
dSBzaG91bGQNCg0KV2hpY2ggSSBkaWQuIFBlcmhhcHMgbXkgcmVzcG9uc2UgdG8gRGFuIFsxXSBh
bmQgYW5kIHRoZSBmaXggcGF0Y2ggbGFzdA0Kd2VlayBbMl0gd2VyZSBsb3N0IGluIHlvdXIgaW5i
b3ggc29tZXdoZXJlPw0KDQoNCj4gcHJvYmFibHkgZ28gdGhyb3VnaCB0aGUgdHJhY2UgcG9pbnRz
IGFuZCBtYWtlIHN1cmUgYWxsIHJlbGV2YW50DQo+IGluZm9ybWF0aW9uIGlzIGJlaW5nIHByaW50
ZWQgdG8gdHJhY2UgcG9pbnRzLiBXZSBkb24ndCB3YW50IHRvIGhhdmUgdG8NCj4gZ3Vlc3Mgd2hh
dCdzIGdvaW5nIG9uIDotKQ0KPiANCg0KU3VyZS4gSXQgbWF5IG5vdCBiZSBvYnZpb3VzLiBXZSBj
YW4gcGF0Y2ggdGhhdC4NCg0KQlIsDQpUaGluaA0KDQpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGludXgtdXNiLzIwMjIxMjA4MjMxODM2LmpiZTY0bzN5azRidjR0cGFAc3lub3BzeXMuY29t
Lw0KWzJdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXVzYi9mMTYxN2EzMjNlMTkwYjlj
YzQwOGZiOGI2NTQ1NmUzMmI1ODE0MTEzLjE2NzA1NDY3NTYuZ2l0LlRoaW5oLk5ndXllbkBzeW5v
cHN5cy5jb20v
