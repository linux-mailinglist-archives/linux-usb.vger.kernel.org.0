Return-Path: <linux-usb+bounces-155-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E59987A209F
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 16:16:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04CB51C20D05
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 14:16:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A61711194;
	Fri, 15 Sep 2023 14:16:07 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A7D10A09
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 14:16:05 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2053.outbound.protection.outlook.com [40.107.220.53])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BDA31FD7
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 07:16:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HneIbNp3gucmiW3M5lAIJrG1JmlfdITpIRniDGnpVvDPJISr41OBRR6rYlUN4TXXvQbGG/D/VzaVnwpG8tSGhs8IMaDmw6hJhrVMs7QlXeuCGvNIDoh21YVnYqcXxiY5eAT+aMFfjonf29Qvoz4AtTDGb29etlJhn8OE6Rmz6SRd/iBWQuBmjK2i8UG2EkCaYivsbOQ+8fknIVPEkQvm5gpZXLvvRB7ZNUqD24VJHG9xAt2OVj9DT56Vfu/EWNbmCMd+Z7MCjwBbjQpThfdloG1UY6iGP6bKlMOKjygj6GqDy+afNpXIUBij+dFKsS86Ar9mrHiPGVMdaj/lxpzDEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OSmP81M1G/tQK2zlKe8S/PZ+nQ7mOsFlJT76GE8BE1U=;
 b=ShIt4FkRNmF6kvAFt951BUhtO2K4x5iOGD2vuiFjuS0S1RRs4fe1keBZXNg8ceEm62PuuOMMQ8ovbqCMpdlybPH1J+9h9V2ixx+KUCPEVuho4XHgt5gAQAYWaIcg8tv9WJbUsN4+787dwDQpNRkZuhvUjJrxhmf3PbiVKYPvcbPtC1ejc/hCuIIVLeMj/nEuXBdqFkIDiBtkMTOxdIrFVj4LzoBVbpvuKrguJAI6JJp3nplEgeKkPTpJ1JcU7KqnSm3ibOf+31xTyeD22dllM8jHcb4IfNqQKZNJB3f8mQ38S4Dwm752lFX7K1HE2sOC5AflDKN4jyAEDW0ErTtp2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OSmP81M1G/tQK2zlKe8S/PZ+nQ7mOsFlJT76GE8BE1U=;
 b=LVv+XlqkQF0bt34p7WrS2EjM8Fg4IlQkaj3SIWgCGjgS0u7qbkZP/V+rftxPl5uWTXPql5QYKlVfLjTx+hwa+cgRIZq0sPMB5SPgm6pywcI3n4SqMRJUqQw0ta56eVkJronFW+2AT8lc3nnZSgImZiabTD1rw63RsfgrB/WJUNI=
Received: from SJ0PR05CA0203.namprd05.prod.outlook.com (2603:10b6:a03:330::28)
 by SJ0PR12MB6760.namprd12.prod.outlook.com (2603:10b6:a03:44c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20; Fri, 15 Sep
 2023 14:16:00 +0000
Received: from CO1PEPF000042A8.namprd03.prod.outlook.com
 (2603:10b6:a03:330:cafe::3c) by SJ0PR05CA0203.outlook.office365.com
 (2603:10b6:a03:330::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.17 via Frontend
 Transport; Fri, 15 Sep 2023 14:16:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042A8.mail.protection.outlook.com (10.167.243.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.19 via Frontend Transport; Fri, 15 Sep 2023 14:15:59 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 15 Sep
 2023 09:15:57 -0500
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>,
	<mika.westerberg@linux.intel.com>, <mario.limonciello@amd.com>,
	<linux-usb@vger.kernel.org>
CC: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH v2 0/2] Handle RPM for xhci-pci
Date: Fri, 15 Sep 2023 19:45:28 +0530
Message-ID: <20230915141530.1974640-1-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A8:EE_|SJ0PR12MB6760:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e9732c9-ffbe-4899-43a0-08dbb5f6493f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JkbeBQ6tchsuNuO9TZp4hK36tHOCLHppu0nnL4DDiN8xp3kaCnbU/5axNCPlNpPYTFIGJHa5IS7W8Zgh3Vsw5+zDz7zvE8uqhcleIPvDsxSAM0rVwfDxp8UnXgjjBB5pee58DeY8yBYb6H3cF2LyRKLeXtuaAz/bXOFzjadc86g+dsHYMeNjZl7Tt1YFMSC1dRKpBF0DjnETQKQpnmnGDPvco/NtWT/67uSeTmhhJlEs3RRDXVEIrOrjLpZeGbjf4/Mra49pihWY1nuKANjF1oESi33Ejcd1B0dSOLen7HbJAc79prrtR5c2xgRcfCzH8ElDM1jI7/1kzriP7l6AopcjheRFHWZ3vQmd3NUN+IqLy1GcKgufjwrIVLV/8ikVB1IUEW/ixqowdi7F4Jj0aM30io0Fl87NXyHmcXw23NlcxAoqlno/AvQrfab3G0vZYqdK5qm+Bhe8v84nuozoyBVIbtDEakIm+6L9ZyAmUlN2XKpGDzwEBoIfIeJamz80nado8fQnby+4k02sJz8cXFQKHDu0f2JP6LQ4J40er+InEw++fV4muhQCvhf8T/7Y/VNljz2DwcK5Wy0X62qQYgSHte1rwqwOJOazI4Oi4LgmK06U0hblqjmTYbPzBPR6ROYPS8Y/zJZ9GDBtadubxcDz44lKBgTMxZWpuqT88/ExIAk4GHaHvmlZDVy/N22+eHaUozThzLWoj5nA11F1yZKEU50Y0rYpw+RYl1wHZHXY3MeEN9MiZxYSvoAFboIfUHbR1S7v6Oju5UwwdwwcC5aYnJ/BhcqH/Lv/SDjmCyc=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(376002)(396003)(39860400002)(1800799009)(451199024)(186009)(82310400011)(46966006)(36840700001)(40470700004)(356005)(81166007)(82740400003)(36756003)(86362001)(40460700003)(478600001)(6666004)(7696005)(4744005)(2906002)(4326008)(8676002)(110136005)(8936002)(41300700001)(5660300002)(40480700001)(83380400001)(47076005)(336012)(316002)(70586007)(36860700001)(70206006)(1076003)(426003)(2616005)(26005)(16526019)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2023 14:15:59.5866
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e9732c9-ffbe-4899-43a0-08dbb5f6493f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042A8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6760
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
	autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

This series includes fixes for PCI AMD USB controllers that use RPM as
their default policy, including enabling RPM for controllers that support
low-power states.

v1->v2:
*Enable RPM also for all AMD xHC 1.1

Basavaraj Natikar (2):
  xhci: Loosen RPM as default policy to cover for AMD xHC 1.1
  xhci: Enable RPM on controllers that support low-power states

 drivers/usb/host/xhci-pci.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

-- 
2.25.1


