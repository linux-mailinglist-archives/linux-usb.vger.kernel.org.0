Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84E84318C56
	for <lists+linux-usb@lfdr.de>; Thu, 11 Feb 2021 14:44:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231347AbhBKNoW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 Feb 2021 08:44:22 -0500
Received: from www262.sakura.ne.jp ([202.181.97.72]:56986 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231592AbhBKNlc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 11 Feb 2021 08:41:32 -0500
Received: from fsav304.sakura.ne.jp (fsav304.sakura.ne.jp [153.120.85.135])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 11BDeUnU022892;
        Thu, 11 Feb 2021 22:40:30 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav304.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav304.sakura.ne.jp);
 Thu, 11 Feb 2021 22:40:29 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav304.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 11BDeT9h022889
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
        Thu, 11 Feb 2021 22:40:29 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [PATCH] usb: usbip: fix error handling of kthread_get_run()
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
To:     Shuah Khan <skhan@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>
Cc:     Hillf Danton <hdanton@sina.com>, linux-usb@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>
References: <000000000000414db905b6e9bae8@google.com>
 <20210205135707.4574-1-penguin-kernel@I-love.SAKURA.ne.jp>
 <6b2b9f7c-a412-0f52-3373-bc58d1e95ad9@linuxfoundation.org>
 <ee936421-66ea-c6a7-fa1e-d4077ab28ed0@i-love.sakura.ne.jp>
 <1f4b36a1-460e-1154-b46c-32ba72b88205@linuxfoundation.org>
 <dffdefc9-9499-2cd0-fce9-b084df1511af@i-love.sakura.ne.jp>
 <2f922e76-623e-1d87-17a5-c4a87dc8f2fc@linuxfoundation.org>
 <bb8f438f-8a77-2aac-cb2b-b2551f6a64b0@i-love.sakura.ne.jp>
 <f97b85c7-d319-0897-e0f1-29c4154ca060@linuxfoundation.org>
 <f8cae6b1-8f84-0e6a-7d9c-fc4aec68f07b@i-love.sakura.ne.jp>
 <16608833-02b7-7ba8-e9fc-7e45c87fc7f1@i-love.sakura.ne.jp>
Message-ID: <676d4518-0faa-9fab-15db-0db8d216d7fb@i-love.sakura.ne.jp>
Date:   Thu, 11 Feb 2021 22:40:28 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <16608833-02b7-7ba8-e9fc-7e45c87fc7f1@i-love.sakura.ne.jp>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2021/02/11 12:01, Tetsuo Handa wrote:
> On 2021/02/11 10:04, Tetsuo Handa wrote:
>> On 2021/02/11 5:15, Shuah Khan wrote:
>>> I you would like to fix this, please send me a complete fix.
>>
>> If you want to handle the unlikely "__kthread_create_on_node() fails without
>> being killed" case, such change ( the drivers/usb/usbip/vhci_sysfs.c portion in
>> https://syzkaller.appspot.com/x/patch.diff?x=16c3c090d00000 ) should be a separate
>> patch. Since this patch declares "Fixes: 9720b4bc76a83807 ("staging/usbip: convert to kthread")",
>> this patch intends for the minimal change and does not want to do extra things.
>>
> 
> If you want a complete fix, the (untested) diff will become large.

I guess that we need to serialize attach operation and reset/detach operations, for
it seems there is a race window that might result in "general protection fault in
tomoyo_socket_sendmsg_permission". Details follows...

