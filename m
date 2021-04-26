Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3F0036ABB1
	for <lists+linux-usb@lfdr.de>; Mon, 26 Apr 2021 06:50:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbhDZEtb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Apr 2021 00:49:31 -0400
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]:41746 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229506AbhDZEta (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 26 Apr 2021 00:49:30 -0400
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
        by mx0b-0014ca01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 13Q4ieQH005844;
        Sun, 25 Apr 2021 21:48:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=proofpoint;
 bh=t1bKagAsYiRch5F7u6i1x8rDqAKQtWCOt4sONTHnVb8=;
 b=J3/ckXAeeI5bwJBaWK03xYAl8YwWlJ1iiZVyEfKKMz2axkI43+hEwacjJrbKhugTxv3x
 ZoKP4VE1ASSdNAgvyxj5oNKUsybiNqhx1uUjkEzpT4vkEz36Pcbr3t5eyMPOo+2oSbuU
 AXKDUAS9d0ucykL6FSklUqmd/FtE8SGDlcXFzEB2W0kYdyWpZWm+b1/VhjfH53Exh3N3
 kXnR+BwLfQnfcRgDKUxHHUu2vLQFPDCjyj3akLNrIZX4zv1qBIqlFNWSLcI/nAG4FBKo
 aoqdNrAMRIxMRe8+RcMIQRIBinkmQE46sM46EH/UQX2lrjAINe2yLRMqljTGES1NZJWg cg== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
        by mx0b-0014ca01.pphosted.com with ESMTP id 384ex14jdr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sun, 25 Apr 2021 21:48:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cKpn6cVKjeRajbZ9vJ5h9WP5DV0uxbYEVblM0BPfUc2rAMLySJSBbLyoy8oOfDDopQlxzzA3UA8EY+d48SMF/sfBEv2saG6At/2O1g0Bt1PYKk8Xha+Jji6+HTqP1xf8riPqy8VX53n+VYlPal7FVBO6fdTn0HiiptRWBXQPtug7N73wZ+8y/nXCxQer7/E45PeIgzhwYG8LJ7ojP0d+IkEr+U/v70KXJN7dj311i/YeNxfLAfveVKXqfrpxQGX9SeLD88z7eSF3kv/79gqxIeRE85rDaYMUYzfhgaj79PrX7IKl14OHXIujQuAjbjFJmEB0sskzd9CueMUkjlXRiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t1bKagAsYiRch5F7u6i1x8rDqAKQtWCOt4sONTHnVb8=;
 b=ksw4XYpul7v7cUbBFxea4L4E3ah0zmNlJ5QMBIN/CsUFiH8WRqCqUfsuRPWI8WH/wvBnYE+EUvdmRu9wlPf/6D7fFC1VUkcy4zEIJyclzKu+hudykWYlp1RG1UMYLGQ4+N6xN0ZDqDw9U2mdQG8LCjNz5w1/9qdGR4of2jTFx5CerUFxr1zHpPIFtS0JmxCm5bc98K9VDXE6lkoDnRAW5iYUIkt0hpr9pTL0oZ/9uQHT5v6bZ7UN+mGaDZuMHFgjgm6U09DiMiUH17AJBcWEeSww/u6O5wWtRejCWoOm6vqJAuSa9E5ZntOU/WLLMUcMkw8d4vymR6y9OwxJxKZhPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 199.43.4.23) smtp.rcpttodomain=gmail.com smtp.mailfrom=cadence.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t1bKagAsYiRch5F7u6i1x8rDqAKQtWCOt4sONTHnVb8=;
 b=DD1TCpmGyHV1S8+DiNc/SKmhubzMyA3WLBwEixCTgzXhi6Sp5GTMyNrNs6gW37LnL96W5BizPfs/A5wIc9j6iod6BBbFPXtXHQPfOi1W906sazoiuWdIFHbtutiZiWV9mpF3roADowKvDblgJ7FzB+o+tgk0O3bC9luU+mcav80=
Received: from MW4PR04CA0281.namprd04.prod.outlook.com (2603:10b6:303:89::16)
 by MN2PR07MB6766.namprd07.prod.outlook.com (2603:10b6:208:16d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22; Mon, 26 Apr
 2021 04:48:44 +0000
Received: from MW2NAM12FT062.eop-nam12.prod.protection.outlook.com
 (2603:10b6:303:89:cafe::bb) by MW4PR04CA0281.outlook.office365.com
 (2603:10b6:303:89::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21 via Frontend
 Transport; Mon, 26 Apr 2021 04:48:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 199.43.4.23)
 smtp.mailfrom=cadence.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=cadence.com;
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 199.43.4.23 as permitted sender) receiver=protection.outlook.com;
 client-ip=199.43.4.23; helo=rmmaillnx1.cadence.com;
