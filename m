Return-Path: <linux-usb+bounces-30114-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B69B1C37891
	for <lists+linux-usb@lfdr.de>; Wed, 05 Nov 2025 20:48:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F4DA1A205A3
	for <lists+linux-usb@lfdr.de>; Wed,  5 Nov 2025 19:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BC9C343D89;
	Wed,  5 Nov 2025 19:47:38 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F56829B229
	for <linux-usb@vger.kernel.org>; Wed,  5 Nov 2025 19:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762372057; cv=none; b=epG86jG2TxZlXAjAGtJssmpy8BzzNBO1LPvP6TuiNQTSbBvbLPuYEZVJonalJwbGfdacIpfxR189INxoyz4bGmJkE1m9w/7MOmiPqCHUei0G1vqg5tA4VPulQvZjB/57DnomiUzU2wNTQODq1vHbc6dARid1IgubbE5TIH68gj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762372057; c=relaxed/simple;
	bh=SJQO4hIxsRCYiVDcoVyAbR8KyR2iixH5QaHzpc66s2c=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=DKIXA6at3oJz4TJWgOMbfwh44JVpiP+S8q34Q0zeNTKdMEDvxwwbmolLBpkEZgUV9yiPFuqylpBbRa7LCTW29FXLupM78Ms1weG9jmQtCoqdkTlLuo5ZBG0hTXFQgTaCMoZrKPQJselXltzM8y+ph8soIB7lfQWsoqIbDoIzGx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-940e4cf730aso37031939f.1
        for <linux-usb@vger.kernel.org>; Wed, 05 Nov 2025 11:47:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762372055; x=1762976855;
        h=cc:to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZREwB+uSgNfDdjL7IMLbs9MbKHhqaZxa3nTlkJ4e/1c=;
        b=QEKMMT2JIzJFM3lpRw1WTpifompDaWTd1LyCK3KleanfulHSXtRqkJn/EQYrC/XDB0
         bRuBr6+eOQmHHmQbEGDC5+1F6sU4gZjSn11VslqUP7Z88edj/1NfEfXUS2k3NeSuzlkQ
         cykLiXW2rV3udqOgTf1aRV9rLjXMyMYX/S4bvpND/cnEejMO0W/Q1ZImmGOqdMHT156/
         xIdj9MNfVrazFB1uJXNtHjPepmHgO0nLyrXjiROAMXE9O/t+thLkCToOp7iRQCm7v38W
         PnRpBH5rqPlGRoWkQAVz036Smwqs6JbjTkIg2qJrQJjm0adOabViFN4E5rIfC2d1OK9W
         Y+PQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoa2BU/ZD/0OAu2KV4Rc2zhGF+g6oMH4v4c83DLbooDwXE1aUXWdL80pPjZYAY0/pgMU4E4Uv9wmM=@vger.kernel.org
X-Gm-Message-State: AOJu0YynrwTINfRSVjr1pCOFso1JxgCZZEhgf572YYxKPmnxoXQEObsP
	JTLlzqW1bDWmPB4OOHi0Qfck3Euy9iNJfZk3x9d36t48Nen1T8+k9CR3TV7CNhVrXBEW3FMQjdN
	52cCngBakhTZBIFTBoHxkIK2q5l4wE+j7D+iLiKpklwx8yeEFlWWgPWJLmlg=
X-Google-Smtp-Source: AGHT+IFWg9xCIhWhh/UffqZFvsTK8HvYAuVYNf/CzDs8Ehals4ZHS8FEROYlIGAsw5au1Wi7rSGH35k4i0NI8t7PaS+LpbUS/zEQ
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1d84:b0:433:217a:a25c with SMTP id
 e9e14a558f8ab-433407ccc86mr59934055ab.28.1762372055487; Wed, 05 Nov 2025
 11:47:35 -0800 (PST)
Date: Wed, 05 Nov 2025 11:47:35 -0800
In-Reply-To: <20251105194705.2123-1-dharanitharan725@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <690ba9d7.050a0220.baf87.0063.GAE@google.com>
Subject: Re: [PATCH v2] usb: rtl8150: Initialize buffers to fix KMSAN
 uninit-value in rtl8150_open
