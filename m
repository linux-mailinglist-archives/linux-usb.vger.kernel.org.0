Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F27A34EEC3
	for <lists+linux-usb@lfdr.de>; Tue, 30 Mar 2021 19:01:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232589AbhC3RAz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Mar 2021 13:00:55 -0400
Received: from mail-eopbgr1310108.outbound.protection.outlook.com ([40.107.131.108]:6077
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232533AbhC3RAa (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 30 Mar 2021 13:00:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MF9p8TU1Z7Ql3GMmLVaRGZY0SGYAmbSUjyCBQ5wwYk27SIjO9jHMQiH0IwmXCbcOtuzKRswYfhhzN1mSsyut86rT47SihkSu5yNs8MbuQu4r3jgHlQJlKUaMXd9V/+7n1raC+pf/sssQbsHOi4DF0wasLhWbVybEfj3hnk56IQvAf0x4AnrBjbchfzD06XmxsIa51vN4RAquxIqw3x0/jSfMGqIUDnIK71oLt37X51+KCZBRRp1SmJgGnSp/vnHYRzNGbya+22LJK7X6NuwqwykWVK/lSMEfz5uu1H5CHX1fcCTQQwHJaXYqqkSSFqGePLrFm0/nBUptlB3AHh89QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LfPXS2ZutNFTSIDoty7bvELETG7Vlng899KH4en5k/o=;
 b=kgJ6aVd3QuoqXRPu7L3EXUSk42ZD57L7gYH4of+a+UAfotp0A9BPUbr3ag5cpk+uSQd/VIL00wDQcnNOLKf+VFCe2f2owq7ZzSVrMO/2ywFr6j+99a5PFKEyjIBWuRrhWyj/k2XlU8gb4nll273Clfqagu1Z68h/eoySR59inQqO+fiefWMcQ6WVy0A17O9mRAVEjxTY7k+KbepwoinJk/y1gayJP80A4hzbzuizMNWsszwTH6rIbfSG+aj0SkiFglmXDCLwEhiCrzo4aCr3GQ52fFRBbPxmUYcKyx/dFnskqebxe5Q57/ys6BgOE1jzSG+6YEWGp5fFrPQgzm/OOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=zenithal.me; dmarc=pass action=none header.from=zenithal.me;
 dkim=pass header.d=zenithal.me; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LfPXS2ZutNFTSIDoty7bvELETG7Vlng899KH4en5k/o=;
 b=QUJdM7xAwrYvvgIq5CivScunq2xcr/3rS49SVaCZ0epgmMGcZ0SN3eL6qcJQ1JRMGMbMRDovIe4iV25sGzdoh23oCFs8WjzoWxOcWCA8Rk2NW0lhrvMVtTDsDJYpemN7YUtWpmd7njAM+l3BIuNVUNw3hPwnbbNoDbgJI79/oM0=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=zenithal.me;
Received: from HK0PR03MB3795.apcprd03.prod.outlook.com (2603:1096:203:3c::10)
 by HK2PR03MB4387.apcprd03.prod.outlook.com (2603:1096:202:24::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.19; Tue, 30 Mar
 2021 17:00:22 +0000
Received: from HK0PR03MB3795.apcprd03.prod.outlook.com
 ([fe80::8492:e28e:e777:6d05]) by HK0PR03MB3795.apcprd03.prod.outlook.com
 ([fe80::8492:e28e:e777:6d05%6]) with mapi id 15.20.3977.025; Tue, 30 Mar 2021
 17:00:22 +0000
Date:   Wed, 31 Mar 2021 01:00:13 +0800
From:   "Hongren Zheng (Zenithal)" <i@zenithal.me>
To:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?iso-8859-1?Q?M=E1rton_N=E9meth?= <nm127@freemail.hu>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc:     Alexandre Demers <alexandre.f.demers@gmail.com>,
        linux-usb@vger.kernel.org, usbip-devel@lists.sourceforge.net,
        Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v6] docs: usbip: Fix major fields and descriptions in protocol
Message-ID: <YGNZHfmAbHO6fyAr@Sun>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YFAXGBSxaZJ8Dy3/@Sun>
X-Operating-System: Linux Sun 5.10.19-1-lts
X-Mailer: Mutt 2.0.6 (98f8cb83) (2021-03-06)
X-Originating-IP: [2402:f000:6:6009::11]
X-ClientProxiedBy: SJ0PR05CA0173.namprd05.prod.outlook.com
 (2603:10b6:a03:339::28) To HK0PR03MB3795.apcprd03.prod.outlook.com
 (2603:1096:203:3c::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (2402:f000:6:6009::11) by SJ0PR05CA0173.namprd05.prod.outlook.com (2603:10b6:a03:339::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.18 via Frontend Transport; Tue, 30 Mar 2021 17:00:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be54f082-df39-4fb2-c086-08d8f39d4e04
X-MS-TrafficTypeDiagnostic: HK2PR03MB4387:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <HK2PR03MB438707856EEE68D04E91D409BC7D9@HK2PR03MB4387.apcprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AculyM7HchdiFwkIlGrvtNTwqoWgCsBkyU5bv4rlClwaPCSHxVaPc5bHH0m0YEOviNJp9Mp6LSekyCAx5QzYLOjoFOSk0O+2hoGlFO1dm25Dh+fsYMaDDK7yjC2/tDAszvtXlcSgj/gzK+apUj33HiD4LduFEBqJodaznH0XeIE+82T9yZO1xubmqFUENBYvmis+8JsVy2NpLPdecAz3B1F5Gemaw6h2+4/LrUeUyTeJPaKqApI0c2aENbU/Japoj1q0ve7MSYfIKvjXtkJesR1v1+tX3zR+DhFlwLAa6kGM/IS4BgoUTxGybMs0LPxWzpV6w3HlQZ4t/4hm4bfHqb4B070EFNkQfy62uhYo0hXpdbyx0ZqfIdCKwOdyGNprVdhQjepK7yMYd6KNxqXpo3eTSohu9XSALhOYUbLtF5Ij+e+M6Miu7Vp71m9PwbBDK7dS51X7iYTr5w73PQwkS8qZZ0y3YKgXZ2YofInw0rMPVpWB3zypm89zU+Td6uaJSwftR3DWlls5XyRiHAH/2b6zJbKaRt1oBNV1E+mKsgiznMN0p8jJkptzIPeIoIRzHpw0+r6M/dQTvGFY8CFwCCzU3sX3mZyE9D3iZvjh9FhcMg82Xy2z2rYXifQyyvdLNsfYSc9bz4nlXa0VB52IGiFK6VojvYFB/E0Ds2cBFVqRbrWB5onFqQgq3DhiaaYEgqPL5lES2coyv20ANT1O7Tf2OSZcDXyk5symESqjLcsjzJAZ2k7KsLDVXomqKc4M
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK0PR03MB3795.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(366004)(39830400003)(346002)(376002)(136003)(396003)(66946007)(8936002)(4326008)(66556008)(66476007)(6486002)(5660300002)(478600001)(38100700001)(6666004)(2906002)(966005)(786003)(316002)(54906003)(7416002)(83380400001)(110136005)(33716001)(9686003)(6496006)(86362001)(30864003)(52116002)(16526019)(8676002)(186003)(49092004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?O12IcALizPGFj3S5UIdv8kIVqj2ZMIfsWcIvNSSP6F/IeKe2pXi8/N333o2H?=
 =?us-ascii?Q?Rt9DSNtok4Ez2ttOftyVcKK+O1Fzvb9KSfXMHivWYpU79TGa7wgzguXu3CqE?=
 =?us-ascii?Q?s3qnZP4e7BVR4E7A5Uegfv9SqqceuLYh5b7fTWM9FHCPRxY8erqb+nucO0U0?=
 =?us-ascii?Q?wVSQKnrfjP42DgEOX4Iv+Kw+1kCOiDXB+0zZXwxacjh0XBaE2jskpZmQbhMD?=
 =?us-ascii?Q?U9+VRiZOp4oY6/DsuFRnxvcCvgCxB6HIIuMkxeVH6eNFSrv3w1x9KOpoCyw8?=
 =?us-ascii?Q?ubFM0Bh3bsulbvuFo1S3yWkMTkbwpYx3uCmqCcnVJu7O5VuagMQw3RISsb1y?=
 =?us-ascii?Q?LNDKPrbBqAAgHIPp/vAkkU0VzB5lnHHaNTma5RBGjjF9MClu0FyYl/nYvaOT?=
 =?us-ascii?Q?hReZZqGmFrhpgdnS3pScvyCBZMJOYjDni9wk2J0xApG73dfVnnXa1T1ze+SS?=
 =?us-ascii?Q?kMydN/NtnuFsJ2U6PwMBb5u+2cJ0i4Wkf//czjG+bcjeEkioTt6TwSx+sfv+?=
 =?us-ascii?Q?78RnNXx4bBTKrAbMKyKHIJyVbWLv+rDE+aaRwCsGJXQ2+iUz+5m8/WFZGthn?=
 =?us-ascii?Q?SOkiVaPki2psw21fbFoicqm81ihSA7BotnrLzcLrrQ/a3NYBMRs/GFET/nAw?=
 =?us-ascii?Q?2wMQwoyTV0goWSFhZ3v/0qjLNG6T9itimiqUYhxIo0mqu3NBDp3si5qs5XBn?=
 =?us-ascii?Q?rQG/K5IvBh5NSXGhCrEl4lhNtdNcIfogB/8Cl7pyYgKJYiSE1Gt9p4JDK5zr?=
 =?us-ascii?Q?mOXG+HJJaRx49NvG+8arNeUu5i62CDUvK02imZGNDP1tPbbrUjiwZQKItEle?=
 =?us-ascii?Q?BM80PgWkH491xYVVujodn7/Ijmbgt3Ez0+G7CLa6+4plI606r5XZq52vv2NV?=
 =?us-ascii?Q?LD6Y7/dJhtRhlPw68DVacTq9xApEZkGm5C+tn39QxS34HU96ycxLHh9LTRdc?=
 =?us-ascii?Q?pV6It12DscbLlqVkp8fCOwTmCXnd57Wnj3m0UFU8fFLsXfVaUeJXWcCPHkPh?=
 =?us-ascii?Q?Q49nzSJo5bmqtilZ0mcCiDHGuR/W+zOHQodGkc6wN07GSeKwXooIh2WWuAIW?=
 =?us-ascii?Q?M+SU2bQIHpSTLz0Y7UQko+uuWtdsu7gASI04C+2OArfTI/3Qg8PxTTu1exEz?=
 =?us-ascii?Q?g4FDcQl2+s0aTOtAW5lC8D6cthpofdbomyuVbximk8c9FXVtq9NlvsINUXBI?=
 =?us-ascii?Q?QCXhC1KW+B8eedUaxEZi+Qjt5GNJYjL0wPs0T1OqOjrBmrM58IfprXA3WEoz?=
 =?us-ascii?Q?TzcVGsDtqZlz9VbO2c1CtYcpFZP2JlovDxZpHYR7rXmwNVTqNk1GG0L9hS/U?=
 =?us-ascii?Q?cFXu+JkSnTCK5z4uTIjxyINax5uaropXv4jQr2ZzTEBcrQ=3D=3D?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: be54f082-df39-4fb2-c086-08d8f39d4e04
X-MS-Exchange-CrossTenant-AuthSource: HK0PR03MB3795.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2021 17:00:22.6129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YCAPcPPk6xK8q2glux0XmNP4NPCGpO9VBtpzOo4+g4U6VQcCRgoTeKT+FVHJzrJI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR03MB4387
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The old document for usbip protocol is misleading and hard to read:
  * Some fields in header are incorrect
  * Explanation of some fields are unclear or even wrong
  * Padding of header (namely all headers have the same length) is
    not explicitly pointed out, which is crucial for stream protocol
    like TCP

Major changes:
  * Document the correct field as described in the codebase.
  * Document the padding in usbip headers. This is crucial for TCP
    stream hence these padding should be explicitly point out.
    In code these padding are implemented by a union of all headers.
  * Fix two FIXME related to usbip unlink and Document the behavior
    of unlink in different situation.
  * Clarify some field with more accurate explanation, like those
    fields associated with URB. Some constraints are extracted from
    code.
  * Delete specific transfer_flag doc in usbip as it should be
    documented by the URB doc in Documentation/driver-api/usb/URB.rst
  * Add data captured from wire as example

Version change:
    From "PRELIMINARY DRAFT, MAY CONTAIN MISTAKES, 28 Jun 2011"
    To "Version 1, 31 Mar 2021"

Co-developed-by: Alexandre Demers <alexandre.f.demers@gmail.com>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Hongren Zheng <i@zenithal.me>
---
 Documentation/usb/usbip_protocol.rst | 344 +++++++++++++++------------
 1 file changed, 193 insertions(+), 151 deletions(-)

PATCH v2:
Some changes suggested by a previous patch in
https://lore.kernel.org/linux-usb
/20180128071514.9107-1-alexandre.f.demers@gmail.com/
is adopted in this patch.
  * Fix Typo: duplicated 'the' in 'the following 4 field'
  * Fix incorrect field: in OP_REQ_DEVLIST, the second dev starts with
    field 'path', not 'busid'

PATCH v3:
Suggested by
https://lore.kernel.org/linux-doc/YE8Oan2BmSuKR4%2Fp@kroah.com/
  * Remove date and changelog in doc as these are tracked in git history
  * Remove 'mistake alert' as all data fields are documented properly
    now. However, docs on possible values for some field shall be added
    in the future

PATCH v4:
Suggested by https://lore.kernel.org/linux-doc
/40351ed6-2907-3966-e69a-a564173b3682@infradead.org/
  * Add punctuations for readability
  * Move patch changelog after the marker line
  * Remove nickname in signed-off-by line

PATCH v5:
  * Instead of co-developed-by, use reviewed-by
    for Randy Dunlap

PATCH v6:
  * Add reference to URB doc in changelog
  * Add version change in changelog
  * Add reference to URB doc for transfer_flag and other fields in
    USBIP_CMD_SUBMIT
  * Add reference to specific functions for UNLINK behavior
    and transfer_flag
  * Fix typo: "clients import", "connection to the server" and 
    "USBIP_RET_UNLINK" to "USBIP_RET_SUBMIT" in UNLINK behavior part
  * Separate the flow of UNLINK for clarity
  * Extract the version number in message headers to one separate
    section for ease of maintainence

diff --git a/Documentation/usb/usbip_protocol.rst b/Documentation/usb/usbip_protocol.rst
index 988c832166cd..0b8541fda4d8 100644
--- a/Documentation/usb/usbip_protocol.rst
+++ b/Documentation/usb/usbip_protocol.rst
@@ -2,15 +2,15 @@
 USB/IP protocol
 ===============
 
-PRELIMINARY DRAFT, MAY CONTAIN MISTAKES!
-28 Jun 2011
+Architecture
+============
 
 The USB/IP protocol follows a server/client architecture. The server exports the
-USB devices and the clients imports them. The device driver for the exported
+USB devices and the clients import them. The device driver for the exported
 USB device runs on the client machine.
 
 The client may ask for the list of the exported USB devices. To get the list the
-client opens a TCP/IP connection towards the server, and sends an OP_REQ_DEVLIST
+client opens a TCP/IP connection to the server, and sends an OP_REQ_DEVLIST
 packet on top of the TCP/IP connection (so the actual OP_REQ_DEVLIST may be sent
 in one or more pieces at the low level transport layer). The server sends back
 the OP_REP_DEVLIST packet which lists the exported USB devices. Finally the
@@ -30,7 +30,7 @@ TCP/IP connection is closed.
           |                                                 |
 
 Once the client knows the list of exported USB devices it may decide to use one
-of them. First the client opens a TCP/IP connection towards the server and
+of them. First the client opens a TCP/IP connection to the server and
 sends an OP_REQ_IMPORT packet. The server replies with OP_REP_IMPORT. If the
 import was successful the TCP/IP connection remains open and will be used
 to transfer the URB traffic between the client and the server. The client may
@@ -84,17 +84,61 @@ server may be USBIP_RET_SUBMIT and USBIP_RET_UNLINK respectively.
           | <---------------------------------------------- |
           |                        .                        |
           |                        :                        |
+
+For UNLINK, note that after a successful USBIP_RET_UNLINK, the unlinked URB
+submission would not have a corresponding USBIP_RET_SUBMIT (this is explained in
+function stub_recv_cmd_unlink of drivers/usb/usbip/stub_rx.c).
+
+::
+
+ virtual host controller                                 usb host
+      "client"                                           "server"
+  (imports USB devices)                             (exports USB devices)
+          |                                                 |
+          |            USBIP_CMD_SUBMIT(seqnum = p)         |
+          | ----------------------------------------------> |
           |                                                 |
           |               USBIP_CMD_UNLINK                  |
+          |         (seqnum = p+1, unlink_seqnum = p)       |
           | ----------------------------------------------> |
           |                                                 |
           |               USBIP_RET_UNLINK                  |
+          |        (seqnum = p+1, status = -ECONNRESET)     |
+          | <---------------------------------------------- |
+          |                                                 |
+          |         Note: No USBIP_RET_SUBMIT(seqnum = p)   |
+          | <--X---X---X---X---X---X---X---X---X---X---X--- |
+          |                        .                        |
+          |                        :                        |
+          |                                                 |
+          |            USBIP_CMD_SUBMIT(seqnum = q)         |
+          | ----------------------------------------------> |
+          |                                                 |
+          |            USBIP_RET_SUBMIT(seqnum = q)         |
+          | <---------------------------------------------- |
+          |                                                 |
+          |               USBIP_CMD_UNLINK                  |
+          |         (seqnum = q+1, unlink_seqnum = q)       |
+          | ----------------------------------------------> |
+          |                                                 |
+          |               USBIP_RET_UNLINK                  |
+          |           (seqnum = q+1, status = 0)            |
           | <---------------------------------------------- |
           |                                                 |
 
 The fields are in network (big endian) byte order meaning that the most significant
 byte (MSB) is stored at the lowest address.
 
+Protocol Version
+================
+
+The documented USBIP version is v1.1.1. The binary representation of this
+version in message headers is 0x0111.
+
+This is defined in tools/usb/usbip/configure.ac
+
+Message Format
+==============
 
 OP_REQ_DEVLIST:
 	Retrieve the list of exported USB devices.
@@ -102,7 +146,7 @@ OP_REQ_DEVLIST:
 +-----------+--------+------------+---------------------------------------------------+
 | Offset    | Length | Value      | Description                                       |
 +===========+========+============+===================================================+
-| 0         | 2      | 0x0100     | Binary-coded decimal USBIP version number: v1.0.0 |
+| 0         | 2      |            | USBIP version                                     |
 +-----------+--------+------------+---------------------------------------------------+
 | 2         | 2      | 0x8005     | Command code: Retrieve the list of exported USB   |
 |           |        |            | devices.                                          |
@@ -116,7 +160,7 @@ OP_REP_DEVLIST:
 +-----------+--------+------------+---------------------------------------------------+
 | Offset    | Length | Value      | Description                                       |
 +===========+========+============+===================================================+
-| 0         | 2      | 0x0100     | Binary-coded decimal USBIP version number: v1.0.0.|
+| 0         | 2      |            | USBIP version                                     |
 +-----------+--------+------------+---------------------------------------------------+
 | 2         | 2      | 0x0005     | Reply code: The list of exported USB devices.     |
 +-----------+--------+------------+---------------------------------------------------+
@@ -165,8 +209,8 @@ OP_REP_DEVLIST:
 | 0x143     | 1      |            | bNumInterfaces                                    |
 +-----------+--------+------------+---------------------------------------------------+
 | 0x144     |        | m_0        | From now on each interface is described, all      |
-|           |        |            | together bNumInterfaces times, with the           |
-|           |        |            | the following 4 fields:                           |
+|           |        |            | together bNumInterfaces times, with the following |
+|           |        |            | 4 fields:                                         |
 +-----------+--------+------------+---------------------------------------------------+
 |           | 1      |            | bInterfaceClass                                   |
 +-----------+--------+------------+---------------------------------------------------+
@@ -177,7 +221,7 @@ OP_REP_DEVLIST:
 | 0x147     | 1      |            | padding byte for alignment, shall be set to zero  |
 +-----------+--------+------------+---------------------------------------------------+
 | 0xC +     |        |            | The second exported USB device starts at i=1      |
-| i*0x138 + |        |            | with the busid field.                             |
+| i*0x138 + |        |            | with the path field.                              |
 | m_(i-1)*4 |        |            |                                                   |
 +-----------+--------+------------+---------------------------------------------------+
 
@@ -187,7 +231,7 @@ OP_REQ_IMPORT:
 +-----------+--------+------------+---------------------------------------------------+
 | Offset    | Length | Value      | Description                                       |
 +===========+========+============+===================================================+
-| 0         | 2      | 0x0100     | Binary-coded decimal USBIP version number: v1.0.0 |
+| 0         | 2      |            | USBIP version                                     |
 +-----------+--------+------------+---------------------------------------------------+
 | 2         | 2      | 0x8003     | Command code: import a remote USB device.         |
 +-----------+--------+------------+---------------------------------------------------+
@@ -206,7 +250,7 @@ OP_REP_IMPORT:
 +-----------+--------+------------+---------------------------------------------------+
 | Offset    | Length | Value      | Description                                       |
 +===========+========+============+===================================================+
-| 0         | 2      | 0x0100     | Binary-coded decimal USBIP version number: v1.0.0 |
+| 0         | 2      |            | USBIP version                                     |
 +-----------+--------+------------+---------------------------------------------------+
 | 2         | 2      | 0x0003     | Reply code: Reply to import.                      |
 +-----------+--------+------------+---------------------------------------------------+
@@ -254,158 +298,156 @@ OP_REP_IMPORT:
 | 0x13E     | 1      |            | bNumInterfaces                                    |
 +-----------+--------+------------+---------------------------------------------------+
 
-USBIP_CMD_SUBMIT:
-	Submit an URB
+The following four commands have a common basic header called
+'usbip_header_basic', and their headers, called 'usbip_header' (before
+transfer_buffer payload), have the same length, therefore paddings are needed.
 
-+-----------+--------+------------+---------------------------------------------------+
-| Offset    | Length | Value      | Description                                       |
-+===========+========+============+===================================================+
-| 0         | 4      | 0x00000001 | command: Submit an URB                            |
-+-----------+--------+------------+---------------------------------------------------+
-| 4         | 4      |            | seqnum: the sequence number of the URB to submit  |
-+-----------+--------+------------+---------------------------------------------------+
-| 8         | 4      |            | devid                                             |
-+-----------+--------+------------+---------------------------------------------------+
-| 0xC       | 4      |            | direction:                                        |
-|           |        |            |                                                   |
-|           |        |            |    - 0: USBIP_DIR_OUT                             |
-|           |        |            |    - 1: USBIP_DIR_IN                              |
-+-----------+--------+------------+---------------------------------------------------+
-| 0x10      | 4      |            | ep: endpoint number, possible values are: 0...15  |
-+-----------+--------+------------+---------------------------------------------------+
-| 0x14      | 4      |            | transfer_flags: possible values depend on the     |
-|           |        |            | URB transfer type, see below                      |
-+-----------+--------+------------+---------------------------------------------------+
-| 0x18      | 4      |            | transfer_buffer_length                            |
-+-----------+--------+------------+---------------------------------------------------+
-| 0x1C      | 4      |            | start_frame: specify the selected frame to        |
-|           |        |            | transmit an ISO frame, ignored if URB_ISO_ASAP    |
-|           |        |            | is specified at transfer_flags                    |
-+-----------+--------+------------+---------------------------------------------------+
-| 0x20      | 4      |            | number_of_packets: number of ISO packets          |
-+-----------+--------+------------+---------------------------------------------------+
-| 0x24      | 4      |            | interval: maximum time for the request on the     |
-|           |        |            | server-side host controller                       |
-+-----------+--------+------------+---------------------------------------------------+
-| 0x28      | 8      |            | setup: data bytes for USB setup, filled with      |
-|           |        |            | zeros if not used                                 |
-+-----------+--------+------------+---------------------------------------------------+
-| 0x30      |        |            | URB data. For ISO transfers the padding between   |
-|           |        |            | each ISO packets is not transmitted.              |
-+-----------+--------+------------+---------------------------------------------------+
+usbip_header_basic:
 
++-----------+--------+---------------------------------------------------+
+| Offset    | Length | Description                                       |
++===========+========+===================================================+
+| 0         | 4      | command                                           |
++-----------+--------+---------------------------------------------------+
+| 4         | 4      | seqnum: sequential number that identifies requests|
+|           |        | and corresponding responses;                      |
+|           |        | incremented per connection                        |
++-----------+--------+---------------------------------------------------+
+| 8         | 4      | devid: specifies a remote USB device uniquely     |
+|           |        | instead of busnum and devnum;                     |
+|           |        | for client (request), this value is               |
+|           |        | ((busnum << 16) | devnum);                        |
+|           |        | for server (response), this shall be set to 0     |
++-----------+--------+---------------------------------------------------+
+| 0xC       | 4      | direction:                                        |
+|           |        |                                                   |
+|           |        |    - 0: USBIP_DIR_OUT                             |
+|           |        |    - 1: USBIP_DIR_IN                              |
+|           |        |                                                   |
+|           |        | only used by client, for server this shall be 0   |
++-----------+--------+---------------------------------------------------+
+| 0x10      | 4      | ep: endpoint number                               |
+|           |        | only used by client, for server this shall be 0;  |
+|           |        | for UNLINK, this shall be 0                       |
++-----------+--------+---------------------------------------------------+
 
- +-------------------------+------------+---------+-----------+----------+-------------+
- | Allowed transfer_flags  | value      | control | interrupt | bulk     | isochronous |
- +=========================+============+=========+===========+==========+=============+
- | URB_SHORT_NOT_OK        | 0x00000001 | only in | only in   | only in  | no          |
- +-------------------------+------------+---------+-----------+----------+-------------+
- | URB_ISO_ASAP            | 0x00000002 | no      | no        | no       | yes         |
- +-------------------------+------------+---------+-----------+----------+-------------+
- | URB_NO_TRANSFER_DMA_MAP | 0x00000004 | yes     | yes       | yes      | yes         |
- +-------------------------+------------+---------+-----------+----------+-------------+
- | URB_ZERO_PACKET         | 0x00000040 | no      | no        | only out | no          |
- +-------------------------+------------+---------+-----------+----------+-------------+
- | URB_NO_INTERRUPT        | 0x00000080 | yes     | yes       | yes      | yes         |
- +-------------------------+------------+---------+-----------+----------+-------------+
- | URB_FREE_BUFFER         | 0x00000100 | yes     | yes       | yes      | yes         |
- +-------------------------+------------+---------+-----------+----------+-------------+
- | URB_DIR_MASK            | 0x00000200 | yes     | yes       | yes      | yes         |
- +-------------------------+------------+---------+-----------+----------+-------------+
+USBIP_CMD_SUBMIT:
+	Submit an URB
 
++-----------+--------+---------------------------------------------------+
+| Offset    | Length | Description                                       |
++===========+========+===================================================+
+| 0         | 20     | usbip_header_basic, 'command' shall be 0x00000001 |
++-----------+--------+---------------------------------------------------+
+| 0x14      | 4      | transfer_flags: possible values depend on the     |
+|           |        | URB transfer_flags (refer to URB doc in           |
+|           |        | Documentation/driver-api/usb/URB.rst)             |
+|           |        | but with URB_NO_TRANSFER_DMA_MAP masked. Refer to |
+|           |        | function usbip_pack_cmd_submit and function       |
+|           |        | tweak_transfer_flags in drivers/usb/usbip/        |
+|           |        | usbip_common.c. The following fields may also ref |
+|           |        | to function usbip_pack_cmd_submit and URB doc     |
++-----------+--------+---------------------------------------------------+
+| 0x18      | 4      | transfer_buffer_length:                           |
+|           |        | use URB transfer_buffer_length                    |
++-----------+--------+---------------------------------------------------+
+| 0x1C      | 4      | start_frame: use URB start_frame;                 |
+|           |        | initial frame for ISO transfer;                   |
+|           |        | shall be set to 0 if not ISO transfer             |
++-----------+--------+---------------------------------------------------+
+| 0x20      | 4      | number_of_packets: number of ISO packets;         |
+|           |        | shall be set to 0xffffffff if not ISO transfer    |
++-----------+--------+---------------------------------------------------+
+| 0x24      | 4      | interval: maximum time for the request on the     |
+|           |        | server-side host controller                       |
++-----------+--------+---------------------------------------------------+
+| 0x28      | 8      | setup: data bytes for USB setup, filled with      |
+|           |        | zeros if not used.                                |
++-----------+--------+---------------------------------------------------+
+| 0x30      | n      | transfer_buffer.                                  |
+|           |        | If direction is USBIP_DIR_OUT then n equals       |
+|           |        | transfer_buffer_length; otherwise n equals 0.     |
+|           |        | For ISO transfers the padding between each ISO    |
+|           |        | packets is not transmitted.                       |
++-----------+--------+---------------------------------------------------+
+| 0x30+n    | m      | iso_packet_descriptor                             |
++-----------+--------+---------------------------------------------------+
 
 USBIP_RET_SUBMIT:
 	Reply for submitting an URB
 
-+-----------+--------+------------+---------------------------------------------------+
-| Offset    | Length | Value      | Description                                       |
-+===========+========+============+===================================================+
-| 0         | 4      | 0x00000003 | command                                           |
-+-----------+--------+------------+---------------------------------------------------+
-| 4         | 4      |            | seqnum: URB sequence number                       |
-+-----------+--------+------------+---------------------------------------------------+
-| 8         | 4      |            | devid                                             |
-+-----------+--------+------------+---------------------------------------------------+
-| 0xC       | 4      |            | direction:                                        |
-|           |        |            |                                                   |
-|           |        |            |    - 0: USBIP_DIR_OUT                             |
-|           |        |            |    - 1: USBIP_DIR_IN                              |
-+-----------+--------+------------+---------------------------------------------------+
-| 0x10      | 4      |            | ep: endpoint number                               |
-+-----------+--------+------------+---------------------------------------------------+
-| 0x14      | 4      |            | status: zero for successful URB transaction,      |
-|           |        |            | otherwise some kind of error happened.            |
-+-----------+--------+------------+---------------------------------------------------+
-| 0x18      | 4      | n          | actual_length: number of URB data bytes           |
-+-----------+--------+------------+---------------------------------------------------+
-| 0x1C      | 4      |            | start_frame: for an ISO frame the actually        |
-|           |        |            | selected frame for transmit.                      |
-+-----------+--------+------------+---------------------------------------------------+
-| 0x20      | 4      |            | number_of_packets                                 |
-+-----------+--------+------------+---------------------------------------------------+
-| 0x24      | 4      |            | error_count                                       |
-+-----------+--------+------------+---------------------------------------------------+
-| 0x28      | 8      |            | setup: data bytes for USB setup, filled with      |
-|           |        |            | zeros if not used                                 |
-+-----------+--------+------------+---------------------------------------------------+
-| 0x30      | n      |            | URB data bytes. For ISO transfers the padding     |
-|           |        |            | between each ISO packets is not transmitted.      |
-+-----------+--------+------------+---------------------------------------------------+
++-----------+--------+---------------------------------------------------+
+| Offset    | Length | Description                                       |
++===========+========+===================================================+
+| 0         | 20     | usbip_header_basic, 'command' shall be 0x00000003 |
++-----------+--------+---------------------------------------------------+
+| 0x14      | 4      | status: zero for successful URB transaction,      |
+|           |        | otherwise some kind of error happened.            |
++-----------+--------+---------------------------------------------------+
+| 0x18      | 4      | actual_length: number of URB data bytes;          |
+|           |        | use URB actual_length                             |
++-----------+--------+---------------------------------------------------+
+| 0x1C      | 4      | start_frame: use URB start_frame;                 |
+|           |        | initial frame for ISO transfer;                   |
+|           |        | shall be set to 0 if not ISO transfer             |
++-----------+--------+---------------------------------------------------+
+| 0x20      | 4      | number_of_packets: number of ISO packets;         |
+|           |        | shall be set to 0xffffffff if not ISO transfer    |
++-----------+--------+---------------------------------------------------+
+| 0x24      | 4      | error_count                                       |
++-----------+--------+---------------------------------------------------+
+| 0x28      | 8      | padding, shall be set to 0                        |
++-----------+--------+---------------------------------------------------+
+| 0x30      | n      | transfer_buffer.                                  |
+|           |        | If direction is USBIP_DIR_IN then n equals        |
+|           |        | actual_length; otherwise n equals 0.              |
+|           |        | For ISO transfers the padding between each ISO    |
+|           |        | packets is not transmitted.                       |
++-----------+--------+---------------------------------------------------+
+| 0x30+n    | m      | iso_packet_descriptor                             |
++-----------+--------+---------------------------------------------------+
 
 USBIP_CMD_UNLINK:
 	Unlink an URB
 
-+-----------+--------+------------+---------------------------------------------------+
-| Offset    | Length | Value      | Description                                       |
-+===========+========+============+===================================================+
-| 0         | 4      | 0x00000002 | command: URB unlink command                       |
-+-----------+--------+------------+---------------------------------------------------+
-| 4         | 4      |            | seqnum: URB sequence number to unlink:            |
-|           |        |            |                                                   |
-|           |        |            | FIXME:                                            |
-|           |        |            |    is this so?                                    |
-+-----------+--------+------------+---------------------------------------------------+
-| 8         | 4      |            | devid                                             |
-+-----------+--------+------------+---------------------------------------------------+
-| 0xC       | 4      |            | direction:                                        |
-|           |        |            |                                                   |
-|           |        |            |    - 0: USBIP_DIR_OUT                             |
-|           |        |            |    - 1: USBIP_DIR_IN                              |
-+-----------+--------+------------+---------------------------------------------------+
-| 0x10      | 4      |            | ep: endpoint number: zero                         |
-+-----------+--------+------------+---------------------------------------------------+
-| 0x14      | 4      |            | seqnum: the URB sequence number given previously  |
-|           |        |            | at USBIP_CMD_SUBMIT.seqnum field                  |
-+-----------+--------+------------+---------------------------------------------------+
-| 0x30      | n      |            | URB data bytes. For ISO transfers the padding     |
-|           |        |            | between each ISO packets is not transmitted.      |
-+-----------+--------+------------+---------------------------------------------------+
++-----------+--------+---------------------------------------------------+
+| Offset    | Length | Description                                       |
++===========+========+===================================================+
+| 0         | 20     | usbip_header_basic, 'command' shall be 0x00000002 |
++-----------+--------+---------------------------------------------------+
+| 0x14      | 4      | unlink_seqnum, of the SUBMIT request to unlink    |
++-----------+--------+---------------------------------------------------+
+| 0x18      | 24     | padding, shall be set to 0                        |
++-----------+--------+---------------------------------------------------+
 
 USBIP_RET_UNLINK:
 	Reply for URB unlink
 
-+-----------+--------+------------+---------------------------------------------------+
-| Offset    | Length | Value      | Description                                       |
-+===========+========+============+===================================================+
-| 0         | 4      | 0x00000004 | command: reply for the URB unlink command         |
-+-----------+--------+------------+---------------------------------------------------+
-| 4         | 4      |            | seqnum: the unlinked URB sequence number          |
-+-----------+--------+------------+---------------------------------------------------+
-| 8         | 4      |            | devid                                             |
-+-----------+--------+------------+---------------------------------------------------+
-| 0xC       | 4      |            | direction:                                        |
-|           |        |            |                                                   |
-|           |        |            |    - 0: USBIP_DIR_OUT                             |
-|           |        |            |    - 1: USBIP_DIR_IN                              |
-+-----------+--------+------------+---------------------------------------------------+
-| 0x10      | 4      |            | ep: endpoint number                               |
-+-----------+--------+------------+---------------------------------------------------+
-| 0x14      | 4      |            | status: This is the value contained in the        |
-|           |        |            | urb->status in the URB completition handler.      |
-|           |        |            |                                                   |
-|           |        |            | FIXME:                                            |
-|           |        |            |      a better explanation needed.                 |
-+-----------+--------+------------+---------------------------------------------------+
-| 0x30      | n      |            | URB data bytes. For ISO transfers the padding     |
-|           |        |            | between each ISO packets is not transmitted.      |
-+-----------+--------+------------+---------------------------------------------------+
++-----------+--------+---------------------------------------------------+
+| Offset    | Length | Description                                       |
++===========+========+===================================================+
+| 0         | 20     | usbip_header_basic, 'command' shall be 0x00000004 |
++-----------+--------+---------------------------------------------------+
+| 0x14      | 4      | status: This is similar to the status of          |
+|           |        | USBIP_RET_SUBMIT (share the same memory offset).  |
+|           |        | When UNLINK is successful, status is -ECONNRESET; |
+|           |        | when USBIP_CMD_UNLINK is after USBIP_RET_SUBMIT   |
+|           |        | status is 0                                       |
++-----------+--------+---------------------------------------------------+
+| 0x18      | 24     | padding, shall be set to 0                        |
++-----------+--------+---------------------------------------------------+
+
+EXAMPLE
+=======
+
+  The following data is captured from wire with Human Interface Devices (HID)
+  payload
+
+::
+
+  CmdIntrIN:  00000001 00000d05 0001000f 00000001 00000001 00000200 00000040 ffffffff 00000000 00000004 00000000 00000000
+  CmdIntrOUT: 00000001 00000d06 0001000f 00000000 00000001 00000000 00000040 ffffffff 00000000 00000004 00000000 00000000
+              ffffffff860008a784ce5ae212376300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
+  RetIntrOut: 00000003 00000d06 00000000 00000000 00000000 00000000 00000040 ffffffff 00000000 00000000 00000000 00000000
+  RetIntrIn:  00000003 00000d05 00000000 00000000 00000000 00000000 00000040 ffffffff 00000000 00000000 00000000 00000000
+              ffffffff860011a784ce5ae2123763612891b1020100000400000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 
2.31.0

