Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79D306FBD23
	for <lists+linux-usb@lfdr.de>; Tue,  9 May 2023 04:29:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229650AbjEIC26 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 8 May 2023 22:28:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbjEIC25 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 8 May 2023 22:28:57 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2132.outbound.protection.outlook.com [40.107.113.132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 645E01A7
        for <linux-usb@vger.kernel.org>; Mon,  8 May 2023 19:28:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gZAA0PUFQecgk6LdFNo20+kY02Z8KYACsCSCb83REZu7LekaqFFbB//OR2rns1lCQpOSdtgmBFuEYa+EPbdTSwELCo8FR3EOTL0p6P4+5zJjAfv6IqRP+Ct47iPDv07kKEQZc+p12HWfNpGk3USR4KwNTsxezW8JqljpCdGL7+zEO3y6KkIO/W6pldDE9ZsI1KBaIyeSyRMdCuz9HY7hj5osfin5apsDn43chZUHxUidxW1+r1wnQaWE/wTSvLKOyd6AQGha483ZZBM8r7d3a8X7UrmBqQyUQ7cgozRC0xsotozN4HhowTDh3dLA4OLLCAcJHAIqA2rdkZgkPrz/5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kwtDRmHu5HJszpaks++pQ/TqmZAK2vivYKq5bA2xhuc=;
 b=c+PK1meD4LMEW3oo01CqP35Isi3Io333n3I80vY8bWjrdH78zoTpg0eH3PlgDscZ8Aq2BzFgklj1LoPsaIn/YHvkCmKNAhXZ0AqBEko4w29zBUyaGYFOOei8nHq+sPd/81qMiUBbzI9P3ZQf07j6fuLH5bTRAVsTXtDkma7Z3loalcPE0o8fHSx9NmXYf3L2aCRd8n/Atr1TihIVzcchTn62Flw6Mfa8gGdL7bsQ4kjIXiVXKaV9ay0xl9LeoyiUqYBc7ULTMvMkIkkp2Dn8tMVL6puzsUKCqEdg6yR/kEyNX2aQgbWNPIzRggyg+P5kejeCoWKJc61wNLSOxrU4qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=zenithal.me; dmarc=pass action=none header.from=zenithal.me;
 dkim=pass header.d=zenithal.me; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kwtDRmHu5HJszpaks++pQ/TqmZAK2vivYKq5bA2xhuc=;
 b=j5TMZfxz4OfjSPAJoSpcVVtzvLVhgFbZQXyM8jV/MvqYKu4PoqIkq1SRnoR0U81Wj4DMirbNWQg+6xlAcIM3EuxKLZ5o6EKYO3fx5LFsu7BiVND0gJXWZsJBnOgfrivj4ML6Fv1w7RaD/0/6s9UA7bpS3Zqf7nP/s9Y1XFLpErc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zenithal.me;
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:c0::6) by
 OS7P286MB3742.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:237::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.33; Tue, 9 May 2023 02:28:52 +0000
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::91e1:d460:5907:34d6]) by TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::91e1:d460:5907:34d6%3]) with mapi id 15.20.6363.033; Tue, 9 May 2023
 02:28:52 +0000
Date:   Tue, 9 May 2023 10:28:35 +0800
From:   Hongren Zheng <i@zenithal.me>
To:     Galen Guyer <galen@galenguyer.com>
Cc:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usbip: give a more helpful error message if vhdi_hcd
 isn't loaded
Message-ID: <ZFmv033l5ahyrlVc@Sun>
References: <20230508212120.435329-1-galen@galenguyer.com>
 <ZFmtO64UqItxjsSz@Sun>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZFmtO64UqItxjsSz@Sun>
