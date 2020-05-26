Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 487831D32A6
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2020 16:22:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727095AbgENOWj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 May 2020 10:22:39 -0400
Received: from netrider.rowland.org ([192.131.102.5]:42273 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726073AbgENOWi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 May 2020 10:22:38 -0400
Received: (qmail 14203 invoked by uid 500); 14 May 2020 10:22:37 -0400
Date:   Thu, 14 May 2020 10:22:37 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Macpaul Lin <macpaul.lin@mediatek.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Sergey Organov <sorganov@gmail.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Mediatek WSD Upstream <wsd_upstream@mediatek.com>,
        Macpaul Lin <macpaul.lin@gmail.com>,
        Stan Lu <stan.lu@mediatek.com>
Subject: Re: [PATCH] usb: gadget: u_serial: fix coverity warning: negative
 index at array
Message-ID: <20200514142237.GB12181@rowland.harvard.edu>
References: <1589443500-3990-1-git-send-email-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1589443500-3990-1-git-send-email-macpaul.lin@mediatek.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 14, 2020 at 04:05:00PM +0800, Macpaul Lin wrote:
> This issue has been reported by coverity scanner.
> Replace "int portnum" by "unsigned int", this void negative index at
> array.

Can you please explain this more fully?  Why does coverity think the 
code might use a negative array index?  Is there some possibility that 
the portnum value might actually be negative?

It's noticeable that your patch doesn't actually change any values, only 
the type.  This means that if the code was buggy before, it's still 
buggy.  Alternatively, if the code wasn't buggy before then coverity got 
a false positive, so no change should be needed.

Alan Stern

> Signed-off-by: Stan Lu <stan.lu@mediatek.com>
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  drivers/usb/gadget/function/u_serial.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
> index 8167d37..53951f2 100644
> --- a/drivers/usb/gadget/function/u_serial.c
> +++ b/drivers/usb/gadget/function/u_serial.c
> @@ -587,7 +587,7 @@ static int gs_start_io(struct gs_port *port)
>   */
>  static int gs_open(struct tty_struct *tty, struct file *file)
>  {
> -	int		port_num = tty->index;
> +	unsigned int	port_num = tty->index;
>  	struct gs_port	*port;
>  	int		status = 0;
>  
> @@ -1211,7 +1211,7 @@ int gserial_alloc_line_no_console(unsigned char *line_num)
>  	struct gs_port			*port;
>  	struct device			*tty_dev;
>  	int				ret;
> -	int				port_num;
> +	unsigned int			port_num;
>  
>  	coding.dwDTERate = cpu_to_le32(9600);
>  	coding.bCharFormat = 8;
> -- 
> 1.7.9.5