From: syzbot <syzbot@syzkaller.appspotmail.com>
To: dharanitharan725@gmail.com
Cc: davem@davemloft.net, dharanitharan725@gmail.com, edumazet@google.com, 
	gregkh@linuxfoundation.org, kuba@kernel.org, linux-usb@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com
Content-Type: text/plain; charset="UTF-8"

> KMSAN reported an uninitialized value use in rtl8150_open().
> Initialize rx_skb->data and intr_buff before submitting URBs to
> ensure memory is in a defined state.
>
> Changes in v2:
>  - Fixed whitespace and indentation (checkpatch clean)
>  - Corrected syzbot tag
>
> Reported-by: syzbot+b4d5d8faea6996fd@syzkaller.appspotmail.com
> Signed-off-by: Dharanitharan R <dharanitharan725@gmail.com>
> ---
>  drivers/net/usb/rtl8150.c | 34 +++++++++++++++-------------------
>  1 file changed, 15 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/net/usb/rtl8150.c b/drivers/net/usb/rtl8150.c
> index f1a868f0032e..a7116d03c3d3 100644
> --- a/drivers/net/usb/rtl8150.c
> +++ b/drivers/net/usb/rtl8150.c
> @@ -735,33 +735,30 @@ static int rtl8150_open(struct net_device *netdev)
>  	rtl8150_t *dev = netdev_priv(netdev);
>  	int res;
>  
> -	if (dev->rx_skb == NULL)
> -		dev->rx_skb = pull_skb(dev);
> -	if (!dev->rx_skb)
> -		return -ENOMEM;
> -
>  	set_registers(dev, IDR, 6, netdev->dev_addr);
>  
>  	/* Fix: initialize memory before using it (KMSAN uninit-value) */
>  	memset(dev->rx_skb->data, 0, RTL8150_MTU);
>  	memset(dev->intr_buff, 0, INTBUFSIZE);
>  
> -	usb_fill_bulk_urb(dev->rx_urb, dev->udev, usb_rcvbulkpipe(dev->udev, 1),
> -		      dev->rx_skb->data, RTL8150_MTU, read_bulk_callback, dev);
> -	if ((res = usb_submit_urb(dev->rx_urb, GFP_KERNEL))) {
> -		if (res == -ENODEV)
> -			netif_device_detach(dev->netdev);
> +	usb_fill_bulk_urb(dev->rx_urb, dev->udev,
> +			  usb_rcvbulkpipe(dev->udev, 1),
> +			  dev->rx_skb->data, RTL8150_MTU,
> +			  read_bulk_callback, dev);
> +
> +	res = usb_submit_urb(dev->rx_urb, GFP_KERNEL);
> +	if (res) {
>  		dev_warn(&netdev->dev, "rx_urb submit failed: %d\n", res);
>  		return res;
>  	}
>  
> -	usb_fill_int_urb(dev->intr_urb, dev->udev, usb_rcvintpipe(dev->udev, 3),
> -		     dev->intr_buff, INTBUFSIZE, intr_callback,
> -		     dev, dev->intr_interval);
> -	if ((res = usb_submit_urb(dev->intr_urb, GFP_KERNEL))) {
> -		if (res == -ENODEV)
> -			netif_device_detach(dev->netdev);
> -		dev_warn(&netdev->dev, "intr_urb submit failed: %d\n", res);
> +	usb_fill_int_urb(dev->intr_urb, dev->udev,
> +			 usb_rcvintpipe(dev->udev, 3),
> +			 dev->intr_buff, INTBUFSIZE,
> +			 intr_callback, dev, dev->intr_interval);
> +
> +	res = usb_submit_urb(dev->intr_urb, GFP_KERNEL);
> +	if (res) {
>  		usb_kill_urb(dev->rx_urb);
>  		return res;
>  	}
> @@ -769,8 +766,7 @@ static int rtl8150_open(struct net_device *netdev)
>  	enable_net_traffic(dev);
>  	set_carrier(netdev);
>  	netif_start_queue(netdev);
> -
> -	return res;
> +	return 0;
>  }
>  
>  static int rtl8150_close(struct net_device *netdev)
> -- 
> 2.43.0
>

I see the command but can't find the corresponding bug.
The email is sent to  syzbot+HASH@syzkaller.appspotmail.com address
but the HASH does not correspond to any known bug.
Please double check the address.


