Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B1FC78CBE3
	for <lists+linux-usb@lfdr.de>; Tue, 29 Aug 2023 20:15:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231368AbjH2SOa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Aug 2023 14:14:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233818AbjH2SOO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Aug 2023 14:14:14 -0400
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2068.outbound.protection.outlook.com [40.107.104.68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 550FDBE
        for <linux-usb@vger.kernel.org>; Tue, 29 Aug 2023 11:14:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kEcvd4QBRkGtQzLYJiO9X/rO7kdlCdu8seklpWEzP4AqkWCBlnW6qYR3V9tbCj3+H6BNA+WZnv6z5+nXUVLAajEijYm37CyC4Bmq/SmQZbhjUwNYFF7MdbTho8nDqmp5LP2FoDQpA4VQmT81JNnlN7xQmA0a8HjAhO2gzSYkxo0LPs4Mu2BtfuOrIbEyKIqFQCmZ5kQN0KEGKGIwRJ1GMoFFfgHPlhM5/mcWjKLOFvhvF78KKcx6Ya6Jpcd9lS617Fwsv66Xx7WbMquYON5+tfN5C1scnYM5VyuQf0zE1BOomJBoiho0AECNgK+RPjTu5RV2KJ7GZk7864tk3L4oYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zHJCDWn0pgoJIYiJUe9iM9mSFkNa9jb31Cz8ALnNi6w=;
 b=PvG0u96tcv3kOZq5qbCWxDcDFxfx/cUwsXBPFwl6yhMHGkmuSTMHYh9efY8XPQ8Swp1uu5VZYJ4yXZVoNBMxCSsOTolol1sIiHonBYiJhJTdTjwj+44APu7hw67RSZnVmVynAGfySrjBEg2NsC3BGsDxvZsyKPLY0SwnI+hLoD/cqPxnAtXsaA90tW+Fy+HLtbyQcnf6VFIrRJRxf7UqVssk4noBhG6Uo2IsI64Il3G4KXNkEVeAglKuo9I0GvEE0p1HolLj47dsR+4iTApDaoVLjdNeVrRkbwVbJjbhQx6HsyU28TjiFmLI33WHfe6Ir/IfKXl8oKqMuqmC1hzFtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zHJCDWn0pgoJIYiJUe9iM9mSFkNa9jb31Cz8ALnNi6w=;
 b=KjXI2uy0RydZuDP8hjU9nQUA6O3oC92A9poREmFsSpCHs3qF9Hmvj4Z8ZijVaqBiWYwDuOvtfVDL4OhFuFcmuMr+MfzJV+AwiQluo20qxRYkjSfQ8HhojoSzu6356I8xO6LShJSU9ar94P2rkWohSELKpQYvq1JMHBc8IiG3EKTDHLGv7SvnVDBoj9GHv7QRrLyT6E55ZLz31xQwUpbao82QhFceMIvSuditf+v/lw1zqxaUSdGpinGP2mnDvQIdrsWcEhnPKCnyHs6ChsJbo7+gqmyMrRxoaKxzaR7m7GUVAy9PFmFxxqnS1h1YnrRf7qtXTSfqWPhNxAIJAT8iDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by AS1PR04MB9581.eurprd04.prod.outlook.com (2603:10a6:20b:470::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Tue, 29 Aug
 2023 18:14:08 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::51fc:914:29f5:a420]) by VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::51fc:914:29f5:a420%6]) with mapi id 15.20.6699.027; Tue, 29 Aug 2023
 18:14:07 +0000
