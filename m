Return-Path: <linux-usb+bounces-15484-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6F1986AF4
	for <lists+linux-usb@lfdr.de>; Thu, 26 Sep 2024 04:28:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DFA41F22454
	for <lists+linux-usb@lfdr.de>; Thu, 26 Sep 2024 02:28:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02770179967;
	Thu, 26 Sep 2024 02:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="gevCujZp"
X-Original-To: linux-usb@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011012.outbound.protection.outlook.com [52.101.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC07E176AD8
	for <linux-usb@vger.kernel.org>; Thu, 26 Sep 2024 02:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727317696; cv=fail; b=VM/U5SSGdY/jRE2/AEvfoRY8g10FZ4oHCBjHeIGhd9N3wBhg4HXhEZhfqMQ0S8h96qN7lXifICu8PNdp25gyHKJGCRNmgi3gHTJ0ljArsR6XAMwzgV5ZOqDI+Jms1t6r4t6cYd+oqLTrlkBNKLHVlX59oCHO3Rlxt8Mgk4vu/oM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727317696; c=relaxed/simple;
	bh=Lrrwj6NiMzyP2cq9BL6kbc4Yi8RzK8EvwTSy00OjDcc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nZiiqxfhwoxHK6QBrUSCcoPb3b0kj+vmbtLnB3fN5n19nIuTmFgKms4vo4o0sDbmb0xwaCM/CHHzJYeDKgPEBgnv8obXiyYwgPEVUAWqIHsqW48x4RToTQ6kUO3wAZjH+lt+xNnQUvxzwpANz6fdp9oynec1Go4on0O7RNDU7Ts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=gevCujZp; arc=fail smtp.client-ip=52.101.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GGQidC20QARqA1TRT72cuTH/U36FVlul/k5AnPen8Wmc0NTSIO4Zy3/kg3wYIC1GomnoumMEh66Dkp63GfbDuOmzflvXEkuJ/woO1FBC7dyrcLv7CQHD5oHf3HsGJwd9nldy8AklWzaTL1eCcYavSlxinyLkWntFUBDEaoedPaOvSgoQxBzvxQ2fKJA8lKqHUBPt5tzKtytL9EoWc3Ccin3IPcIUnSKFT+XAZpeWq/czfRfk5jWNwh8i/gfXzMR6vlSAY+QNrCapZsd4a4t9OwGLLSQCfhqWoZwMtuFjE4kw8iY0GioBVBlcx/gNDdKSN6UDKw1pXsHsSi8vJWriGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/WfcSE+/dbFQGApHyge6JosWtJgWNuIhIWMdDupYxTE=;
 b=rziem/CINMt7yNFzg6wnrEBn36JISoPCye+fkpK/pSdsEHhnm+uT1OYXBB5iAPrYQMMQ31V0cxlWeszSn0xR6Kyv6YbN7k8wW7eSAAN9syWCDMkXny/R45FljdTUQuC/XtsIRsjZsB9PaeW9Y5VlCiEzM+KZF6ASX+slz6yKUo4Hm5AMy8N0a6nXcOCfqwkoRWJAJ1Q4eLBvqXf9mD80uC+81fnQGyveLhEmdlTCip4CJTS+HiPvTRlaFVx4tvUWRrnKNuykXIMTMzVYrTC+ldYqQFWo9bEvx5N5jhGf0hGvMtrNX3RhuRqAgSro8ZVDnYT+d/Fpyti4bVRAuiuQeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/WfcSE+/dbFQGApHyge6JosWtJgWNuIhIWMdDupYxTE=;
 b=gevCujZpgMGPaa+cNVxCR6ZSTmAfzO4DeGj8zEOfcTM6ejGWaBrLGrz06+YHWvt8Q+WYFm+LkS/GrzBHmChdZzgyBI5sut5kPVonWy66WorlgVds78XtPz9s8UcSU7SuTQDXlozWvgOxq9g3QFtvMZd2D2e9QnaLo5ZmKG/KYa/wV9VVGn00Y6XYNtEcpxz5OjawmNsJUwjV6PzCtLdjvqa2s492gOoQ/Hu61jnSIKUYnCVpc62CfCAoA2SDCjYyP6PMkwzbwk/Vm+aa3GB6yF47Yu9jRGymITOluxEtAewEAiSVjPQZhacex679j/lXzmh/bjsQpUZAtFFTlDdEqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by DB8PR04MB6972.eurprd04.prod.outlook.com (2603:10a6:10:11c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Thu, 26 Sep
 2024 02:28:07 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad%3]) with mapi id 15.20.7918.024; Thu, 26 Sep 2024
 02:28:07 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH v3 3/3] usb: chipidea: udc: improve error recovery for ISO transfer
