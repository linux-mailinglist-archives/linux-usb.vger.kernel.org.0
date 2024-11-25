Return-Path: <linux-usb+bounces-17838-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0B89D88BA
	for <lists+linux-usb@lfdr.de>; Mon, 25 Nov 2024 16:05:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF00B2864C3
	for <lists+linux-usb@lfdr.de>; Mon, 25 Nov 2024 15:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 355A11B3940;
	Mon, 25 Nov 2024 15:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="V3A2MUbJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32591B392E
	for <linux-usb@vger.kernel.org>; Mon, 25 Nov 2024 15:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732547138; cv=none; b=QCYdtxQWP22FIGZBHvRhcKhOGZx590l0zlMHMGG8uAg93j4rBrn+Oq2O5P+Nb5QLrJESMB3ybksJXhBLnYvcQXid02+7I7bJgoGRhUOLSWTLG507jh2SXjZQIbsXHfb430zKplsttW88YTN8rVuabV5LE+FljmVFzGZLBGMJhMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732547138; c=relaxed/simple;
	bh=Bi+CayR3aJOX+1KChTDriMlvBJ7UwoRJcYh84Q6MLGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PL5BK0P1jd1aXPCqFtKoC1MZhe3fz/s4UUcMyKqGsYpNuEdZg8/qLe/C2pmrQCw7nb+3rmcnYS90rlKM5EoBzcRWUJoOJ0ljWVxI3aYszifGKSQecUb9KumAc94cBq/Q1tQ5TrV1WaWP0RFJXVApl2ca68/n1jFk3RLVWNd8vXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=V3A2MUbJ; arc=none smtp.client-ip=209.85.222.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f195.google.com with SMTP id af79cd13be357-7b66402d0b0so92359185a.0
        for <linux-usb@vger.kernel.org>; Mon, 25 Nov 2024 07:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1732547135; x=1733151935; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eIcIEwreB6jMpQBW0713qszSdgFb5KeefQ1lDCrxAUU=;
        b=V3A2MUbJhu4dIadfpLtfmXCjXbm7od1xsQfu/RFf3Qb4yTudu5JKMcEa3motBpj7p7
         IDPJUqXkR7vyArltdrWHQHwbPejvawqX6e1rM926z12M7T8t73wDU57cvxxWzVANp5tQ
         XJQK5bgKi8URI7N39+va3KFQwGKg9oNvfchRuIrbFxh33JRlxk3Lw/4TbLW+PrR2jIYX
         NJxbubAE+SZoWYkqLcMXP3RFBtbN9Nfkhl7X2juGc170xOEzWORLknXm2sgq7l7Wgq+o
         eDG2Qh/cSBVsLjW6RSKf1VA0NoPtyhMSollJxP+RuWkq3NBMhdNvOg1muTt0Cx2jKdHZ
         pScw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732547135; x=1733151935;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eIcIEwreB6jMpQBW0713qszSdgFb5KeefQ1lDCrxAUU=;
        b=HqFqxOJKvGgFf4+ooJiLiPsuA8QgTlZMvs3uBkdWevLr6LgA+xiTDnKglSQ+80EnkI
         NthOqsyOzM670La1D8A+P3HGFnqUkzd+s7DlfwUo3M8iNWljps5eUykA6Ecy4IAkHZR1
         WqIxI0oSgj3BFuzBM6rg9DMU78+a6QbvqLb3knnHepGTxsraUAF722Gg5A0WnybR55+W
         DvLXmeFuX0mUp4yxcLRIo2Q6qB6jk2mDhkrgogxYFWlLmsA50xDcSJokr+uSc9KXx1RR
         naWWslPkICc/6sgiC5jAL9JuwlwZlTTGNwdPWk32Ee6qORwCHucu9+x4pa2uUvgf/iGM
         /6hA==
X-Forwarded-Encrypted: i=1; AJvYcCVkXQdzGl1eXaq8uRoPXUZri8nmpjnT8Uk8UTXoznk/6QEp3Bjs5CEbhggz8fXa3nm46sBlo1434Zk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrlHHYZOjFDlRSpegZg0yM1qY99UtUv9kXrMKN32bt9bNiPrpf
	r23JtyFlNQIIkZzZh42I7KNiMuWv7rKKEpHGwT696usedvOZSAMZOFwQaIoPwA==
X-Gm-Gg: ASbGnctGmJw2EBdiormlv9pXoFjr+xzR/EpRAydxfKuRnBjgk8BNtAPmYthonpzglgP
	RhbrIPCnoAaf22ylABFauPcb1WKuI8KBi6hMy5XjCRK2Ro8baYr7HM+h3rumxgaTjXSyjrCyEXd
	pC+8SQFFejPrcWP95XY8OCwK/pKL9rp2M6XrkCdLUxUZ07LoqFclGlGNvhdczG0smS+sSojm69J
	hi6e3CF4Zfbq9AEjrcFIlhd1AYtWTwKfaPm+GTxy7+d7QwqBf7fPFf6YI4PG1r3wa2X
X-Google-Smtp-Source: AGHT+IFQ3vwhNmqC/XSxFE5yYBxxFkA9WmddQ3gcy06Prn5QNk/WjE6EahTflZu7yCfbcojXZD+Rig==
X-Received: by 2002:a05:6214:21a9:b0:6d4:22e9:b8b6 with SMTP id 6a1803df08f44-6d4514b68dbmr185354926d6.41.1732547135280;
        Mon, 25 Nov 2024 07:05:35 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d451ab532bsm43616236d6.69.2024.11.25.07.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 07:05:34 -0800 (PST)
