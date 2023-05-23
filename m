Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 870B770D98E
	for <lists+linux-usb@lfdr.de>; Tue, 23 May 2023 11:51:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236483AbjEWJvi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 May 2023 05:51:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236287AbjEWJte (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 May 2023 05:49:34 -0400
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01on2057.outbound.protection.outlook.com [40.107.15.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C5F1119
        for <linux-usb@vger.kernel.org>; Tue, 23 May 2023 02:49:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OKj89HW/UTxEVC4r3sTMTjEjVeznGHEpPwbZqLb2occDRDoNqgriBRhqSi0KXY23Wf62zd30hszlYp/8MUAZz5ox5Yu/AmE+fgo0BPmTMWo1W9B5OGn6tfibf7eOm7J7s08mQ9H4JTsvSXlq+LQ28DPkuqi/kJEwW6cFkX2Vu2D/9aDPhUA3Nnj2voNXirkuIQdudQvLoMT3A3dRzoJzNChGlGoVoWCXfuXm++d4hMwvrISzADIlT1kYTAMpEofiHv6M7aRP0KuBdP8cSpzB0cH3SSO6Ip7UaQ5lVhjwhLpwFpA9mDOFoGVE68R8guf2o+sXGVu2ZRZvNJ1bgLvNWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kKF88GiL5Q7F2wwnqtDLoPj63gbLGEgVEfvuvgjc7fA=;
 b=WBV6gDnFcxMUJdzfQ8hiSkvR/Jv3Sz5N6h+R2BzJ46SVqDfYFxZ5doc5UsbJkoojUVlRD6TeOIZAlXzgCHLf3/t/9gWU6eViqS51MngYWbKbQ+J4mQ4BmpOZKZGSjsfLig727L2HeCugjEOg/YcI5w/1f9hK0mSEEUS5UsG53JlS10o12+h4rAxHaAZK1Nyzye+qZbSSxZRAsJ2+7Cqygb9eqJIQg2ZbZR5crpBRbTUFJ80HWM9VKkDoqumjjk5Knih+ZvV6f+02EcJhDlE9nG7uVq2df3iI/tEyAcYZCh4UH6tFePHwgOXFB3k5QTZIwnMMact7GOR/71X6de/TFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.19.86.146) smtp.rcpttodomain=suse.com smtp.mailfrom=nordicsemi.no;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nordicsemi.no; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nordicsemi.no;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kKF88GiL5Q7F2wwnqtDLoPj63gbLGEgVEfvuvgjc7fA=;
 b=Tq6wF6xlTq7eqqcghkTszvz/pVtHeuR9Rcq0CqxndC8maq+UjYaBJemTFDitoFariuiuRMhRQqIsaBGQmdTXyqfsO9AynVaMu6wvmAqitboDJ4uw7tijn6OkBXBbS5IDjE71bT9KUtFx1yXm/q3WgYXZ2bSqlMTaqNQO7bFQ7qmN6leDEHL1gE/N47mNtACxAIE6wmOo4L1dEjO4/Z/bPCLVitONA6cigY0pHK8H5EwoUqYqckSEkvX7w6OLKzK2G8iV8O/VtWwR6XmPd6oNOGzH3GxGelPvb+9QweeZ2e5Key5wOreCzXaU8/AB+4/CsRXDpqJg7XgIJXpt2QI59g==
Received: from AS9PR01CA0008.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:540::10) by DU0PR05MB10060.eurprd05.prod.outlook.com
 (2603:10a6:10:47a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 09:49:21 +0000
Received: from AM7EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:540:cafe::a0) by AS9PR01CA0008.outlook.office365.com
 (2603:10a6:20b:540::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29 via Frontend
 Transport; Tue, 23 May 2023 09:49:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.19.86.146)
 smtp.mailfrom=nordicsemi.no; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nordicsemi.no;