Date: Thu, 26 Sep 2024 10:29:06 +0800
Message-Id: <20240926022906.473319-3-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240926022906.473319-1-xu.yang_2@nxp.com>
References: <20240926022906.473319-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0011.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::14) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|DB8PR04MB6972:EE_
X-MS-Office365-Filtering-Correlation-Id: 435e2b45-4221-4708-6473-08dcddd2db66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?C/7N4bfarG3DDWjEuim2+4yh3NtON9kq17iWSmi+lYf19GDn5GQtYMA902vx?=
 =?us-ascii?Q?H8b2jgOow0gBlVialPZsQBCHCTjdE1fh7Nsk58rudpvNesLGn+q3tG6MVZXv?=
 =?us-ascii?Q?HssPevO/bHTGbUp0ctf2zOirRK30itf/e58hdKlzxz+p6yOeZtvMBiWcnLee?=
 =?us-ascii?Q?hwxo7z8ousoz/TBS7cfk8HWor1yE0EVO7Ru+IvVTSraovdy1dZzMmaPO+l/5?=
 =?us-ascii?Q?ONuTy4F2Mun3t/TI7htZln6ykfUowL4ZMGyZt1wCTn1vT91G/Cde3kFYTFlM?=
 =?us-ascii?Q?H4YkiEXK7pGFLRnosmbjJDm2NZrlNbQoGQkqkKH/f97c6zK7jkacCIA0gkeG?=
 =?us-ascii?Q?xMYQjFYat0cfPogfdjN8JNkLaM4IsB7KdRNN77crLRB/nLCYAUetkFjQBIRU?=
 =?us-ascii?Q?VN//AgQlo0cmx/AQP8ugbSgQF2suaukeAal/cuW7P9KFonl03xxX+nbHwKz3?=
 =?us-ascii?Q?LIM6RYfoOT0FBZAbwoFCsn11atjqrGli8d30Byl+nwQgkLB6HDriOu8cpVd0?=
 =?us-ascii?Q?oE4S6bGLMCLSveu7GpfyvXZTzs2okhXmRj0Ta6X7nt4mnY67XRyVGeIUfzor?=
 =?us-ascii?Q?IKCbo2Gce5hZV+rColVoagoe6a8ireh7WxmbLpVl1nZdAf5g3HmruZefnIk3?=
 =?us-ascii?Q?l2QKK7HVMn3CfFdxN1ZsiQCYy8EBgANejmKaMlBCVXp1x3XRXpkKYVGWaVOb?=
 =?us-ascii?Q?qoVR+r1mzYHBF6w3Hc9v2SgL8ysFBCo+Ei+qngeoX5AZXKFMvjRUh9KdlvM/?=
 =?us-ascii?Q?RBLXyQuVr9WaPRV0I2soJs9D1h+6qr5ehUdEtTXmuNJ6aF1x5A/Xk35HlxDa?=
 =?us-ascii?Q?8vHcgTmKeE79eMrvRoS93s/zr6I2mDEGoZpzdRBSVwMZ1PeTkk7eTu1/3rvf?=
 =?us-ascii?Q?Xcy1xRJWU/TllDiWQiuuzEMM3uodD8VrtV7IFnh+Um3acdAAbnj5JpcHGNed?=
 =?us-ascii?Q?7Gn6dJk84NAT+fB3904ExGgzGtKkUAxGmoeNm/tBflAHElgABSMpT7DJkR1e?=
 =?us-ascii?Q?fKpzhLnoRZEqqEEPNOdPcQkdaccwXW61zUAor/1UAknYbxqPZ3nknGzT9gGV?=
 =?us-ascii?Q?ldeCU9k6zA6mBCOKP6FDnwU51HB35CFfFVKRDzn5TV7RDJbk9DJejYR05eh8?=
 =?us-ascii?Q?/WdB3Fu9rkR8ZZq07ukb1mMYTjyfrVsECiyuJ/E5sIRutWWXLaW53ZxNL/iu?=
 =?us-ascii?Q?zzieeEnGulBN/WUsLRRDIKHivgx7HIgl5WRaITxMLdTeHitA8eaeLrNEvZ+8?=
 =?us-ascii?Q?yZJGKqDds0ikwPlnBJluTr7ohgxvU1HF7rSrCWB1WSfSlk8loyfs+nbuLnUN?=
 =?us-ascii?Q?sJLmFv+yCssCEXaRZNGLKqrbVv8gzu/dMl+d/c1eMdYUAriqBQSH8l2+4NPu?=
 =?us-ascii?Q?W+tgU8EtZvedMMR35NXZisyzJqs5HqDkNiRv+MDHrhyc2IqY8g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?abbc+Gy+dXXTmbyfNcQUxplu/CjAd4TC97mPKxl3EushN6PKGO+1LnxQure0?=
 =?us-ascii?Q?aICSUPZ1IkZndR5YBzYGWif+f8O+MP2UhWSY7LfAfGsDes6/6NCqlPx9vsve?=
 =?us-ascii?Q?lV0JoCFs0ikZSlW3lxaIqnWbPjICCVXrK6yGbyNcGTYod1PvVnKejHsnZdWh?=
 =?us-ascii?Q?9aPA8A5HtB3etWRAP1RmjO3OX93Hp1K4gTR11JDMoXjFbJ+Bi0bZtlwKUc4p?=
 =?us-ascii?Q?prlDHPiV5brPo8RN0AP6XM1g+htV+bLXUD9GoMFI7/j2ZpUhEWCdHKjhqTFe?=
 =?us-ascii?Q?1UDS/jXFas6juh+8lQLsQYhAnCAlDwYLIm1L8nmGqZsV8oVK8H6PRfhhtgFe?=
 =?us-ascii?Q?io+9mSrswaOxRLhQAumil44BCKUaCCwzE/r1f9kAX+wKgAqgIeKY+IIM7/TW?=
 =?us-ascii?Q?h5h5mlXSjqjhJumG6V1T0G9Whj2Xq76QMAUiVTLJoj1VL73f8OqaAlVuf1Vi?=
 =?us-ascii?Q?AVGZjeDI8OeT75uX5EAu7QXkQT69vZmKo3XCD+lrTt/UsyK2HT/1A35EHUeE?=
 =?us-ascii?Q?ryMGi8D0jZ45434jSKcHAgRCZZn2F3toaJxTA+KyCDMMZ6TWPBH2c38CwHpA?=
 =?us-ascii?Q?osNJjfQ2sHSvNpBruL7/MALD8PuMXMtVfszidyGKJINLIAx8L/vA77QdLfpr?=
 =?us-ascii?Q?Gae5Idabb4e9FM1KfFWcDDM19Vd0TE08Nf9ADOhoV5iJvSFuAIi3kDTGFJ96?=
 =?us-ascii?Q?GBVXQyqg7Q0MDsrZWoPNIC2JY3euBiNl3QtyE3ZkvLVJzNR7bcdkSIMco56q?=
 =?us-ascii?Q?1pY3AxvYHURSryFe9bQP4eDKsb8IFO0xy7brTEN352/XI6Cwc9b7Gf88jFnf?=
 =?us-ascii?Q?5vuoqv3yqLCkDGI3Nm7bsDu0c2jdAfgR5GFT1WZbTUNsoRHgi9KryJY69/Cv?=
 =?us-ascii?Q?tkVT8UTs4188h2vnGP2mKx96ngXNcMaK0lrv5DeVqG3mCkbJvNcV6Zu3JdHY?=
 =?us-ascii?Q?w4qky09jUMYTi+8J0827WpC/T5UU7Edhj1Ac7PqVQ8lJV+1EGoSC3VPWkZ+c?=
 =?us-ascii?Q?Q+iOUin6uafnELo0H5xpvYujBO0yGqxtUfpBrO/DEPqU+CDrYqjla9VIqFhS?=
 =?us-ascii?Q?TI4TZiuU/mNClmiemx9c55fTF3OCIZwtIuwVGui2dlem8nNywSEXyWT8uhLI?=
 =?us-ascii?Q?UxMtfkQOqyBxjEA0OX94n/XxZ3+zCRrGfbM88uyfWC6hcq376BkL3JkCtRGw?=
 =?us-ascii?Q?E86Rgo8DSUtQsLSSgG8O/FtLl0tVuX9gJflmbnJGteZ0TjeWKVFt996SRZ/S?=
 =?us-ascii?Q?G3ALaJgy6yK/uDkq1vbeogHzewl0aa5C88t90syRzTSb2L0Uk/2DgTjze0Jg?=
 =?us-ascii?Q?c19vC0w4saOKk9mfN/XYqxFtR1mX5kUMa7GsmIYlRFz1SeBT9mCOv6iGchab?=
 =?us-ascii?Q?siE8uKMuOwjFikkK9C5luNwDsvdR6wY7tEHsySZvmzT9YiXia/tNVIYyq6D5?=
 =?us-ascii?Q?8xBTAetkVnEkasSOzUUc1HUOvaA8cxxq9bUl4viwCP1pXDLDrbylvS32Nuhq?=
 =?us-ascii?Q?iiKwXDSBly631IQ4qYxHUXDzaeAgTCZp6oG3iLc5QIB6Pn8JYXZpA3ShN/hR?=
 =?us-ascii?Q?pTxaNVf8WHT/AYFNdVs9aR8Ngky5JpvaqbPhHY5F?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 435e2b45-4221-4708-6473-08dcddd2db66
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 02:28:07.7607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bVAavy1lihJtzhtsXsrK1IGUxzSvQFH3j64xDvI3hEpntNkvAegKTx4C9nzDZquUMwIxn7debNoaqj4STyDTew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6972

