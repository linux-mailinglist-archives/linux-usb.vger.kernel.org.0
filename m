Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDF6828B365
	for <lists+linux-usb@lfdr.de>; Mon, 12 Oct 2020 13:08:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387717AbgJLLIB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Oct 2020 07:08:01 -0400
Received: from mail-eopbgr60060.outbound.protection.outlook.com ([40.107.6.60]:19590
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387594AbgJLLIB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 12 Oct 2020 07:08:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MoapdlFyQbVX1FY0mHcrkh8mUqyAF6xy9uuN+wLysH3gC9UW2f4PsaHNkfsTNL+ccdXPUitEq84w6cqbYnk3/vq5zbj0h0tuwhBhbGIn/m0uA3UeXoBb/8w7zuHiq7YrH1OSrcw3pTFojfUa+SIFNz2HK8CeG8C0A5QUpR7SNtjH/lbViaZm7YAABEeo27WjPcedhiMtgtjt60XRM9fhYo8PiKKjnqi6uAP3cOZhNIXSMWKyxkOpofK3H9KRaRRnF2X74+s6Sb0mWMOq2LLVI/P6bn8jo/pMnnK45gznbYJ1IT8+I72KsMfF74S0qy7oj0PPG8Me2K8RLlgqwLVgvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fiLguoSqEqbZWjd+DWDyd3ZyCD27U/1NIdVoUfLQGf4=;
 b=aptt0MaTLJKaLw+WGmQfSsQ8fDv42Syhj74+MkLn26H4/SZxlaIWv0rf/F0AByIGJQyXxxvFuqPPjIRZxXVaHzjLp9qF9H7E3Cy97L1aWJFLaK9I7bTSR1SxYn+tx3L/7hyLmBMF+Q3QRowi9I7j2l4MfVohQeBRF2hfF5X5rCIvP+Yk446XN0gVhK3CtAcm7y5RlxFMUxLr521LSQSN28/+Ec7xCaQKGw7Nz7jN9H4tW3yqm3JPnt3tpb6viBm5O8YyKigzgFwlK5lVngmunYee+I8OPbST0Obd7Afh/KDhDHMBymwbLWu+k3T+Ag0z+ISe9QC9HVcJ5wYQGt37zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fiLguoSqEqbZWjd+DWDyd3ZyCD27U/1NIdVoUfLQGf4=;
 b=phUc1GF8o4RF9YD3N3w9YNT3aSFDCS7w74qjS1GR9FoYI4AMhQ5WwxkdcmsnFWEjKUA1d0lGJg2Y2c5D9JFnzbxWSmO4Xwf1gtswWYL9nRgANDW9cr8wQMEXRgul6e4NSmGSc4rBNquRK9SyThqUxbj8QYKxFfgAkBLqrJIqib0=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR0402MB3519.eurprd04.prod.outlook.com (2603:10a6:803:8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23; Mon, 12 Oct
 2020 11:07:56 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::acd3:d354:3f34:3af7]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::acd3:d354:3f34:3af7%4]) with mapi id 15.20.3455.029; Mon, 12 Oct 2020
 11:07:56 +0000
From:   Li Jun <jun.li@nxp.com>
To:     linux@roeck-us.net, gregkh@linuxfoundation.org,
        heikki.krogerus@linux.intel.com
Cc:     cy_huang@richtek.com, u0084500@gmail.com, jun.li@nxp.com,
        linux-usb@vger.kernel.org
