Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C0C148A0D6
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jan 2022 21:20:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245505AbiAJUT6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jan 2022 15:19:58 -0500
Received: from mx0d-0054df01.pphosted.com ([67.231.150.19]:35496 "EHLO
        mx0d-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240181AbiAJUT6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Jan 2022 15:19:58 -0500
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20AI5rmO001632;
        Mon, 10 Jan 2022 15:19:52 -0500
Received: from can01-qb1-obe.outbound.protection.outlook.com (mail-qb1can01lp2054.outbound.protection.outlook.com [104.47.60.54])
        by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3dgp68r80u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 10 Jan 2022 15:19:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L7paOQtnwB3C+u53j8oZqybwjqfFtrglC5sHxkgDlXs9aHsKi4gYoX3J0wXJ3NBUBhe8l5nUlRo3L3QTA3FcEIBtDQKANVQj0abIhDUyrppvcRDTLp8ElMPk8RWo6hk6uqM3PJdc271AxqKFTsK2BUuLildNyKDnxRWpFNtgAlIHHVe8PpWxHouw7aNGtggc00uVUqSG9spx0jNjLjCWerntFcmPt83WQga3caATdANWMRwoyNYKyrEgNSXV8HQ6lQVt+iyF6eUwWkG9VKISvRwfsSYIj4LwK9TirKOo/tTt1Bt6FKuVCmw+EaoHV4xINEeqks7sbY5rTSNVKSKcSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jf5rraU4JCmZU/qHVRS49zz+Cz/PXFU2SDmBiLmvcNk=;
 b=SeVVrWaglvUPyj+LR/LG+GxebMbTNUEaLSYx4l3orOzQlIglwWDgF1REfmWvD/bqyKbpfJBk3kvvbxne1O+cj75nWPn8Mkp9BIIemMixVSd6T1dSmf11Cymr4pw6KCmA+8FLcQ6ErRiZrfEGMUbSjuYt/JdJhBOuU895/GuGo5NSY1AIjgjmqVR1RTKGN5rcqGZBPhDJsNFxOeRwr/6LHB5vWFYPEiFbIpDsr1IHirYu+9TWoUSaWrsqX4x2ohssbAXH90tRy5m1g5BlP3MXnHuWSSxUMnRCxi/Pz44OUBxr9P3XtmH3IQLXp/5AZHJeC27G9Ao0eAHliL+Fq6L5sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jf5rraU4JCmZU/qHVRS49zz+Cz/PXFU2SDmBiLmvcNk=;
 b=bsQXRoRXFlO0UGJEv1EO2jz6Z5sVPmo+ndwCuzJIzMh1PSDqVak74ygCrzY0WyNiGDBrCvrWv7CmrDkbqVUVjXm9KgKPeCGQbCKGqzq0oDIKqLIfjbUt9d74N03qNWo5UDOuR1BVleloRgVJ4wxN/OXAcjlvs5zCKDxMnyCajC4=
Received: from YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:4d::14)
 by YT1PR01MB3497.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:4::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Mon, 10 Jan
 2022 20:19:50 +0000
Received: from YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::4441:49c3:f6d1:65ec]) by YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::4441:49c3:f6d1:65ec%9]) with mapi id 15.20.4867.012; Mon, 10 Jan 2022
 20:19:50 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     linux-usb@vger.kernel.org
Cc:     Thinh.Nguyen@synopsys.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, michal.simek@xilinx.com,
        balbi@kernel.org, gregkh@linuxfoundation.org,
        mounika.grace.akula@xilinx.com, manish.narani@xilinx.com,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH v3 0/5] Xilinx ZynqMP USB fixes
Date:   Mon, 10 Jan 2022 14:19:31 -0600
Message-Id: <20220110201936.1371891-1-robert.hancock@calian.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MWHPR1201CA0002.namprd12.prod.outlook.com
 (2603:10b6:301:4a::12) To YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:4d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea32b790-fe63-4920-cd60-08d9d4768e02