Impove device mode ISO transfer error tolerant by reprime the corresponding
endpoint.

The recovery steps when error occurs:
- Delete the error dTD from dQH and giveback request to user.
- Do reprime if dQH is not empty.
- Do prime when new dTD is queued if dQH is empty

Acked-by: Peter Chen <peter.chen@kernel.org>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - modify commit message
 - keep "hwreq->req.status = tmptoken & TD_STATUS"
 - giveback status 0 to user for isoc error case
Changes in v3:
 - add Acked-by tag
---
 drivers/usb/chipidea/udc.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index 0132bb25c9b5..18c1882cf088 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -683,6 +683,7 @@ static int _hardware_dequeue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
 	unsigned remaining_length;
 	unsigned actual = hwreq->req.length;
 	struct ci_hdrc *ci = hwep->ci;
+	bool is_isoc = hwep->type == USB_ENDPOINT_XFER_ISOC;
 
 	if (hwreq->req.status != -EALREADY)
 		return -EINVAL;
@@ -696,7 +697,7 @@ static int _hardware_dequeue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
 			int n = hw_ep_bit(hwep->num, hwep->dir);
 
 			if (ci->rev == CI_REVISION_24 ||
-			    ci->rev == CI_REVISION_22)
+			    ci->rev == CI_REVISION_22 || is_isoc)
 				if (!hw_read(ci, OP_ENDPTSTAT, BIT(n)))
 					reprime_dtd(ci, hwep, node);
 			hwreq->req.status = -EALREADY;
@@ -715,11 +716,15 @@ static int _hardware_dequeue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
 			hwreq->req.status = -EPROTO;
 			break;
 		} else if ((TD_STATUS_TR_ERR & hwreq->req.status)) {
-			hwreq->req.status = -EILSEQ;
-			break;
+			if (is_isoc) {
+				hwreq->req.status = 0;
+			} else {
+				hwreq->req.status = -EILSEQ;
+				break;
+			}
 		}
 
-		if (remaining_length) {
+		if (remaining_length && !is_isoc) {
 			if (hwep->dir == TX) {
 				hwreq->req.status = -EPROTO;
 				break;
-- 
2.34.1