Date: Mon, 25 Nov 2024 10:05:33 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Dingyan Li <18500469033@163.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, usb-storage@lists.one-eyed-alien.net
Subject: Re: [PATCH v1] usb: storage: add a macro for the upper limit of max
 LUN
Message-ID: <30019a70-d496-41d5-9159-c991ac93f326@rowland.harvard.edu>
References: <20241030083858.46907-1-18500469033@163.com>
 <56abaf44.86c3.19362571bee.Coremail.18500469033@163.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56abaf44.86c3.19362571bee.Coremail.18500469033@163.com>

On Mon, Nov 25, 2024 at 04:01:36PM +0800, Dingyan Li wrote:
> Hi Experts,
> 
> Any thoughts on this patch?
> 
> Regards,

It looks fine to me.

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern

> At 2024-10-30 16:38:58, "Dingyan Li" <18500469033@163.com> wrote:
> >The meaning of this value is already used in several places,
> >but with constant values and comments to explain it separately.
> >It's better to have a central place to do this then use the macro
> >in those places for better readability.
> >
> >Signed-off-by: Dingyan Li <18500469033@163.com>
> >---
> > drivers/usb/gadget/function/f_tcm.c          | 8 ++------
> > drivers/usb/gadget/function/storage_common.h | 2 +-
> > drivers/usb/storage/transport.c              | 8 ++------
> > include/linux/usb/storage.h                  | 8 ++++++++
> > 4 files changed, 13 insertions(+), 13 deletions(-)
> >
> >diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/function/f_tcm.c
> >index 15bb3aa12aa8..e1914b20f816 100644
> >--- a/drivers/usb/gadget/function/f_tcm.c
> >+++ b/drivers/usb/gadget/function/f_tcm.c
> >@@ -441,14 +441,10 @@ static int usbg_bot_setup(struct usb_function *f,
> > 			pr_err("No LUNs configured?\n");
> > 			return -EINVAL;
> > 		}
> >-		/*
> >-		 * If 4 LUNs are present we return 3 i.e. LUN 0..3 can be
> >-		 * accessed. The upper limit is 0xf
> >-		 */
> > 		luns--;
> >-		if (luns > 0xf) {
> >+		if (luns > US_BULK_MAX_LUN_LIMIT) {
> > 			pr_info_once("Limiting the number of luns to 16\n");
> >-			luns = 0xf;
> >+			luns = US_BULK_MAX_LUN_LIMIT;
> > 		}
> > 		ret_lun = cdev->req->buf;
> > 		*ret_lun = luns;
> >diff --git a/drivers/usb/gadget/function/storage_common.h b/drivers/usb/gadget/function/storage_common.h
> >index ced5d2b09234..11ac785d5eee 100644
> >--- a/drivers/usb/gadget/function/storage_common.h
> >+++ b/drivers/usb/gadget/function/storage_common.h
> >@@ -131,7 +131,7 @@ static inline bool fsg_lun_is_open(struct fsg_lun *curlun)
> > #define FSG_BUFLEN	((u32)16384)
> > 
> > /* Maximal number of LUNs supported in mass storage function */
> >-#define FSG_MAX_LUNS	16
> >+#define FSG_MAX_LUNS	(US_BULK_MAX_LUN_LIMIT + 1)
> > 
> > enum fsg_buffer_state {
> > 	BUF_STATE_SENDING = -2,
> >diff --git a/drivers/usb/storage/transport.c b/drivers/usb/storage/transport.c
> >index 9d767f6bf722..e6bc8ecaecbb 100644
> >--- a/drivers/usb/storage/transport.c
> >+++ b/drivers/usb/storage/transport.c
> >@@ -1087,13 +1087,9 @@ int usb_stor_Bulk_max_lun(struct us_data *us)
> > 	usb_stor_dbg(us, "GetMaxLUN command result is %d, data is %d\n",
> > 		     result, us->iobuf[0]);
> > 
> >-	/*
> >-	 * If we have a successful request, return the result if valid. The
> >-	 * CBW LUN field is 4 bits wide, so the value reported by the device
> >-	 * should fit into that.
> >-	 */
> >+	/* If we have a successful request, return the result if valid. */
> > 	if (result > 0) {
> >-		if (us->iobuf[0] < 16) {
> >+		if (us->iobuf[0] <= US_BULK_MAX_LUN_LIMIT) {
> > 			return us->iobuf[0];
> > 		} else {
> > 			dev_info(&us->pusb_intf->dev,
> >diff --git a/include/linux/usb/storage.h b/include/linux/usb/storage.h
> >index 8539956bc2be..51be3bb8fccb 100644
> >--- a/include/linux/usb/storage.h
> >+++ b/include/linux/usb/storage.h
> >@@ -82,4 +82,12 @@ struct bulk_cs_wrap {
> > #define US_BULK_RESET_REQUEST   0xff
> > #define US_BULK_GET_MAX_LUN     0xfe
> > 
> >+/*
> >+ * If 4 LUNs are supported then the LUNs would be
> >+ * numbered from 0 to 3, and the return value for
> >+ * US_BULK_GET_MAX_LUN request would be 3. The valid
> >+ * LUN field is 4 bits wide, the upper limit is 0x0f.
> >+ */
> >+#define US_BULK_MAX_LUN_LIMIT   0x0f
> >+
> > #endif
> >-- 
> >2.25.1
> 
> -- 
> You received this message because you are subscribed to the Google Groups "USB Mass Storage on Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to usb-storage+unsubscribe@lists.one-eyed-alien.net.
> To view this discussion visit https://groups.google.com/a/lists.one-eyed-alien.net/d/msgid/usb-storage/56abaf44.86c3.19362571bee.Coremail.18500469033%40163.com.

