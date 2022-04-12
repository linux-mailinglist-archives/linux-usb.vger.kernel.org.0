Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 384314FCB7D
	for <lists+linux-usb@lfdr.de>; Tue, 12 Apr 2022 03:03:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344531AbiDLBF2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Apr 2022 21:05:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351244AbiDLBBO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Apr 2022 21:01:14 -0400
X-Greylist: delayed 1084 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 11 Apr 2022 17:56:53 PDT
Received: from ns3.fnarfbargle.com (ns3.fnarfbargle.com [103.4.19.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE49425E8A
        for <linux-usb@vger.kernel.org>; Mon, 11 Apr 2022 17:56:53 -0700 (PDT)
Received: from [10.8.0.1] (helo=srv.home)
        by ns3.fnarfbargle.com with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <lists2009@fnarfbargle.com>)
        id 1ne4YE-0002Dz-Go; Tue, 12 Apr 2022 10:38:34 +1000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=fnarfbargle.com; s=mail; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=75zc1CLHBd74vMtirgEpPu7dForNVXaMUs389xOB3TU=; b=D+eIObny/lMzhDF42M+zs+Qa3r
        +1gZYN6y7UHoongUgNeKrGgnvtl6mXherfXjbdQz6Lgmfyt8ZTf4sB94SlXQVwSz/6vFLvfZhq6JC
        uOP03bxUPp2Z8P/x1FissDQiw6XiaS4qJCKiM0SLcSiXWr1i0X7yLOzAOH8DV1ioiT/s=;
Message-ID: <aec54314-6e6a-e295-610e-bbcae98eb709@fnarfbargle.com>
Date:   Tue, 12 Apr 2022 08:38:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 1/4] thunderbolt: Fix typo in comment
Content-Language: en-US
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>
References: <20220411130049.53656-1-mika.westerberg@linux.intel.com>
From:   Brad Campbell <lists2009@fnarfbargle.com>
In-Reply-To: <20220411130049.53656-1-mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 11/4/22 21:00, Mika Westerberg wrote:
> Should be 'in' instead of 'bin'. Fix it.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  drivers/thunderbolt/nhi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
> index 4a582183f675..6221ca4ea287 100644
> --- a/drivers/thunderbolt/nhi.c
> +++ b/drivers/thunderbolt/nhi.c
> @@ -1207,7 +1207,7 @@ static int nhi_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  
>  	nhi->pdev = pdev;
>  	nhi->ops = (const struct tb_nhi_ops *)id->driver_data;
> -	/* cannot fail - table is allocated bin pcim_iomap_regions */
> +	/* cannot fail - table is allocated in pcim_iomap_regions */
>  	nhi->iobase = pcim_iomap_table(pdev)[0];
>  	nhi->hop_count = ioread32(nhi->iobase + REG_HOP_COUNT) & 0x3ff;
>  	dev_dbg(&pdev->dev, "total paths: %d\n", nhi->hop_count);

You can add 

Tested-by: Brad Campbell <lists2009@fnarfbargle.com> 

to the whole series.

Regards,
Brad
