Return-Path: <linux-usb+bounces-3584-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EED0480138C
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 20:28:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 813ACB21152
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 19:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C351351023;
	Fri,  1 Dec 2023 19:28:50 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 0BC2010DB
	for <linux-usb@vger.kernel.org>; Fri,  1 Dec 2023 11:28:46 -0800 (PST)
Received: (qmail 298503 invoked by uid 1000); 1 Dec 2023 14:28:46 -0500
Date: Fri, 1 Dec 2023 14:28:46 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Douglas Anderson <dianders@chromium.org>
Cc: linux-usb@vger.kernel.org,
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
  "David S . Miller" <davem@davemloft.net>,
  Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
  Paolo Abeni <pabeni@redhat.com>, Grant Grundler <grundler@chromium.org>,
  Hayes Wang <hayeswang@realtek.com>, Simon Horman <horms@kernel.org>,
  =?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>, netdev@vger.kernel.org,
  Brian Geffon <bgeffon@google.com>, Hans de Goede <hdegoede@redhat.com>,
  Heikki Krogerus <heikki.krogerus@linux.intel.com>,
  "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] usb: core: Don't force USB generic_subclass
 drivers to define probe()
Message-ID: <59c5c190-234c-42d4-9a44-eadba4b717f0@rowland.harvard.edu>
References: <20231201183113.343256-1-dianders@chromium.org>
 <20231201102946.v2.1.I7ea0dd55ee2acdb48b0e6d28c1a704ab2c29206f@changeid>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201102946.v2.1.I7ea0dd55ee2acdb48b0e6d28c1a704ab2c29206f@changeid>

On Fri, Dec 01, 2023 at 10:29:50AM -0800, Douglas Anderson wrote:
> There's no real reason that subclassed USB drivers _need_ to define
> probe() since they might want to subclass for some other reason. Make
> it optional to define probe() if we're a generic_subclass.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

> Changes in v2:
> - ("Don't force USB generic_subclass drivers to define ...") new for v2.
> 
>  drivers/usb/core/driver.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
> index f58a0299fb3b..1dc0c0413043 100644
> --- a/drivers/usb/core/driver.c
> +++ b/drivers/usb/core/driver.c
> @@ -290,7 +290,10 @@ static int usb_probe_device(struct device *dev)
>  	 * specialised device drivers prior to setting the
>  	 * use_generic_driver bit.
>  	 */
> -	error = udriver->probe(udev);
> +	if (udriver->probe)
> +		error = udriver->probe(udev);
> +	else if (!udriver->generic_subclass)
> +		error = -EINVAL;
>  	if (error == -ENODEV && udriver != &usb_generic_driver &&
>  	    (udriver->id_table || udriver->match)) {
>  		udev->use_generic_driver = 1;
> -- 
> 2.43.0.rc2.451.g8631bc7472-goog
> 