Message-ID: <eee774db-0cd1-5870-8909-b616d962791f@suse.com>
Date:   Tue, 29 Aug 2023 20:14:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
To:     Alan Stern <stern@rowland.harvard.edu>
Content-Language: en-US
Cc:     USB list <linux-usb@vger.kernel.org>
From:   Oliver Neukum <oneukum@suse.com>
Subject: alauda_check_media() doubts
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0086.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::14) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|AS1PR04MB9581:EE_
X-MS-Office365-Filtering-Correlation-Id: 62074489-afea-4efb-28c2-08dba8bbbc4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ysDj/08863GmO+8Lh9mrVSW+A9XF9iIcw2OkSahUsETYDS4BqqbkZY/N0VhYEVDS0LvnPczXXYUc9/WkXfLZRmlX1487wBsfN5hCxatzv8bwsZbC4IepOBpq9gURemfznFpaXyUtBVPkl/PaCTNYJz1x8mchobiQYxA9UbiCxGcBEGZ6Ek8Z7LbG01ErK/zrqMozAteQFK4wH8/kc0KvFIPeiYyQbFIJ05KhGwbKSlF2wLqad6/40gVhn++wJnMoepOialeztuZ+c5kQNrSri5+sxfISjEolOKCvnFH/aIQLxSXTEL9Cy+iQR9U/Cyik0PvbJkCRaY3XyTjT7LdbKGxRJ/c/E96t+NBn3oZTsLQCFfmoUimBzuSMbp6i4/WsukTZK4HTFWfC51IZ8QEloqOvl82/HSPy9+3TApnbZOGoDkOl1t3ckJRF0LCmvCR2rHS0aaDdH5+qkLfmMmMexrA8o4+s8RBK1eq7lR3m4Pvlkvu/TMaO8rC4DitFAjbX1p0GKDUKOHmjwDUV/j5Y+7GX9A7WGUEV7y9qJaCyufYveJlc6WlIfMsl1JbPnKjFsUUn9pGvhs4Hq8k7CrNHgm+xzgW1fNMWxCHhL9iWy/GxJB1Fc8W73siA6s3VP0CFQ7y0mLquVfl80jmHbwtyGg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(366004)(136003)(376002)(39860400002)(1800799009)(186009)(451199024)(8936002)(66946007)(31686004)(478600001)(6506007)(66556008)(66476007)(6486002)(316002)(38100700002)(41300700001)(6512007)(36756003)(8676002)(5660300002)(31696002)(558084003)(2906002)(6916009)(2616005)(86362001)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWNLckhoa3d4VEVTZXdWUXNPTnNsZXIvYkRLR1p2S0FLWWdGaE12K05oc0o0?=
 =?utf-8?B?bDdBbmFOd3JWekhoeHc4dlhPTmVBbFovTkFUQmNGbzVTRHloRm5pWFlpWFo3?=
 =?utf-8?B?dlAvdWJ2K0FsK1ZteFR2VFNFYWpKTDcrQ1g1MFNHVCtiK0liQ2VNclREdzJP?=
 =?utf-8?B?MitFbWV3L09ITFUzaFU5ZFF4VDdjK2Fmem9BU0VkUDFLbm1ST0pES1hYc2tp?=
 =?utf-8?B?dWZzM0tzUWVLY3M2RWI1YWxLcld2TVhVdGIwUURWVnkycmlnTEx0MUJoOXl3?=
 =?utf-8?B?enNMbExmc1JGdm85VTByUkZoN3owaUxFVENzV3hPZzZVbWlEQlZZSExKL0lM?=
 =?utf-8?B?V2NPdDBJOVl1Qmp3ckFOU2NDdWVyOU5DK08vN1hoYUxKOVo4L1BwZ3dhVVBr?=
 =?utf-8?B?TnR1YUxneUR4RTZMYlY1MUV2WllCTXNrU0NKSXllZkpLRzJWeEVCbDU2YjZE?=
 =?utf-8?B?UDNMZ0NHVDROa0cwL04zY0xlZ3UrQjY2U1p6L05uNlhNNytxSDg4L29kQVox?=
 =?utf-8?B?QXpNVTFuRjJUWnozbk4zWXRJR21BZk1pMXFKUDlLNEhzYXpSRG1BWHdTQVJI?=
 =?utf-8?B?YklGNFd0ZkdycktqZCtucnRSNVdONFFtYktoMGN2QTJ4Tmo3d1ZkcCtwczB5?=
 =?utf-8?B?TWQ2OGtDNk5MRUw5S2dydmV6c2R0ZDRrTGtWeXBvRW16dG83Z2hNMVhvSngr?=
 =?utf-8?B?THVrT1hCZXBwWFpCSXdjUUMzd1V5WTdEVWRTbU1qNjNaVFRMRmFyRCtBcm55?=
 =?utf-8?B?TGRQbWFrTy9KV1EzZnc0dmNNbUxwcmF2bnh1YlRsWUFXaHdpQjFhZHR4TWFH?=
 =?utf-8?B?K2ZZMEtYUERGQ1JkVFExNmdoZHNBWC9iUjNzM1N0UWY1ZlN4WGIzbkczMzZU?=
 =?utf-8?B?R0VLc1BNWkxuZ0NzS0Q1MUtMVWJZYjBWMEEvVFROTDZWczZlakYyRkRRcE11?=
 =?utf-8?B?LzU0ZFF3alVYNldQYkgrMlZDa243ZkVqeHk4eE1PNVFtZjhOZG41MjVUbFIy?=
 =?utf-8?B?V0YyVnVxT2lKeDdvTVdKbGpMbVN2MmNnSHZLYnBSb0hrVlhHN09RKzdKaFZP?=
 =?utf-8?B?MXpCcDVOWlVkVm5XVmF0UW1EYTF6L21YTXk2SVZneSs2R0FVTkJLbzZrVENl?=
 =?utf-8?B?TzRKY0RRNjk5eDRxV0dXQTltc2dmNnd5Vi9KY3daM0VUMkNHZTVsRjFKMktT?=
 =?utf-8?B?bGZoVUxJQk9TREs3d3ExR1hHRmcyLzlObHhjUkI2MmNnMXBScy94cGtPbXhs?=
 =?utf-8?B?VFIyWVlYV0NuRittdld4SXFGbjFVdWQxKzM3MGNsN2R3RkJyOUNEYlJNK2ty?=
 =?utf-8?B?L0NETThIWmNjWUpaR05DeHhNK21vbHE0Vm9ZSlM1eVlmUlVzM2ZoV2RIa3pB?=
 =?utf-8?B?Y1F5MXp6SXhzZGd3V0tybjFxcml2SndXbEJMeXJUbm5CZ1dvSTFjTXFncnlL?=
 =?utf-8?B?ekZJZS9xNzdtd1NyUGduWkJuWGQrQnMxVjk2ZHNFcVc1cE5UNktielpNYitq?=
 =?utf-8?B?V05Bb055WDVDek9RSVlqTzExaktBenNwOWwxWmt4SnQyMzU3azRVZHBBUm9j?=
 =?utf-8?B?eHF3R1c2c01IeWdUUGUwaU10V243eEE5cnhVRTVoUW5KUjZjV1M3OG5YZjJs?=
 =?utf-8?B?OTNyTXlGK3VYL3BhLy9EMWRoVmxzaXliY3BNYWl5SVRQdUROZ3ZaNE9MRzFz?=
 =?utf-8?B?Y3cwSnIwZGc1YXE3RXA0emt5V2FHN3NrWnlvRlhTZm5OamozUG44QnNtOXR0?=
 =?utf-8?B?OWRxQ1dwMmd3TFA5Z1RPcG9veWhFZjd0WFplOU9EUWFtTHRyQTJ3UjRmSGI1?=
 =?utf-8?B?ZGlXck8yN3JmbC9DZmU4cmVCTGlmTkZ3dU5kb2ZUb2V3d1hTSEFJc2F4OTdz?=
 =?utf-8?B?QzBSTlVjSGh3MllQclRuQTRxRk8vV1IxQnA0M3V3bHJUNXVXWjFMbk1MTXl6?=
 =?utf-8?B?NDhORFFtVE54M1F6S2RuT3FHeUdSTFJ6eUJ2Q0xMb09FMFRuUzgxNmNkTDRB?=
 =?utf-8?B?dGZoay9KYk9zSkFPRmk4aCtvVWREd3dXS2ZpWHN6WW9zMHhaNmZrbUM4R1Z4?=
 =?utf-8?B?clcyaktHeTFGTk9pNFQ5eWdPT0J4QVFEVjZENWdSa3dyUVZ0WU52RDdqVENL?=
 =?utf-8?B?L2d4eC9pMS9iY1AyQ1F2R05iUDQ0QVk4UHNnanR4bFB4WmdqZEg0K3kzUENj?=
 =?utf-8?Q?ZIjt/w6WecIfyESwM/cNNe+Cnsme7Kn3GeMsA/945HGG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62074489-afea-4efb-28c2-08dba8bbbc4a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 18:14:07.6502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aJtDCH16mD3thQRb1yPhnAmhYT2n0LSOUJvEu86o4iZXqJegGLHbkhfsx2zpQc3OHNBKTlswali3H/gIehSpmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9581
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Alan,

as you did something on this driver, doesn't
this condition:

(status[0] & 0x80) ||
                 ((status[0] & 0x1F) == 0x10) || ((status[1] & 0x01) == 0)

look odd to you? Especially the parentheses?

	Regards
		Oliver