Received-SPF: Pass (protection.outlook.com: domain of nordicsemi.no designates
 194.19.86.146 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.19.86.146; helo=mail.nordicsemi.no; pr=C
Received: from mail.nordicsemi.no (194.19.86.146) by
 AM7EUR03FT041.mail.protection.outlook.com (100.127.140.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.6433.14 via Frontend Transport; Tue, 23 May 2023 09:49:20 +0000
Message-ID: <f2d012f027249718d257456856f46645fae0d8c4.camel@nordicsemi.no>
Subject: Re: USB 2.0 host controller for Thunderbolt 4
From:   Tomasz =?UTF-8?Q?Mo=C5=84?= <tomasz.mon@nordicsemi.no>
To:     Oliver Neukum <oneukum@suse.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        "Mika Westerberg" <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        <linux-usb@vger.kernel.org>
Date:   Tue, 23 May 2023 11:49:17 +0200
In-Reply-To: <0dc2e12d-052f-aa59-07df-5158b924ec12@suse.com>
References: <bd807b391dec726401e36a25f8c8987571d771be.camel@nordicsemi.no>
         <0dc2e12d-052f-aa59-07df-5158b924ec12@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1 
MIME-Version: 1.0
X-Originating-IP: [10.241.138.38]
X-ClientProxiedBy: exch02.nvlsi.no (192.9.200.127) To exch01.nvlsi.no
 (192.9.200.126)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7EUR03FT041:EE_|DU0PR05MB10060:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c0cd1ba-1870-451a-6644-08db5b72fb8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DDSZpQQ9050mhyazQJgfqNlKUXY74N8qpveopcNuF2kxyZwVxxO25m++BWsiX4r1p+uMAL1QtbctC5k6FhMZUqw0uDXrCPjdrp7a4y4u/dpPHvefwFWJvMffN61rSvjaC5FimT1ZQz68DSEvbMxw64h8V4ySkJJ2qdBO1xZGi2LBvavi3ZryBvjqLjB5Zvotg9B0MSQtg6NdmUACf2LcjazCbjuORl/prrwOK/gjTr6+/A2PFj8aIqo05DmTIsOsDLUjka/0Js9EyyeVLjeMylMXWhlu2b5j6BVCwDc8vNPCl9TD6I8ao3bHFh3Q9yCT20GDEoM9MYpYuworku8l/22bJgNdY8C9YQ52iLMcH+ruCir/9Qi0TXDhhyZNXZnpb+8m0HUaUWrF4Dtbhxdjn4xTlzcz1pfX5ISwSffqSAzxLQ5ofHM2nP/MOkFJNgJno8vTxKQUy/Z/TehEvNKtJnjprqKU0aN7Q1LxmLT5+4VYoXRTe3r4TW54gE2IbOEGsqPQJU+88j7PIp8UFMoG7iaTYXqSEKeSuYT1+7k6IpdMI4L9uorfm9VG1UUvOa4gIL1XhVimhMu3c0QQEB01pU6A7Nt1Hqd6ebdRsV3pqA5enkIowMcCkqTCwnxoKOf/judcoirbM8Oobk5WQnuKTcujrd/DxMGItCgHkxhOZpkBgL6Gf0LzU94Ahvyt9zFD6RzgW5yPjspIiSF+1DXh6A==
X-Forefront-Antispam-Report: CIP:194.19.86.146;CTRY:NO;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nordicsemi.no;PTR:mx01.nordicsemi.no;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(346002)(376002)(396003)(451199021)(36840700001)(46966006)(36860700001)(47076005)(53546011)(9316004)(7636003)(356005)(26005)(82740400003)(118246002)(36756003)(956004)(2616005)(40480700001)(2906002)(186003)(336012)(36736006)(316002)(6666004)(70586007)(70206006)(41300700001)(6486002)(7696005)(82310400005)(110136005)(478600001)(86362001)(8676002)(8936002)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: nordicsemi.no
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 09:49:20.6932
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c0cd1ba-1870-451a-6644-08db5b72fb8e
X-MS-Exchange-CrossTenant-Id: 28e5afa2-bf6f-419a-8cf6-b31c6e9e5e8d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=28e5afa2-bf6f-419a-8cf6-b31c6e9e5e8d;Ip=[194.19.86.146];Helo=[mail.nordicsemi.no]
X-MS-Exchange-CrossTenant-AuthSource: AM7EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR05MB10060
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 2023-05-23 at 11:44 +0200, Oliver Neukum wrote:
> On 23.05.23 10:53, Tomasz Mo=C5=84 wrote:
> > Hello,
> >=20
> > Dell Latitude 5330 with 12th Gen Intel(R) Core(TM) i7-1265U contains
> > following PCI devices:
> >    * 8086:461e - Alder Lake-P Thunderbolt 4 USB Controller
> >    * 8086:51ed - Alder Lake PCH USB 3.2 xHCI Host Controller
> >=20
> > Thunderbolt 4 USB Controller initializes first and therefore following
> > usb host controllers are registered:
> >    * usb1 - USB 2.0 High-Speed
> >    * usb2 - USB 3.2 Enhanced SuperSpeed
> >    * usb3 - USB 2.0 High-Speed
> >    * usb4 - USB 3.1 Enhanced SuperSpeed
> >=20
> > When I connect SuperSpeed device directly to the Dell Latitude, it ends
> > up on usb4. Low/Full/High-Speed devices end up on usb3 as expected.
> >=20
> > When I connect Thunderbolt 3 dock, two new host controllers show up:
> >    * usb5 - USB 2.0 High-Speed
> >    * usb6 - USB 3.0 SuperSpeed
>=20
> Could you provide lspci in that state?
> AFAICT there is nothing that would prevent a vendor from putting
> a PCI HC into a TB3 docking station.

Below is diff between lspci output without and with Thunderbolt 3 dock
connected.

--- no-dock	2023-05-23 11:20:13.709836495 +0200
+++ tbt3-dock	2023-05-23 11:21:31.052970007 +0200
@@ -1,24 +1,31 @@
 00:00.0 Host bridge: Intel Corporation Device 4601 (rev 04)
 00:02.0 VGA compatible controller: Intel Corporation Alder Lake-UP3 GT2 [I=
ris Xe Graphics] (rev 0c)
 00:04.0 Signal processing controller: Intel Corporation Alder Lake Innovat=
ion Platform Framework Processor Participant (rev 04)
 00:06.0 PCI bridge: Intel Corporation 12th Gen Core Processor PCI Express =
x4 Controller #0 (rev 04)
 00:07.0 PCI bridge: Intel Corporation Alder Lake-P Thunderbolt 4 PCI Expre=
ss Root Port #0 (rev 04)
 00:07.1 PCI bridge: Intel Corporation Alder Lake-P Thunderbolt 4 PCI Expre=
ss Root Port #1 (rev 04)
 00:08.0 System peripheral: Intel Corporation 12th Gen Core Processor Gauss=
ian & Neural Accelerator (rev 04)
 00:0d.0 USB controller: Intel Corporation Alder Lake-P Thunderbolt 4 USB C=
ontroller (rev 04)
 00:0d.2 USB controller: Intel Corporation Alder Lake-P Thunderbolt 4 NHI #=
0 (rev 04)
 00:12.0 Serial controller: Intel Corporation Alder Lake-P Integrated Senso=
r Hub (rev 01)
 00:14.0 USB controller: Intel Corporation Alder Lake PCH USB 3.2 xHCI Host=
 Controller (rev 01)
 00:14.2 RAM memory: Intel Corporation Alder Lake PCH Shared SRAM (rev 01)
 00:14.3 Network controller: Intel Corporation Alder Lake-P PCH CNVi WiFi (=
rev 01)
 00:15.0 Serial bus controller: Intel Corporation Alder Lake PCH Serial IO =
I2C Controller #0 (rev 01)
 00:15.1 Serial bus controller: Intel Corporation Alder Lake PCH Serial IO =
I2C Controller #1 (rev 01)
 00:16.0 Communication controller: Intel Corporation Alder Lake PCH HECI Co=
ntroller (rev 01)
 00:16.3 Serial controller: Intel Corporation Alder Lake AMT SOL Redirectio=
n (rev 01)
 00:1d.0 PCI bridge: Intel Corporation Alder Lake PCI Express x1 Root Port =
#10 (rev 01)
 00:1f.0 ISA bridge: Intel Corporation Alder Lake PCH eSPI Controller (rev =
01)
 00:1f.3 Audio device: Intel Corporation Alder Lake PCH-P High Definition A=
udio Controller (rev 01)
 00:1f.4 SMBus: Intel Corporation Alder Lake PCH-P SMBus Host Controller (r=
ev 01)
 00:1f.5 Serial bus controller: Intel Corporation Alder Lake-P PCH SPI Cont=
roller (rev 01)
 01:00.0 Non-Volatile memory controller: Sandisk Corp Device 5015 (rev 01)
+3a:00.0 PCI bridge: Intel Corporation DSL6540 Thunderbolt 3 Bridge [Alpine=
 Ridge 4C 2015]
+3b:01.0 PCI bridge: Intel Corporation DSL6540 Thunderbolt 3 Bridge [Alpine=
 Ridge 4C 2015]
+3b:04.0 PCI bridge: Intel Corporation DSL6540 Thunderbolt 3 Bridge [Alpine=
 Ridge 4C 2015]
+3d:00.0 PCI bridge: Intel Corporation DSL6540 Thunderbolt 3 Bridge [Alpine=
 Ridge 4C 2015]
+3e:01.0 PCI bridge: Intel Corporation DSL6540 Thunderbolt 3 Bridge [Alpine=
 Ridge 4C 2015]
+3e:04.0 PCI bridge: Intel Corporation DSL6540 Thunderbolt 3 Bridge [Alpine=
 Ridge 4C 2015]
+3f:00.0 USB controller: ASMedia Technology Inc. ASM1042A USB 3.0 Host Cont=
roller
 72:00.0 Unassigned class [ff00]: Realtek Semiconductor Co., Ltd. RTS525A P=
CI Express Card Reader (rev 01)


--=20
Tomasz Mo=C5=84        | Senior Firmware Engineer
P +48 882 826 111 | Wroc=C5=82aw, Poland
nordicsemi.com    | devzone.nordicsemi.com
