Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AC1E186A18
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2020 12:32:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730801AbgCPLcK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Mar 2020 07:32:10 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:47634 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730759AbgCPLcK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Mar 2020 07:32:10 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 4A396291A6E
Subject: Re: [PATCH 1/2] Staging: media: rkisp1: reduce comments width bellow
 80 chars
To:     Enrique Vargas <jevargas@seas.upenn.edu>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        outreachy-kernel@googlegroups.com
Cc:     linux-usb@vger.kernel.org
References: <cover.1584298430.git.jevargas@seas.upenn.edu>
 <5e08334eae9ca864dbb09c02291fd72687681c39.1584298430.git.jevargas@seas.upenn.edu>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <6a89e7a9-6571-1925-f312-26687fec7ca1@collabora.com>
Date:   Mon, 16 Mar 2020 08:32:02 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <5e08334eae9ca864dbb09c02291fd72687681c39.1584298430.git.jevargas@seas.upenn.edu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Enric,

On 3/15/20 4:00 PM, Enrique Vargas wrote:
> Make 'Main Picture Path' part of block diagram on separate rows to avoid
> 80 chars WARNING found with checkpatch.
> 
> Signed-off-by: Enrique Vargas <jevargas@seas.upenn.edu>
> ---
>  drivers/staging/media/rkisp1/rkisp1-dev.c | 57 ++++++++++++++++-------
>  1 file changed, 39 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-dev.c b/drivers/staging/media/rkisp1/rkisp1-dev.c
> index 558126e66465..194fc33941f0 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-dev.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-dev.c
> @@ -37,26 +37,47 @@
>   *
>   * ISP Block Diagram
>   * -----------------
> - *                                                             rkisp1-resizer.c          rkisp1-capture.c
> - *                                                          |====================|  |=======================|
> - *                                rkisp1-isp.c                              Main Picture Path
> - *                        |==========================|      |===============================================|
> - *                        +-----------+  +--+--+--+--+      +--------+  +--------+              +-----------+
> - *                        |           |  |  |  |  |  |      |        |  |        |              |           |
> - * +--------+    |\       |           |  |  |  |  |  |   -->|  Crop  |->|  RSZ   |------------->|           |
> - * |  MIPI  |--->|  \     |           |  |  |  |  |  |   |  |        |  |        |              |           |
> - * +--------+    |   |    |           |  |IE|IE|IE|IE|   |  +--------+  +--------+              |  Memory   |
> - *               |MUX|--->|    ISP    |->|0 |1 |2 |3 |---+                                      | Interface |
> - * +--------+    |   |    |           |  |  |  |  |  |   |  +--------+  +--------+  +--------+  |           |
> - * |Parallel|--->|  /     |           |  |  |  |  |  |   |  |        |  |        |  |        |  |           |
> - * +--------+    |/       |           |  |  |  |  |  |   -->|  Crop  |->|  RSZ   |->|  RGB   |->|           |
> - *                        |           |  |  |  |  |  |      |        |  |        |  | Rotate |  |           |
> - *                        +-----------+  +--+--+--+--+      +--------+  +--------+  +--------+  +-----------+

To be honest, I prefer the old way, I think it is easier to visualize.
But lets see what others think.


> + *                                                          
> + *                                                          
> + *                                rkisp1-isp.c              
> + *                        |==========================|      
> + *                        +-----------+  +--+--+--+--+   
> + *                        |           |  |  |  |  |  |   
> + * +--------+    |\       |           |  |  |  |  |  |   
> + * |  MIPI  |--->|  \     |           |  |  |  |  |  |   
> + * +--------+    |   |    |           |  |IE|IE|IE|IE|   
> + *               |MUX|--->|    ISP    |->|0 |1 |2 |3 |--[A]--
> + * +--------+    |   |    |           |  |  |  |  |  |   
> + * |Parallel|--->|  /     |           |  |  |  |  |  |   
> + * +--------+    |/       |           |  |  |  |  |  |   
> + *                        |           |  |  |  |  |  |   
> + *                        +-----------+  +--+--+--+--+   

You can eliminate the trailing spaces in this patch, since it was generated due to this
line break, so you don't need the second patch.

Regards,
Helen

>   *                                               ^
> - * +--------+                                    |          |===============================================|
> - * |  DMA   |------------------------------------+                          Self Picture Path
> + * +--------+                                    |       
> + * |  DMA   |------------------------------------+       
>   * +--------+
> - *
> + * 
> + * 
> + *              rkisp1-resizer.c          rkisp1-capture.c
> + *            |====================|  |=======================|
> + *                         Main Picture Path
> + *            |===============================================|
> + *            +--------+  +--------+              +-----------+
> + *            |        |  |        |              |           |
> + *         -->|  Crop  |->|  RSZ   |------------->|           |
> + *         |  |        |  |        |              |           |
> + *         |  +--------+  +--------+              |  Memory   |
> + * --[A]---+                                      | Interface |
> + *         |  +--------+  +--------+  +--------+  |           |
> + *         |  |        |  |        |  |        |  |           |
> + *         -->|  Crop  |->|  RSZ   |->|  RGB   |->|           |
> + *            |        |  |        |  | Rotate |  |           |
> + *            +--------+  +--------+  +--------+  +-----------+
> + *  
> + *            |===============================================|
> + *                          Self Picture Path
> + * 
> + * 
>   *         rkisp1-stats.c        rkisp1-params.c
>   *       |===============|      |===============|
>   *       +---------------+      +---------------+
> 


