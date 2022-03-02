Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DFB34CA215
	for <lists+linux-usb@lfdr.de>; Wed,  2 Mar 2022 11:23:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231748AbiCBKYT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Mar 2022 05:24:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240899AbiCBKYS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Mar 2022 05:24:18 -0500
X-Greylist: delayed 4704 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 02 Mar 2022 02:23:32 PST
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02hn2200.outbound.protection.partner.outlook.cn [139.219.17.200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7497AD101
        for <linux-usb@vger.kernel.org>; Wed,  2 Mar 2022 02:23:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nYlgzjEWBmMEM33yak/7kVRBESjPDNCRlG3Ndauq8bXWPHNaCA7l2MciYRi+CBfSViUyQnEL6JVJ/dFOCi20LeqQLtRgXEmYqszU4iyY3DXikSsY7ncwxq6lVnpPLeuREyRxXgAN2Cm3Qqc/XfJVbrqmu2Y639Cs/+ktvBKCkSbqqH6ko40mYNYkuXl9nsmNwguK9Cc30lBuneTqTe5Eop1CUdXM5A7+hE7GnPX2fXR1zwsoS9bHyhDreVVjeNNcNe4t/Q0512ShJcwYvgdjFSZj1W8AZoJU5070QzYLV23RDrFX5td4bW7kAKrMoM6G57UXfiviT4j04bFzCQn6AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5770vuUmeYO00QSXqAiD86/7RjYbpOtU3t9VV0XbSJ8=;
 b=Eez0QQ3q24JMhp6iMj4jKKMtkMbjzwoyrHCn5krcdSNl0bcQgfotMiH+GCmYCQrmP3gPk6HdpZxpPRqHThYEXBDGYn3zNwLYIAjXV938JiU/HhQ8jjWaeTjRzIVlzlL5/Eus7aYvESj/hjq0Q84hK4eEbKhL/+je7EnjPLqzkf0mpVaJ1J1CG3we7AJ9VPgdbyzw3fk5iGLQOeDNKRTnKBV/LIoEyqFcdku52SAhtQZ7LKIAaihQO4roQopmscniiGn+GANYbdXQMXwMRfkF/miUO5NxFxCbCVZpPHNhhAb3sF7r3vFC/hckRnkDmax8MRUrob/clluRVh5epRi/Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=pactera.com; dmarc=pass action=none header.from=pactera.com;
 dkim=pass header.d=pactera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pactera.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5770vuUmeYO00QSXqAiD86/7RjYbpOtU3t9VV0XbSJ8=;
 b=I3k1EvZgd+g8O+mUCWB+phmGtBxImo5IqXUMzgm1A5938kwHgjT0ZXDJ8Icd1te54uYBENVi+znAEKfrNaPanaqNLtgSZuzLQ8gl5vAuZMyPHlBcVVofM9byjYI8PDXjPbxFzRWPfq+1PdM25RZ/oIOii12Yu7ioP0rkXQHha3nPfoxokldh6uSq5dSaaVwvERsGs15GaJbUO66/XvevgzF0bQ/SwPjdNqeOTRDnxlvrsxVI4z3TuwzPqfcSQt2vBavvRWWNQ7YrPYwpdXtMvVBlkCBEY9QjsuE44Qps++f7mQJY9YR2kFNbEjdLN6adZzraLdIovLvnGZYvKse4Fw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=pactera.com;
Received: from BJXPR01MB0805.CHNPR01.prod.partner.outlook.cn (10.43.36.205) by
 BJXPR01MB0757.CHNPR01.prod.partner.outlook.cn (10.43.36.212) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.26; Wed, 2 Mar 2022 08:50:38 +0000
Received: from BJXPR01MB0805.CHNPR01.prod.partner.outlook.cn ([10.43.36.205])
 by BJXPR01MB0805.CHNPR01.prod.partner.outlook.cn ([10.43.36.205]) with mapi
 id 15.20.5017.027; Wed, 2 Mar 2022 08:50:36 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Spende
To:     me <sheng.chang@pactera.com>
From:   "clay" <sheng.chang@pactera.com>
Date:   Wed, 02 Mar 2022 08:48:12 +0000
Reply-To: claytousey@hotmail.com
X-ClientProxiedBy: BJXPR01CA0052.CHNPR01.prod.partner.outlook.cn (10.43.33.19)
 To BJXPR01MB0805.CHNPR01.prod.partner.outlook.cn (10.43.36.205)
Message-ID: <BJXPR01MB08057FC34AD0410A6AE344F4FF039@BJXPR01MB0805.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 52c50055-b35e-4fd7-89a7-08d9fc2975cf
X-MS-TrafficTypeDiagnostic: BJXPR01MB0757:EE_
X-Microsoft-Antispam-PRVS: <BJXPR01MB0757987DC7C547B52C959394FF039@BJXPR01MB0757.CHNPR01.prod.partner.outlook.cn>
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RmpTeFEzM1FaLzIraHh3bjN2dDNkakJYRDhNbmlEQXcyR2RmaFh5VGs4dnJY?=
 =?utf-8?B?WUxXM1FtMFIxMFFBNHpuWXh5dzA2Q2o0Y0xHOVlUS201bXVGUEhGaHJSTmdT?=
 =?utf-8?B?Q2R2elBQdWVIZmI0d3Zhd3hYMjlJYXNQcXhuVUdSaFFScFVQSTBaTy9ST1I5?=
 =?utf-8?B?Y0NXci90SlpVaUJHQzliVHUxckVtNTFrUml4bGtZZ2MwcENrYUxvUnNJcXdV?=
 =?utf-8?B?U3d1QW42K253aVZjY3E2bVpQQTVtVUdDbjJlQWRqUzczVVd1YWxHMHB6U3or?=
 =?utf-8?B?bnF0TnN3blBHRkpNcVpxQWZuTHp0ZUsxNkJvSXc3ZjR4bVM0WUhzVGM1aUxs?=
 =?utf-8?B?Q09jcWlsclZRalZvbU5yTGJvMmhjSnNEdmdFeVprcFBtcTZDOU02bWRiMGtu?=
 =?utf-8?B?dFZVZExpbSs2OHNPUnRqRnU0TlJpajFOZE52M3B0V0t0YnhDUWk3KzlOQkJh?=
 =?utf-8?B?ZFU3RlR6ZFVjQjlBbE53ZjAxTlJIU0F6am1xdFV2Y1ROQ2dCT1BOWkhOL3Yz?=
 =?utf-8?B?c3FpcEdaaWt4N3dPWGhBSDFGSDVaYTdiajN0SDZVRXl0aUduZEUyMVZXYzJZ?=
 =?utf-8?B?cGoycldUUDdxWjRBNVNjNEtndmpXbHRSK0YxZXRHWFVUL1FWNnRvM2dNWWR1?=
 =?utf-8?B?REFESzVnYm1NcUtRd2JqN1p5eWxjcE54aFRidG5VMUt6ejgxK0ZBR3FpaHR3?=
 =?utf-8?B?NjJFTXdiR0MwczZacTZWU2VnTHNMSmFZbjd6S0lLWi9HSDhvUmlkOHNRUTBk?=
 =?utf-8?B?c005SXpiZ2dXTjdRa0xqMUJ6blQwS2hsMmZFR05rREczTFZHYURnQ0dPQXVJ?=
 =?utf-8?B?bVIrSmErUDB3UnFYYy81VDM1N2w1a1ViaWkwWFBnTXRPcERMcFJ0ZXFyL1Zo?=
 =?utf-8?B?QmJSK0tud2hNcmZaeWhHbTFTL01iZVIrK2xpQ0QzRFJkRlM1VFZSUDdtbks1?=
 =?utf-8?B?eDVlb3RtYi9ZWlNOWERZeU80ckdwcS9TZmRzaTc4R3lJVkVQNEVPL1dobGdB?=
 =?utf-8?B?bldITEJhRm5zdjdlejZkTXUvT0FhYlhyV2o2NFlrbHNXY0lyeXRqbmJ4RGJ1?=
 =?utf-8?B?RGJsaDk5RG5vcktjQTNIaUl6RzNyU2hNK1c4M0EwV3pZRGgxMDJpQko5RGFX?=
 =?utf-8?B?WTdTQVllR0Rnc2F4RWNjbmg1Y2NjcFRRUzZ0TzFmZXpqWUwxOU9CRFlDMUdx?=
 =?utf-8?B?MHhLeU5ZTHQzSHhIcUt5dmtBWTQxZDNPb2V3ZXphUnI4dHBoSzY3L2N6cXlp?=
 =?utf-8?B?Y3NPSHdkRUFNWUxIREhxd1V1VENMVjlKbEhVeDVtaU5pRzF0V05vSVR4SU1S?=
 =?utf-8?B?UkxDYmVLRXp5bStPWDI2YXdGSDdLYkE1SHVrd0ltWllwUUFaSytVYzQ1cytx?=
 =?utf-8?Q?34dFwc5HTVMkfoHV8FcCefts0qldoEec=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:de;SCL:5;SRV:;IPV:NLI;SFV:SPM;H:BJXPR01MB0805.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:OSPM;SFS:(13230001)(366004)(186003)(8936002)(66476007)(558084003)(52116002)(2860700004)(508600001)(26005)(6666004)(7116003)(8676002)(6862004)(40180700001)(33656002)(66946007)(66556008)(2906002)(55016003)(7416002)(7366002)(5660300002)(7406005)(38350700002)(38100700002)(7696005)(9686003)(40160700002)(86362001)(6200100001)(3480700007)(18780700002);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0JpazBibjZTTUFiUGdJTTVhSHZUakhDUVpuTERjV1Z0My9DL3NWN25TT1lD?=
 =?utf-8?B?VDVXNmF1VEx1bEZJaEtQb0tQSGp3azBNcG1CN013aDM2ZUkyMGcyMStKbk4w?=
 =?utf-8?B?c1dLYmpqcytKSlRISVdZcjBLdHpTQUxEbHphczB0Y3ROd1pyaGo4d2Z3Tk9E?=
 =?utf-8?B?eXcrcVVPL2RnZHNzSzQ3ZWpoTUM3VWl3WUFxN0ZCOFAzRFFNdUk2ekdtOHBq?=
 =?utf-8?B?a1dmTWE4REh5RTREakE4MDZZZGpHZEJoV2lxeWtTKzNnTVZ3aU9sckNOYW5h?=
 =?utf-8?B?czQwUExqV0o4Tzhtd29xQktLNy8yVVdLZldYN2xEd01Kd2ZhQ0NCRnZLeUZq?=
 =?utf-8?B?SzRUWGlTQUt0SWVOUWZnenhDR1dldjBtSDNaMU1mL3dzUXRsbkw4ZytOTWt3?=
 =?utf-8?B?eU1FSnBkQWJLNUdKVmdGUmY0NzV4U3FVdUdxZkViVlRZN2VrR1F3V0V6b1VH?=
 =?utf-8?B?K1l0Y3hpbmRIS3lSYy9DM1FlOHNJTnZZSmRQbkcrUDZoWDlCRW9TYVpmMncr?=
 =?utf-8?B?QVpnWXhlWng3NTNKU1o0VTluSFZMUFl3R09Ra010QlNUeVRMdGMrZzEwbEZG?=
 =?utf-8?B?azE4Y3E2RTFKUjdhSVpvazdLeVR1bkxDdVJaODZsMVkrN0g3bkdKWUIwcVor?=
 =?utf-8?B?VFJNUFluNmt2dmpHQ2VRSU03YklLbEhSWnE5ZHlSSTRHK1dJZEdEV0YvR0Jp?=
 =?utf-8?B?ZmZPdWlkOHR3MHJMRENmOEswZG9vMlYxZzlTNUZvVjRFTlhXVHk3bkZnTDQ1?=
 =?utf-8?B?L0MvKyt4dGI2MUJtTlBQZko0aU5EL05HKzUwQ0ZldFI3N3dSM3BUQTFqSTJx?=
 =?utf-8?B?UkVZZ3hsWXREaG5SRk0xcVpxMWovc25mbFpRNlZzOTY5WFVySW4yTklMUE5u?=
 =?utf-8?B?b1hQeThLd3VrSnZZdTFlVTNja0oxY0dwOGhubW1RSjlhVkNFMTRxTnhyV0ZO?=
 =?utf-8?B?V3FsaUNVTlpZZ1pGTGVVQXJ4YzI5U3IrKzhZNjlnKytJKyt3UXR3cFc0NkVP?=
 =?utf-8?B?eDZuTUtZTTZWaWxScjZOV0JwUy96aXZiOWhqdUpFWjNUUmtSakxPdzU3ajBa?=
 =?utf-8?B?ZWJKK1gwRndqeW1nMFE5R0JUWGhZazU1bEdYMzBCN0puMmp5dU1iVlc5emxH?=
 =?utf-8?B?V24wbTlkVlVMREFDL1JzK3Y0SDJrcTBZblFtRWlsYmlPV1h4RVNPVmJDaGg2?=
 =?utf-8?B?WEx3a3BZOUNNbHM4cEllMytMWHV3MTM0Ym1taTc3amdkSUhab3o5ZUtxMUFx?=
 =?utf-8?B?ZDZpWHh4MzBUV3hodS9OZGtBd2pJbXFrNkRBYlRkbkc5SUlSaGx1V3FXeWR1?=
 =?utf-8?B?YzMvUVhLQWVTTFl5NnZubXgzOEFXQjJPekRGN2VpTG9lSk92MTRBNDM4WERz?=
 =?utf-8?B?alRUWjFhQUVpU29YVU9tVGFFZWkwVG5PbHRncEpzY2RRellVMTdZM2R2dUdi?=
 =?utf-8?B?aFBNTGFZL2dZMnBNelhOcXQyUElrSFBFU2g1UEpIY1dZNUZVZ0dDeXJ3ZGtk?=
 =?utf-8?B?Ynp4dDZUNXRJVmhPREV1TzBVV0swTHdhcGdBSDFlSisweWtlYmoyaEM0RVBL?=
 =?utf-8?B?Smp6Z2Z1ZEtMWVFsWjl3cWg3OFUxd3ZXZmd2bGJXUTI2L09YaDZvdzJGb0Js?=
 =?utf-8?B?TWtzQnJ6YTNybGtYd2o2RnZJdi9TbUNnbWVaN3Q1Zk5ld1k4RFM2ZThyTWVs?=
 =?utf-8?B?S2lhQ25SS2N5QzFUcVU1dm1UTzAxT2JiZUVDVkljeDZKMVNpRjBwZlRLOFVI?=
 =?utf-8?B?V1JlODJ5VHdKQzlCUVR2eUYvdXpNOHNSRkZydlJtSWdrbHY0aXEwUWg2TDFY?=
 =?utf-8?B?Q052akN3UVVWNWhGV3FiRE94dHRzVGhDNm5DV29nS1pDZGFVR2hCZWl1QmVY?=
 =?utf-8?B?R1FRZE1lUlpMbHBGVEl4cHNYajRqd2ZyUW9NVG9XaHF1NWd2aitTKzlzR1Rh?=
 =?utf-8?B?SVVWU2REeTJmSDIyZ2dOaFIwS2srZmVXdmJ6d2FTdmJqR0FJRjNTaGlnRnNY?=
 =?utf-8?B?YzY4cWtyVnBPTUZVOFBPK1VleVhqU0haaVh6L3FmT1hmYnpxMFk5eE8vR296?=
 =?utf-8?B?VCtGY1E1UWduOWhTbWFrOGdKWEhGM29IaFNYdz09?=
X-OriginatorOrg: pactera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52c50055-b35e-4fd7-89a7-08d9fc2975cf
X-MS-Exchange-CrossTenant-AuthSource: BJXPR01MB0805.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 08:48:45.1123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 89592e53-6f9d-4b93-82b1-9f8da689f1b4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +VDdyJGuoy3RkBKxzq7SvuPSkxwS5cqmQtrPL4c/85yoI91GPKDhhkEpMOhd5jvoyY/HaJT/7x3moriIe+jZzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJXPR01MB0757
X-Spam-Status: Yes, score=6.1 required=5.0 tests=BAYES_50,DKIM_INVALID,
        DKIM_SIGNED,FREEMAIL_FORGED_REPLYTO,NIXSPAM_IXHASH,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  3.0 NIXSPAM_IXHASH http://www.nixspam.org/
        * -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.1 DKIM_INVALID DKIM or DK signature exists, but is not valid
        *  2.1 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Sie haben eine Spende von 3.800.000,00 =E2=82=AC. von Clay Tousey antworten=
 Sie mit diesem Code [CT485342022], um die Spende zu erhalten