> diff --git a/drivers/usb/usbip/vhci_sysfs.c b/drivers/usb/usbip/vhci_sysfs.c
> index be37aec250c2..0d10021c4186 100644
> --- a/drivers/usb/usbip/vhci_sysfs.c
> +++ b/drivers/usb/usbip/vhci_sysfs.c
> @@ -305,20 +305,22 @@ static ssize_t attach_store(struct device *dev, struct device_attribute *attr,
>  {
>  	struct socket *socket;
>  	int sockfd = 0;
>  	__u32 port = 0, pdev_nr = 0, rhport = 0, devid = 0, speed = 0;
>  	struct usb_hcd *hcd;
>  	struct vhci_hcd *vhci_hcd;
>  	struct vhci_device *vdev;
>  	struct vhci *vhci;
>  	int err;
>  	unsigned long flags;
> +	struct task_struct *tx;
> +	struct task_struct *rx;
>  
>  	/*
>  	 * @rhport: port number of vhci_hcd
>  	 * @sockfd: socket descriptor of an established TCP connection
>  	 * @devid: unique device identifier in a remote host
>  	 * @speed: usb device speed in a remote host
>  	 */
>  	if (sscanf(buf, "%u %u %u %u", &port, &sockfd, &devid, &speed) != 4)
>  		return -EINVAL;
>  	pdev_nr = port_to_pdev_nr(port);
> @@ -345,62 +347,83 @@ static ssize_t attach_store(struct device *dev, struct device_attribute *attr,
>  	if (speed == USB_SPEED_SUPER)
>  		vdev = &vhci->vhci_hcd_ss->vdev[rhport];
>  	else
>  		vdev = &vhci->vhci_hcd_hs->vdev[rhport];
>  
>  	/* Extract socket from fd. */
>  	socket = sockfd_lookup(sockfd, &err);
>  	if (!socket)
>  		return -EINVAL;
>  
> +	/* Create threads now. */
> +	rx = kthread_create(vhci_rx_loop, &vdev->ud, "vhci_rx");
> +	tx = kthread_create(vhci_tx_loop, &vdev->ud, "vhci_tx");
> +	if (IS_ERR(rx) || IS_ERR(tx))
> +		goto thread_error;
> +
>  	/* now need lock until setting vdev status as used */
>  
>  	/* begin a lock */
>  	spin_lock_irqsave(&vhci->lock, flags);
>  	spin_lock(&vdev->ud.lock);
>  
>  	if (vdev->ud.status != VDEV_ST_NULL) {
>  		/* end of the lock */
>  		spin_unlock(&vdev->ud.lock);
>  		spin_unlock_irqrestore(&vhci->lock, flags);
>  
> -		sockfd_put(socket);
> -
>  		dev_err(dev, "port %d already used\n", rhport);
>  		/*
>  		 * Will be retried from userspace
>  		 * if there's another free port.
>  		 */
> -		return -EBUSY;
> +		err = -EBUSY;
> +		goto thread_error;
>  	}
>  
>  	dev_info(dev, "pdev(%u) rhport(%u) sockfd(%d)\n",
>  		 pdev_nr, rhport, sockfd);
>  	dev_info(dev, "devid(%u) speed(%u) speed_str(%s)\n",
>  		 devid, speed, usb_speed_string(speed));
>  
>  	vdev->devid         = devid;
>  	vdev->speed         = speed;
>  	vdev->ud.sockfd     = sockfd;
>  	vdev->ud.tcp_socket = socket;
>  	vdev->ud.status     = VDEV_ST_NOTASSIGNED;
>  
>  	spin_unlock(&vdev->ud.lock);
>  	spin_unlock_irqrestore(&vhci->lock, flags);
>  	/* end the lock */
>  
> -	vdev->ud.tcp_rx = kthread_get_run(vhci_rx_loop, &vdev->ud, "vhci_rx");
> -	vdev->ud.tcp_tx = kthread_get_run(vhci_tx_loop, &vdev->ud, "vhci_tx");
> +	/* Start the threads. */
> +	get_task_struct(rx);
> +	vdev->ud.tcp_rx = rx;
> +	wake_up_process(rx);

Even this seemingly complete fix turned out to be incomplete.

kthread_get_run(vhci_rx_loop, &vdev->ud, "vhci_rx") creates a vhci_rx kernel thread
and immediately starts vhci_rx_loop() function. Then, vdev->ud.tcp_rx becomes non-NULL
because the vhci_rx kernel thread was successfully created. Then in vhci_rx_loop(),
vhci_rx_pdu(ud) will be called because kthread_should_stop() is false and
usbip_event_happened() is 0. In vhci_rx_pdu(), sock_recvmsg() is called from usbip_recv().

If the peer side of ud->tcp_socket already called shutdown(SHUT_WR), sock_recvmsg() detects
end of stream and returns 0. Then, vhci_rx_pdu() prints "connection closed" message and
calls usbip_event_add(ud, VDEV_EVENT_DOWN).
(Well, where is the code that verifies that tcp_socket is indeed a SOCK_STREAM socket?
If the file descriptor passed was a SOCK_DGRAM socket, sock_recvmsg() can't detect
end of stream...)

Now, kthread_get_run(vhci_tx_loop, &vdev->ud, "vhci_tx") creates a vhci_tx kernel thread
and immediately starts vhci_tx_loop() function. But if current thread which called
kthread_get_run() is preempted at this moment, vdev->ud.tcp_tx remains NULL despite
vhci_tx kernel thread was successfully created.

Then in vhci_tx_loop(), wait_event_interruptible() is called because kthread_should_stop()
is false and vhci_send_cmd_submit() is 0 and vhci_send_cmd_unlink() is 0. But the vhci_tx
kernel thread will call vhci_send_cmd_submit() again when list_empty(&vdev->priv_tx) becomes false.

Now, event_handler() is called by the usbip_event singlethreaded workqueue kernel thread
because the vhci_rx kernel thread called queue_work(usbip_queue, &usbip_work) from
usbip_event_add(). Since VDEV_EVENT_DOWN is defined as USBIP_EH_SHUTDOWN | USBIP_EH_RESET,
firstly ud->eh_ops.shutdown(ud) (which is mapped to vhci_shutdown_connection()) is called
and then ud->eh_ops.reset(ud) (which is mapped to vhci_device_reset()) is called.

In vhci_shutdown_connection(), it tries to shutdown the vhci_tx kernel thread and
the vhci_rx kernel thread before resetting vdev->ud.tcp_socket to NULL. But recall that
vdev->ud.tcp_tx can remains NULL due to preemption. As a result, despite the effort to handle
USBIP_EH_SHUTDOWN before USBIP_EH_RESET, kthread_stop_put(vdev->ud.tcp_tx) won't be called
before vdev->ud.tcp_socket = NULL is called.

When the vhci_tx kernel thread found that list_empty(&vdev->priv_tx) became false, it calls
vhci_send_cmd_submit() and triggers "general protection fault in tomoyo_socket_sendmsg_permission".
Therefore, I think

  "general protection fault in tomoyo_socket_sendmsg_permission" is a NULL pointer dereference
  which can happen if vhci_shutdown_connection() is called before vdev->ud.tcp_tx becomes non-NULL
  due to a race condition

and that the easiest way is to serialize attach operation and reset/detach operations using
a mutex, for event_handler() which calls reset/detach operations is a schedulable context.

> +	get_task_struct(tx);
> +	vdev->ud.tcp_tx = tx;
> +	wake_up_process(tx);

Maybe just grouping assignment of vdev->ud.tcp_socket, vdev->ud.status, vdev->ud.tcp_{rx,tx}
within one spinlock-protected section might be fine? But since vhci_port_disconnect() from
detach_store() seems to be racy with attach_store() (vhci_port_disconnect() can trigger
vhci_shutdown_connection() via usbip_event_add(&vdev->ud, VDEV_EVENT_DOWN) as soon as
attach_store() did vdev->ud.status = VDEV_ST_NOTASSIGNED), I suggest using a killable mutex
for serialization purpose is simpler and safer.

>  
>  	rh_port_connect(vdev, speed);
>  
>  	return count;
> +thread_error:
> +	sockfd_put(socket);
> +	if (IS_ERR(rx))
> +		err = PTR_ERR(rx);
> +	else
> +		kthread_stop(rx);
> +	if (IS_ERR(tx))
> +		err = PTR_ERR(tx);
> +	else
> +		kthread_stop(tx);
> +	return err;
>  }
>  static DEVICE_ATTR_WO(attach);
>  
>  #define MAX_STATUS_NAME 16
>  
>  struct status_attr {
>  	struct device_attribute attr;
>  	char name[MAX_STATUS_NAME+1];
>  };
>  