X-Operating-System: Linux Sun 5.15.67
X-Mailer: Mutt 2.2.7 (2022-08-07)
X-ClientProxiedBy: BYAPR21CA0021.namprd21.prod.outlook.com
 (2603:10b6:a03:114::31) To TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:c0::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCP286MB1393:EE_|OS7P286MB3742:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a0895a4-3e66-40ed-5f46-08db503520ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 73PEyeW1L5E3Bg7GhzwcG+hGavRbvSxOrqW0rDwKuF4gHTgi4m8q74FHskGCKHXD2S1d+kfmIahkyaSbq9KdgbGRCwVbgW2OmqsZFc2mYdRkPMcaiGI0TBRV0wJHEK7vj48f31nDPXmSXIH4Ntg5N6ZDWYGLhX8CAaaLA28/nbCKYOL1U7U6jpwAMiganZEkr/MSJYCbAZg43XaT5mvmDVBWl9wn8b4ICGlMlYMAx6a1gigzGqWGmpiAoF/zkuyBNe8rab+RHi8TN8l2nPuNcIk9nJfoxXu/drqRHLrZjmyudWTDbqBszXPInVHa8UtvTMgpe9vvDvdIvVo4ZuhMGtytb+bRlIhhhKai2jw+6UXyxnq/+3kSFjDfJU+9kVSsL5EhdFqbmvy6dd9Egj2yo3dkslxFEAXKRIoO4/dulUrT3PxfxK6Xfx9zhEgwscT2HUevS34XSfsfs+U+4EdLGyVCpR6XRSm6O77nPh/bTRbKcYVqp6xuRYHw8OHq6xayMczhtfZdPYLnKbi4vRzxbEoH7x1Ip4zhZ7i92zflF23zRyQ8Nsg1dNI38AesLnZ6JXPhrPJ3tdyurE1+cvoZFXHELh4FmPfODhL6Q+Xii3A=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(7916004)(39830400003)(346002)(376002)(366004)(396003)(136003)(451199021)(8936002)(8676002)(2906002)(15650500001)(5660300002)(33716001)(41320700001)(38100700002)(478600001)(6666004)(6486002)(54906003)(83380400001)(186003)(6506007)(6512007)(86362001)(41300700001)(316002)(786003)(66946007)(6916009)(66556008)(66476007)(4326008)(9686003)(49092004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SqvXwWzjZskXQaoNQjpk/cam9nqgzIVcMu9i9k4OMV1CL5GrqWNlOFB224YF?=
 =?us-ascii?Q?msgNhjJBrvEgSnt1aqaktnm+awPbmQ0xXSjSZjOuzDKQdB3lQk4OiYQF/YPq?=
 =?us-ascii?Q?n6/qxcrtx5GPDNvVefeYXU27nospsG16DzjhchYmCV/UAwoL2l/ZqyFMpUas?=
 =?us-ascii?Q?5jS1fH2R7G5p2jHYsQC9/rZY3pUGUls7edHddrnZh5k54N13e0q+/cP+ka1w?=
 =?us-ascii?Q?i2BgnpN0ngt8w9psyzQceXp6NMn8HfCgsNXhhii7OuzStQqN6UZs/xHvkNYh?=
 =?us-ascii?Q?mY/vgPtmDt6fhqx7LXzcerHe+8rm3nfqIMffLkrzZAWrfqn+JhVHML905dqS?=
 =?us-ascii?Q?ahVC/SuqP+YAJ1Wo6dmlJm5dTWHz5Pb3mv3ByRzkX19S3gNtt0cMW6uTPfzL?=
 =?us-ascii?Q?LefkX3hA4mROOBxi9b5CwCfATBqiotxwhI4lLR6vcWhww6/Pb5y31YmAmf/A?=
 =?us-ascii?Q?beHohxnd95njHAGEYqOwC4SS16k0kJiy9a3B9GUnoEubcbdUaiWdHFzZhDfO?=
 =?us-ascii?Q?bWONlVgxS5OuH8ZNBiithtHvsoX96ZllCKBcMSW9cEs9njiuAs5kfB9B5aDL?=
 =?us-ascii?Q?KUVwhXXKpDsb4pDXtXmgxoVvVOEiuZkw2LjCIpgnGRVTIezssGI7lZFY4n5D?=
 =?us-ascii?Q?gPz3vpPSC3OcOBIdd4ZSJzNLQcUW4MRCIfggKYPhTcyBYkrIBOb9bdmddiat?=
 =?us-ascii?Q?Lzo89Ww6ZZOQJ+6uNrDLFEahJf8gEbXs5NddYXOJHLUlWlZekZp44AaPtvv+?=
 =?us-ascii?Q?5XttallH/7oNfx4CAjf/Aw7RLzOugnutCkDzpRHoj8esHTHeq2yOIKYGlyjj?=
 =?us-ascii?Q?RZlhdJUfQ9LI2iUbFq5LcAd/rNn7Jxpvqj8h6aHhzql5snAD6rNRTb+JKTbD?=
 =?us-ascii?Q?2oku4mxR9g/mS3AHzovnTk+mN++lqxMJyLdumwEXA2MZY5SWClMY/FmGyC74?=
 =?us-ascii?Q?KhzC/E+DSWfBjM0Vd126ZXblRupcum1o+HICwVKToHuWknzkNnsA5gtt7/4M?=
 =?us-ascii?Q?t74FgNtemtnW2HrC0opVHg41y5smjNnIl9dvX7t7/F8RR5w54enMY74KoLHD?=
 =?us-ascii?Q?k5oQwU3Z/YX3hbD2LN6+JvxOj2eXOTBprxWXfdfOVeaWXBSk9LsbOQnvcxD5?=
 =?us-ascii?Q?XB7rv2TEOF3c4IndjQPdLsw4gjLZRlwG9JBjj9Rz/6wbuoKRTac1SxOadXJw?=
 =?us-ascii?Q?0O/LOS29Fkf6JIHAXZWGydXxfHoZ/E+ZQYuGlWqP7GImSgbxm7QMw6IR9IIW?=
 =?us-ascii?Q?o2XVyFJXWr45/Mix2uqpnaDgy7k2Wcy1AYSwryVpbidgNeMmQR632HIK/MAt?=
 =?us-ascii?Q?8hghL3kIPE07uQgaP2EaM8SNdR/9lpuJnSNFJdcbfGrj1+Y0cgNiQrLOUKFz?=
 =?us-ascii?Q?eq7Vp7NYzenNXj7Ix5S4QGOIVSVdGOYyst1QK5FvIYe0HX/h2B31mEEUKjy8?=
 =?us-ascii?Q?bF39cnTTwP7LG0HSN94wo0aVYwNsBd/Ai3VI1I3t1l/HPjFJWarrlfe9F2qA?=
 =?us-ascii?Q?PUyLYNdCz3DsWeqABsGzIOmu98cfE/fiI5FD1K+86pxkcoo+4oBNrzxA6cU2?=
 =?us-ascii?Q?rUSbAeY/VG51u8dF34cMD5mlrGdzFLSoEkxsoUcZ?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a0895a4-3e66-40ed-5f46-08db503520ef
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 02:28:51.9944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mZVPGFTGPb4Ull4ikvujmIdXTQcObHmkIRh3Gy1Y+s/kQwmMFiL56dOTisSzQOpH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB3742
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, May 09, 2023 at 10:17:31AM +0800, Hongren Zheng wrote:
> On Mon, May 08, 2023 at 05:21:20PM -0400, Galen Guyer wrote:
> > Suggest loading vhdi_hcd if it's not loaded to make error message less opaque
> > 
> > Signed-off-by: Galen Guyer <galen@galenguyer.com>
> 
> Reviewed-By: Hongren Zheng <i@zenithal.me>
> 
> When I was young I usually get confused with this error message.
> 
> BTW would you like to make other patches regarding the error generated
> when kernel module not loaded? For example, when usbip-host is not
> loaded, the error message of usbip bind does not give much help.
> 
> $ usbip bind -b 1-6
> usbip: error: unable to bind device on 1-6
> 
> Another example is that when there is no gadget attached to
> the usbip-vudc, the following error messages are not helpful
> 
> $ usbipd -e -D
> libusbip: error: Cannot read vudc device descr file: No such device
> 
> $ usbip list -d
> usbip: error: problem getting device attributes: No such device
> 
> 
> > ---
> >  tools/usb/usbip/src/usbip_attach.c | 2 +-
> >  tools/usb/usbip/src/usbip_detach.c | 2 +-
> >  tools/usb/usbip/src/usbip_port.c   | 2 +-
> >  3 files changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/tools/usb/usbip/src/usbip_attach.c b/tools/usb/usbip/src/usbip_attach.c
> > index b4aeb9f1f493..531a415538f9 100644
> > --- a/tools/usb/usbip/src/usbip_attach.c
> > +++ b/tools/usb/usbip/src/usbip_attach.c
> > @@ -86,7 +86,7 @@ static int import_device(int sockfd, struct usbip_usb_device *udev)
> >  
> >  	rc = usbip_vhci_driver_open();
> >  	if (rc < 0) {
> > -		err("open vhci_driver");
> > +		err("open vhci_driver (is vhci_hcd loaded?)");

One more thing: the kernel module is called vhci-hcd.ko instead of
vhci_hcd. Though dmesg often shows vhci_hcd and this name is used
in the code.

> >  		goto err_out;
> >  	}
> >  
> > diff --git a/tools/usb/usbip/src/usbip_detach.c b/tools/usb/usbip/src/usbip_detach.c
> > index aec993159036..b29101986b5a 100644
> > --- a/tools/usb/usbip/src/usbip_detach.c
> > +++ b/tools/usb/usbip/src/usbip_detach.c
> > @@ -50,7 +50,7 @@ static int detach_port(char *port)
> >  
> >  	ret = usbip_vhci_driver_open();
> >  	if (ret < 0) {
> > -		err("open vhci_driver");
> > +		err("open vhci_driver (is vhci_hcd loaded?)");
> >  		return -1;
> >  	}
> >  
> > diff --git a/tools/usb/usbip/src/usbip_port.c b/tools/usb/usbip/src/usbip_port.c
> > index 4d14387df13d..21a20e378419 100644
> > --- a/tools/usb/usbip/src/usbip_port.c
> > +++ b/tools/usb/usbip/src/usbip_port.c
> > @@ -18,7 +18,7 @@ static int list_imported_devices(void)
> >  
> >  	ret = usbip_vhci_driver_open();
> >  	if (ret < 0) {
> > -		err("open vhci_driver");
> > +		err("open vhci_driver (is vhci_hcd loaded?)");
> >  		goto err_names_free;
> >  	}
> >  
> > -- 
> > 2.40.1
> > 