X-MS-TrafficTypeDiagnostic: YT1PR01MB3497:EE_
X-Microsoft-Antispam-PRVS: <YT1PR01MB34972457F06AC9901D1807C8EC509@YT1PR01MB3497.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C1vsDu7CL0kYLLN1tSRacESWt6RK5voK7gp9g+QZemxGAIJy6b0iC3FIgbPnhUsosKC3rcvLUrgg3fH/WB8Ev7lynctT9SXduyPuRKnVhtm0tgBYhcVI2PUVik8W2V7KyoeOZ0cShQD3oAp1CdDeePJRxxn9MPo7g9wBIVrN/kkLUxDHIN/wHil98TFo927iFH9gKeyPfRP4LpEg4EwV6U0FyqhhAGz8jlDK18H35vfIjui/WFuf/dug2PXkX9BbhQeApXNfjJ2UdKfPIytdFkvdZ1hDOe/oAUU6k89BpSekosQ3wQavjadq10vWIZq+hJJAhS8rNsILZGhs8ahi7gXLNKBtnXZ4HzDCZAY9y82iis6WyOGXwwO/ZuW41Uw4nZ6fETdr7QNppZfL2mYsNWSSGvIpdgX1L6ibwLkyh7/2dqWtGiqfiwUJhNcv1k+VKH0ioelVvoZRdP3hQK3rfukX0r8O9SxBsm6o6KXdntPGD5h1k9xsPclsNqezekBf7IORaVTvEs4DPpF8OTnBC6B/CenHKn9cv2GgsWh874HrCXnm8TCKrXf98TERnSUHQOJEZ/2Hi8KOhd0kwrEB+f3OKBlCkSJOlfWyM+TRcA4apFYja/itAdgmyZcD2qyzc/peX85o3At0gmJkL3Bmo8obwJ43mVcVm9xho5OqWNN9FKp1rMHdzUN2uPRZBpyTIFFec1/ADgN7EQjlAl4ATg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(6512007)(508600001)(36756003)(66476007)(186003)(26005)(4326008)(6506007)(8936002)(1076003)(2616005)(86362001)(44832011)(4744005)(6916009)(107886003)(5660300002)(52116002)(38350700002)(66556008)(38100700002)(316002)(66946007)(83380400001)(6486002)(2906002)(6666004)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2SL8KvppJiZdZ42mOa1y03W8BkNBgG3CosJIfARwG7fEVlOTYZLaFXH+vbHo?=
 =?us-ascii?Q?TFG4q/XvV/FclSMf8UOrNXCwG5Vnv1ddVuioQkZx0PRWC2QhL2pbjRdcAGAz?=
 =?us-ascii?Q?/ZxP6dsSoTQ+O2Np3Y6+uX5SBpWKyFHyIsaovvUsSKyefKy5ldqNlwtZW6rh?=
 =?us-ascii?Q?xBAB41ZQJpX5Y8AKuYEVEMv/x4PWL90saazB4Jo+6SFAYsEjS73+ntu4825v?=
 =?us-ascii?Q?iAXlzwqlLe2Z9cgzYXmuHDEAl2gah4rDj8vGTxT/YoAicr31x6MlbhieI0ED?=
 =?us-ascii?Q?uAz3i8pOWUIkF9zQtN1Li6+sYLxh5NVQASKbBGaKnstBfrEvorf0gaAMVBjj?=
 =?us-ascii?Q?T6uIOQg/FYT9N+RpxNsjEeZeovAqLXrDAUcPegeC/Q2oPda92UQNZYktOnEz?=
 =?us-ascii?Q?FopVsrdKAuwqFaFKTbXlAcfLR6A8T3sqo4MKK/BbSeLI6jF8z9fXycPTkyeO?=
 =?us-ascii?Q?CHIPXeuieS3Fu2J4rakGJwTWOBvRI4newdxz2swjn8cc+yvU88ObpYrbApYm?=
 =?us-ascii?Q?8oA5A/sSEjbaJlIoj4cUeZviSWQ+J8G9fiLNG04ToASSEziX98qMPnwWFZhe?=
 =?us-ascii?Q?FVqBDKPJe47LcfGvIadOEzwi6L0zmnhIfhF2zj103xX9BaUOdg04tW6i2Ssy?=
 =?us-ascii?Q?5fFwlsIwfTnXBh7FjEj2wrS78VCkxtOIw38g8iMvaWhKE0TvN3/M3bKZef0A?=
 =?us-ascii?Q?hBQgOR4bSQjHpN+yjIoCp0CVoTRExdMbVSs6Lj/HAnmudKAfYuBfALleJ0Ie?=
 =?us-ascii?Q?E/cp6RbXGYQEGb8ja/xpePp6uqEiKilRhekVSKXj+HiTw/muwAUUsTkzG/KL?=
 =?us-ascii?Q?DEcVUcBDhCITw2LEGCLqrWPJdzwsk7HVTQHuQch0aqSvrX5ci5aqtp8zrCEo?=
 =?us-ascii?Q?GZiLbTRnHTfjpFmOlX1NwKJGJl82ncK3XN98dxFQ2GBplzEnQUMQ9QGfogu1?=
 =?us-ascii?Q?q8FykM0KUzc0U5ugGNZr79pdyjMVUfuCUglyh1tIX1/0Lo6LD9Z4PHzw7UP2?=
 =?us-ascii?Q?KNHChSWal5NhaVSx3sYmvXD7ilAF8OO4uKa6pjuSmxjZF75kGh8bxjx3CCzQ?=
 =?us-ascii?Q?kWKDhz7+eJ8tqlnqRlznTa/NLhUhiCnovexGqrH6ylylTFMK78Fh203RlMWc?=
 =?us-ascii?Q?ofIvYvrE9kKH+Ph23mWTJZdkTP9+Q5oJk3tvBcbRY+5Ld0qJfvPJ/2LqF1KU?=
 =?us-ascii?Q?u4mQbnrJEiT8kmweUFhGT38biNM94mk+NTIti8J+CPlz6E8b2PqoETRv6/0k?=
 =?us-ascii?Q?qh1VY7wtRNyJFqy1w++3R5SjzBd/bEe61iexpJnxL5qXWGlmLWpM1SAJn5MK?=
 =?us-ascii?Q?PAnsGCQ0dR1RFCE0Vgov4/HoThwaSoi2qJa2se52DqytcYi2qpC/43bGJzHi?=
 =?us-ascii?Q?gVE6N7AJU8O27nFVCUouKZscQEcEZV6yml51wGK/VQZlLGeJgr/Zd5mzJ6Pv?=
 =?us-ascii?Q?0Y2TdH5WckdgSpyvEpJUcqGE++ey448KfOe2v5mz9bcEkydDlEB+0+Kg3zQZ?=
 =?us-ascii?Q?dHCDZweMsbSmXt6gXB04SHpOUb/4VqfehoLFEc+iirWIJ9CKeSBmWkpvKny3?=
 =?us-ascii?Q?ydkwWpcbiE36dclCH73+cJHWlBAyWAy1B2U+3DLx3nXnnFVIGFPBwvlF2Eug?=
 =?us-ascii?Q?N1vsVKrx58PgnDnEYFMyK6OtqmP8MvmB4MxBOFtfwZJBjtPwlAaXgduVlF5z?=
 =?us-ascii?Q?F7pImGp+sQDk2AnTcYtDaJEoKpE=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea32b790-fe63-4920-cd60-08d9d4768e02
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 20:19:50.6706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m+l1pupKufaq2W2/fT7fWuJhosu/yZR0rp11/kWyMgrOr4gZPF7YocBF248ZWMPkdNHdLYXMXYYswRJ0T1Ok450GhijVf+yakUm3IGDB+mg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT1PR01MB3497
X-Proofpoint-GUID: i4Iz23hkDWMQyoV9p9bI3GmaN--2KuPd
X-Proofpoint-ORIG-GUID: i4Iz23hkDWMQyoV9p9bI3GmaN--2KuPd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-10_09,2022-01-10_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 clxscore=1015 mlxscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 mlxlogscore=452 malwarescore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201100138
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some fixes related to the DWC3 USB driver and Xilinx ZynqMP DWC3
wrapper driver to allow ZynqMP USB to work properly when the hardware
is configured in USB 2.0-only mode.

Changes since v2:
-additional kerneldoc fixes

Changes since v1:
-added DT binding documentation for new attribute
-kerneldoc formatting and reworded comments

Robert Hancock (5):
  usb: dwc3: xilinx: Fix PIPE clock selection for USB2.0 mode
  usb: dwc3: xilinx: Fix error handling when getting USB3 PHY
  dt-bindings: usb: dwc3: add reference clock period fractional
    adjustment
  usb: dwc3: add reference clock FLADJ configuration
  arm64: dts: zynqmp: Add DWC3 USB reference clock period configuration

 .../devicetree/bindings/usb/snps,dwc3.yaml    | 12 +++++++
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi        |  4 +++
 drivers/usb/dwc3/core.c                       | 35 +++++++++++++++++++
 drivers/usb/dwc3/core.h                       |  5 +++
 drivers/usb/dwc3/dwc3-xilinx.c                | 17 +++++----
 5 files changed, 66 insertions(+), 7 deletions(-)

-- 
2.31.1