Received: from rmmaillnx1.cadence.com (199.43.4.23) by
 MW2NAM12FT062.mail.protection.outlook.com (10.13.181.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.16 via Frontend Transport; Mon, 26 Apr 2021 04:48:43 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
        by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id 13Q4me1p013102
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 26 Apr 2021 00:48:41 -0400
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 26 Apr 2021 06:48:39 +0200
Received: from gli-login.cadence.com (10.187.128.100) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1497.2 via Frontend Transport; Mon, 26 Apr 2021 06:48:39 +0200
Received: from gli-login.cadence.com (localhost [127.0.0.1])
        by gli-login.cadence.com (8.14.4/8.14.4) with ESMTP id 13Q4mcZG006460;
        Mon, 26 Apr 2021 06:48:38 +0200
Received: (from pawell@localhost)
        by gli-login.cadence.com (8.14.4/8.14.4/Submit) id 13Q4mc7s006454;
        Mon, 26 Apr 2021 06:48:38 +0200
From:   Pawel Laszczak <pawell@cadence.com>
To:     <balbi@kernel.org>
CC:     <gregkh@linuxfoundation.org>, <ruslan.bilovol@gmail.com>,
        <jbrunet@baylibre.com>, <linux-usb@vger.kernel.org>,
        <kurahul@cadence.com>, <peter.chen@kernel.org>,
        Pawel Laszczak <pawell@cadence.com>
Subject: [PATCH v2 1/2] usb: gadget: f_uac2: Stop endpoint before enabling it.
Date:   Mon, 26 Apr 2021 06:48:15 +0200
Message-ID: <20210426044815.5393-1-pawell@gli-login.cadence.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15986aa1-492c-4c1e-cb0f-08d9086e9229
X-MS-TrafficTypeDiagnostic: MN2PR07MB6766:
X-Microsoft-Antispam-PRVS: <MN2PR07MB6766EC7BDC389E63BA21C63BDD429@MN2PR07MB6766.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LInPkc0eGkJq5CWLVr0D9Y/Z0/gyf1cU06unqCCIqvPac+CzpNu/ic9RqRe4T1gEMeftmMt1gVZisThV3/oXdb2gUx5YUFcHZ6Da29WgG8PDI7fA3m0+4yhXRONAuL6WnM1WHnxzX2fGnbzAo3R8GUinjLPUJ32BVDhWAmsEJf6OqYxZABIMlM3ohsxPmM9rdE9Yl8rwAMLAE+XcXPDAkZn8V48iyhtxdH9dtajkKAwKZvXiad8QIpyP9/UfU5o+iH55drx1Niev7Gbtm1aRC4gfSlyChxfq5wo6Lc13Vt76f5vVtHrGw4huIUu2GmuVlMKiYFVawlVDoo+UYcFe5FglzwZHSKafWjfl1ZXvy80G9p2S+DQ0agrf49+xInQ1+zPewj7ou8aWK8uBZvlNHECFBdojC1bFpUMy1ypRJHc3xhTHrfWTh0yaiDLN/hlXLex59U4rAHw1eK/V1EHZY/JV/LyRLK0zRj5nB0oLvuO46jTMZMZEeaRsjQOMqP569rJlq3m9QPPDCf9HoNHo5O1MxGsrIG6BoRhIWPkCbXzDFNW8czuxHaUX9ZNm2fC7rZsojLfqARe/RZ4sPA7R4T5EG1uWjI+KfRuLo8+aXGhivJzcKzsOD5/1FjAJjm4CIKEpq27FWRGPhdEN7glKafJ7mt6GZ0/kifuzmBjMGcMHo3SM2drRKhW4nzknZ2aRYvRb79dIBcQ0oNgDcO8jng==
X-Forefront-Antispam-Report: CIP:199.43.4.23;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:rmmaillnx1.cadence.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(39860400002)(346002)(36092001)(46966006)(36840700001)(36906005)(107886003)(36860700001)(42186006)(316002)(86362001)(81166007)(2906002)(4744005)(82310400003)(478600001)(6916009)(1076003)(6666004)(82740400003)(47076005)(8676002)(70206006)(356005)(54906003)(70586007)(4326008)(5660300002)(8936002)(336012)(26005)(426003)(186003)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2021 04:48:43.9823
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15986aa1-492c-4c1e-cb0f-08d9086e9229
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9;Ip=[199.43.4.23];Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-AuthSource: MW2NAM12FT062.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR07MB6766
X-Proofpoint-GUID: MGqdVou-F9iW4zNSGYZ25Jh1-KWhEHzl
X-Proofpoint-ORIG-GUID: MGqdVou-F9iW4zNSGYZ25Jh1-KWhEHzl
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-04-25_11:2021-04-23,2021-04-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check score=0 mlxlogscore=640
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 phishscore=0 clxscore=1015 mlxscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104260032
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Pawel Laszczak <pawell@cadence.com>

Patch adds disabling endpoint before enabling it during changing
alternate setting. Lack of this functionality causes that in some
cases uac2 queue the same request multiple time.
Such situation can occur when host send set interface with
alternate setting 1 twice.

Signed-off-by: Pawel Laszczak <pawell@cadence.com>

---
Changelog:
v2:
- moved disabling endpoint into u_audio_start_playback

 drivers/usb/gadget/function/u_audio.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
index 265c4d805f81..c4bbc9decaba 100644
--- a/drivers/usb/gadget/function/u_audio.c
+++ b/drivers/usb/gadget/function/u_audio.c
@@ -401,6 +401,10 @@ int u_audio_start_playback(struct g_audio *audio_dev)
 
 	ep = audio_dev->in_ep;
 	prm = &uac->p_prm;
+
+	if (prm->ep_enabled)
+		u_audio_stop_capture(audio_dev);
+
 	config_ep_by_speed(gadget, &audio_dev->func, ep);
 
 	ep_desc = ep->desc;
-- 
2.25.1

