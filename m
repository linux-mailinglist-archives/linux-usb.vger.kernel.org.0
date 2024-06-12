Return-Path: <linux-usb+bounces-11190-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5279051DE
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jun 2024 14:00:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46E1E1C21DB8
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jun 2024 12:00:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6E1816D306;
	Wed, 12 Jun 2024 12:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inbox.lv header.i=@inbox.lv header.b="BFt8zW9s"
X-Original-To: linux-usb@vger.kernel.org
Received: from shark4.inbox.lv (shark4.inbox.lv [194.152.32.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711BB5B5B6
	for <linux-usb@vger.kernel.org>; Wed, 12 Jun 2024 12:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.152.32.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718193647; cv=none; b=jRdc33IDRZMBKfVDvhy9NgDqAgdst8GrHfbO5gtYd0EAzFtQh/LqYa0EpP16LMQ+AwtH70oMGeVw4oQrcYmor3cbRuqlVGEL74jcMHjqoSgbLp4KujWkVFam7l7R1MOXe2WZteNtqr8GL0z4sy9lFhBkWnL4+G2aLPZUpeCrXug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718193647; c=relaxed/simple;
	bh=C744nMJ9dF4aBnWE1p/TPdh7OeK1MGdBTT7ve/WMjDA=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=LgI0+WjZaD0YSNm1auxG8fJYACbNMMmsF+bfq8gHGO9Kied/RzxyAj7AIeFbNJP/guXiKBoehfI+QUfTHBGTknmh2SBf22eB8fx+WKQnd2AfAearXTJB9PGhgqM8Q+LaJ/uJBD9MW74gpF4Od/72jvROi9T1r2tKrp/iU22Gl88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=inbox.lv; spf=pass smtp.mailfrom=inbox.lv; dkim=pass (1024-bit key) header.d=inbox.lv header.i=@inbox.lv header.b=BFt8zW9s; arc=none smtp.client-ip=194.152.32.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=inbox.lv
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inbox.lv
Received: by shark4.inbox.lv (Postfix, from userid 2004)
	id 4VzkdL17ySz5vVH; Wed, 12 Jun 2024 15:00:38 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=inbox.lv;
	s=p20220324; t=1718193638; x=1718195438;
	bh=C744nMJ9dF4aBnWE1p/TPdh7OeK1MGdBTT7ve/WMjDA=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Content-Type:X-ESPOL:From:Date:To:Cc:Message-ID:Subject:Reply-To;
	b=BFt8zW9s/ng6xN5xJP17Xgw6eBTINfORIYXGQ34mAYGlLwt4EbTEgRdc+j5DFA+RU
	 42qoO/oZdMb+zQE3s55bNFKuMJCdXP6GE4U/IT0dr2ruVUyggBL2Y9XMUTUzz6Z92O
	 hzAqlidx/YJx1rgIIupeoXpKN/GqBtuenT6ZRCfY=
Received: from w4 (w4 [127.0.0.1])
	by shark4-in.inbox.lv (Postfix) with ESMTP id 4VzkdL05vYz5vPN;
	Wed, 12 Jun 2024 15:00:38 +0300 (EEST)
Date: Wed, 12 Jun 2024 15:00:38 +0300 (EEST)
From: Dmitry Smirnov <d.smirnov@inbox.lv>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Message-ID: <566070497.245859.1718193638009@w4>
In-Reply-To: <2024061214-concerned-retention-a91c@gregkh>
References: <2024061214-concerned-retention-a91c@gregkh> <20240611172311.2498-1-d.smirnov@inbox.lv>
Subject: Re: Re: [PATCH V3] usb: mos7840: Fix hangup after suspend
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_245858_1556217327.1718193638008"
X-ESPOL: G4mESnoDkHBYucK2NYVo+4GXy9evJSQu4Ha6l7ksmgFUytXdxa0GfRPzB+abFAO4cWLc/snbagVWkLKOcEovbiDan22cSIu2Pks=

------=_Part_245858_1556217327.1718193638008
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<html>
 <head></head>
 <body>
   Do I need to resubmit as V4 after the fix, or just can attach a new version to this thread? 
  <br> 
  <br> --- 
  <br> Dmitry 
  <br> &nbsp; 
  <div class="noTransl_fa84df616cd531b81ba9e1cd2e446b82">
    ----- Reply to message ----- 
   <br> 
   <strong>Subject:</strong> Re: [PATCH V3] usb: mos7840: Fix hangup after suspend 
   <br> 
   <strong>Date:</strong> Wed, Jun 12, 2024, 10:56 
   <br> 
   <strong>From:</strong> Greg KH &lt; 
   <a href="mailto:gregkh@linuxfoundation.org" target="_blank" rel="noopener noreferrer">gregkh@linuxfoundation.org</a>&gt; 
   <br> 
   <strong>To:</strong> Dmitry Smirnov &lt; 
   <a href="mailto:d.smirnov@inbox.lv" target="_blank" rel="noopener noreferrer">d.smirnov@inbox.lv</a>&gt; 
  </div> &nbsp; 
  <blockquote>
    On Tue, Jun 11, 2024 at 08:23:11PM +0300, Dmitry Smirnov wrote: 
   <br> &gt; This patch addresses a kernel hang issue with the mos7840 driver when 
   <br> &gt; PC resuming from a suspend with a device connected to the serial port. 
   <br> &gt; 
   <br> &gt; This patch introduces two new functions: mos7840_suspend() and mos7840_resume(). 
   <br> &gt; 
   <br> &gt; Tested with Delock 87414 USB 2.0 to 4x serial adapter. 
   <br> &gt; 
   <br> &gt; Signed-off-by: Dmitry Smirnov 
   <br> &gt; --- 
   <br> &gt; V3: Addressed review comments from previous submits 
   <br> &gt; 
   <br> &gt; drivers/usb/serial/mos7840.c | 51 ++++++++++++++++++++++++++++++++++++ 
   <br> &gt; 1 file changed, 51 insertions(+) 
   <br> &gt; 
   <br> &gt; diff --git a/drivers/usb/serial/mos7840.c b/drivers/usb/serial/mos7840.c 
   <br> &gt; index 8b0308d84270..3e5f761f4925 100644 
   <br> &gt; --- a/drivers/usb/serial/mos7840.c 
   <br> &gt; +++ b/drivers/usb/serial/mos7840.c 
   <br> &gt; @@ -1737,6 +1737,55 @@ static void mos7840_port_remove(struct usb_serial_port *port) 
   <br> &gt; kfree(mos7840_port); 
   <br> &gt; } 
   <br> &gt; 
   <br> &gt; +static int mos7840_suspend(struct usb_serial *serial, pm_message_t message) 
   <br> &gt; +{ 
   <br> &gt; + struct moschip_port *mos7840_port; 
   <br> &gt; + struct usb_serial_port *port; 
   <br> &gt; + int i; 
   <br> &gt; + 
   <br> &gt; + dev_dbg(&amp;serial-&gt;interface-&gt;dev, "mos7840_suspend\\n"); 
   <br> 
   <br> ftrace is your friend, there is no need for debug lines like this 
   <br> anymore. 
   <br> 
   <br> &gt; + 
   <br> &gt; + for (i = 0; i &lt; serial-&gt;num_ports; ++i) { 
   <br> &gt; + port = serial-&gt;port[i]; 
   <br> &gt; + if (!tty_port_initialized(&amp;port-&gt;port)) 
   <br> &gt; + continue; 
   <br> &gt; + 
   <br> &gt; + mos7840_port = usb_get_serial_port_data(port); 
   <br> &gt; + 
   <br> &gt; + usb_kill_urb(mos7840_port-&gt;read_urb); 
   <br> &gt; + mos7840_port-&gt;read_urb_busy = false; 
   <br> &gt; + } 
   <br> &gt; + return 0; 
   <br> &gt; +} 
   <br> &gt; + 
   <br> &gt; +static int mos7840_resume(struct usb_serial *serial) 
   <br> &gt; +{ 
   <br> &gt; + struct moschip_port *mos7840_port; 
   <br> &gt; + struct usb_serial_port *port; 
   <br> &gt; + int res; 
   <br> &gt; + int i; 
   <br> &gt; + 
   <br> &gt; + dev_dbg(&amp;serial-&gt;interface-&gt;dev, "mos7840_resume\\n"); 
   <br> 
   <br> Same here, not needed. 
   <br> 
   <br> thanks, 
   <br> 
   <br> greg k-h 
  </blockquote> 
 </body>
</html>
------=_Part_245858_1556217327.1718193638008--