Subject: [PATCH] usb: typec: tcpm: reset hard_reset_count for any disconnect
Date:   Mon, 12 Oct 2020 19:03:12 +0800
Message-Id: <1602500592-3817-1-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2P153CA0009.APCP153.PROD.OUTLOOK.COM (2603:1096::19) To
 VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2P153CA0009.APCP153.PROD.OUTLOOK.COM (2603:1096::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3477.11 via Frontend Transport; Mon, 12 Oct 2020 11:07:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1cec51c7-70ce-4d4a-886c-08d86e9f126f
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3519:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB351945540F164AC7114A824189070@VI1PR0402MB3519.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F/crWwlhZz15bPB9oF2G7XI07Y4/cDV2SJXJkd5hxPWip8AZAWw1zLbUQAwVxHKTi0pKywz1cULDKWC/TMl663acpdY33MeCwUwDN4mihw7I0BlB8dwRyu6yuUD+7okkXs3k9+12HhH2OL5zhbrt+7+3UoxzKY3ppcRzQU+n1rOP/qxhOYGcGXWoeXpW5tKLbQfZ7AK4G+PCZFcumgutv+3EcZ6HWDMOuktcj/rNgqge80SsQO77Pt6+Qq42tmU6BFa1IdU3v1xu+aw8CV6wkxFxxHH/tJhNaHbMNkMd1siUzBkD3BnJVBosK4nz9una
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(39860400002)(366004)(136003)(376002)(8936002)(2616005)(956004)(6512007)(36756003)(6506007)(186003)(16526019)(52116002)(2906002)(478600001)(86362001)(6666004)(66556008)(66946007)(6486002)(5660300002)(316002)(8676002)(83380400001)(26005)(66476007)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: Se2H/vnXk0D/qn5uAb9YvJOgi5KFp/QoDNwAwI9o0AGgYYvIvJMIVuIhon+0upRjVAgc4de9rhecWvxMpOl+oz1aHKR7jKSxfs9KkQsdyAryy0zBI4Hq/SDrm2rL+v4BqVpgp+j2zowJ0XbIIz9ojnW3VvJnvvtpm4N3K8hSuAmVHdvOs2oluBeICFebkO73Go5QVVBeS4ZDskS7u0lLw5Xrqc+6QnNWQDmAYVfUSXk/laiAGTizixgr5CU0C1WGO6hoD+o5iYq1Hi0NYrXrHPnGOacSDSSu1o9A0Tz86rB8DatGHZu8CUG+efNbDYME0sYHwwuzfjnMjhTBMqwJvPmXBuH/HZZNovM97Tn4L4fzzmmbaOmbZNq/zUx3LBdB5t2DNLU2EizaGFflwgvf4RobdKkD737/2oS1ikjiBxPjfi28Ybe4wi95NK4P741spAjjzXn5F2URPIMyvTUDDn5QsTD3XIHBDJ4kYxkYUtm0L23DalonKDn0IleXuHQf/Ai/jrcB7zKBPCbC8CmPEOjduOrQHyhNQsYovBQzLIfGO7T0KUMxqXsNkWFPchdJ7aq60Pr+5/DZ5p2p+e1Hvgzyw7h05oR+kwq4JPJkobUtySGRzBHft+IXngyVxLye0ZdGaCdrnQQbHIm3vGnFBA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cec51c7-70ce-4d4a-886c-08d86e9f126f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2020 11:07:56.3618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AQMVV4vISjLR+8z6VzzBrCQdofNbE/AheCHk47D1NEqfTi80/7FdPFAtwvx65EEd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3519
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Current tcpm_detach() only reset hard_reset_count if port->attached
is true, this may cause this counter clear is missed if the CC
disconnect event is generated after tcpm_port_reset() is done
by other events, e.g. VBUS off comes first before CC disconect for
a power sink, in that case the first tcpm_detach() will only clear
port->attached flag but leave hard_reset_count there because
tcpm_port_is_disconnected() is still false, then later tcpm_detach()
by CC disconnect will directly return due to port->attached is cleared,
finally this will result tcpm will not try hard reset or error recovery
for later attach.

ChiYuan reported this issue on his platform with below tcpm trace:
After power sink session setup after hard reset 2 times, detach
from the power source and then attach:
[ 4848.046358] VBUS off
[ 4848.046384] state change SNK_READY -> SNK_UNATTACHED
[ 4848.050908] Setting voltage/current limit 0 mV 0 mA
[ 4848.050936] polarity 0
[ 4848.052593] Requesting mux state 0, usb-role 0, orientation 0
[ 4848.053222] Start toggling
[ 4848.086500] state change SNK_UNATTACHED -> TOGGLING
[ 4848.089983] CC1: 0 -> 0, CC2: 3 -> 3 [state TOGGLING, polarity 0, connected]
[ 4848.089993] state change TOGGLING -> SNK_ATTACH_WAIT
[ 4848.090031] pending state change SNK_ATTACH_WAIT -> SNK_DEBOUNCED @200 ms
[ 4848.141162] CC1: 0 -> 0, CC2: 3 -> 0 [state SNK_ATTACH_WAIT, polarity 0, disconnected]
[ 4848.141170] state change SNK_ATTACH_WAIT -> SNK_ATTACH_WAIT
[ 4848.141184] pending state change SNK_ATTACH_WAIT -> SNK_UNATTACHED @20 ms
[ 4848.163156] state change SNK_ATTACH_WAIT -> SNK_UNATTACHED [delayed 20 ms]
[ 4848.163162] Start toggling
[ 4848.216918] CC1: 0 -> 0, CC2: 0 -> 3 [state TOGGLING, polarity 0, connected]
[ 4848.216954] state change TOGGLING -> SNK_ATTACH_WAIT
[ 4848.217080] pending state change SNK_ATTACH_WAIT -> SNK_DEBOUNCED @200 ms
[ 4848.231771] CC1: 0 -> 0, CC2: 3 -> 0 [state SNK_ATTACH_WAIT, polarity 0, disconnected]
[ 4848.231800] state change SNK_ATTACH_WAIT -> SNK_ATTACH_WAIT
[ 4848.231857] pending state change SNK_ATTACH_WAIT -> SNK_UNATTACHED @20 ms
[ 4848.256022] state change SNK_ATTACH_WAIT -> SNK_UNATTACHED [delayed20 ms]
[ 4848.256049] Start toggling
[ 4848.871148] VBUS on
[ 4848.885324] CC1: 0 -> 0, CC2: 0 -> 3 [state TOGGLING, polarity 0, connected]
[ 4848.885372] state change TOGGLING -> SNK_ATTACH_WAIT
[ 4848.885548] pending state change SNK_ATTACH_WAIT -> SNK_DEBOUNCED @200 ms
[ 4849.088240] state change SNK_ATTACH_WAIT -> SNK_DEBOUNCED [delayed200 ms]
[ 4849.088284] state change SNK_DEBOUNCED -> SNK_ATTACHED
[ 4849.088291] polarity 1
[ 4849.088769] Requesting mux state 1, usb-role 2, orientation 2
[ 4849.088895] state change SNK_ATTACHED -> SNK_STARTUP
[ 4849.088907] state change SNK_STARTUP -> SNK_DISCOVERY
[ 4849.088915] Setting voltage/current limit 5000 mV 0 mA
[ 4849.088927] vbus=0 charge:=1
[ 4849.090505] state change SNK_DISCOVERY -> SNK_WAIT_CAPABILITIES
[ 4849.090828] pending state change SNK_WAIT_CAPABILITIES -> SNK_READY @240 ms
[ 4849.335878] state change SNK_WAIT_CAPABILITIES -> SNK_READY [delayed240 ms]

this patch fix this issue by clear hard_reset_count at any cases
of cc disconnect, í.e. don't check port->attached flag.

Cc: stable@vger.kernel.org
Fixes: 4b4e02c83167 ("typec: tcpm: Move out of staging")
Reported-and-tested-by: ChiYuan Huang <cy_huang@richtek.com>
Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 55535c4..a6fae1f 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -2890,6 +2890,9 @@ static void tcpm_reset_port(struct tcpm_port *port)
 
 static void tcpm_detach(struct tcpm_port *port)
 {
+	if (tcpm_port_is_disconnected(port))
+		port->hard_reset_count = 0;
+
 	if (!port->attached)
 		return;
 
@@ -2898,9 +2901,6 @@ static void tcpm_detach(struct tcpm_port *port)
 		port->tcpc->set_bist_data(port->tcpc, false);
 	}
 
-	if (tcpm_port_is_disconnected(port))
-		port->hard_reset_count = 0;
-
 	tcpm_reset_port(port);
 }
 
-- 
2.7.4

